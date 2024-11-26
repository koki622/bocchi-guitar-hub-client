import 'package:audio_session/audio_session.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/separated_audio/separated_audio.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MultiTrackPlayer extends StatefulWidget {
  final SeparatedAudio separatedAudio;

  // コンストラクタで音声ファイルのパスを受け取る
  MultiTrackPlayer({required this.separatedAudio});

  @override
  _MultiTrackPlayerState createState() => _MultiTrackPlayerState();
}

class _MultiTrackPlayerState extends State<MultiTrackPlayer> {
  late AudioPlayer vocalsPlayer;
  late AudioPlayer drumsPlayer;
  late AudioPlayer bassPlayer;
  late AudioPlayer guitarPlayer;
  late AudioPlayer pianoPlayer;
  late AudioPlayer otherPlayer;

  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;
  bool isPlaying = false; // 再生状態を追跡

  @override
  void initState() {
    super.initState();
    const loadControl = AndroidLoadControl(
      minBufferDuration: const Duration(seconds: 600),
      maxBufferDuration: const Duration(seconds: 800), // 必要に応じて増やす
      bufferForPlaybackDuration: const Duration(seconds: 600),
      bufferForPlaybackAfterRebufferDuration: const Duration(seconds: 600),
      prioritizeTimeOverSizeThresholds: false, // 時間優先でバッファリングの安定化
    );
    const loadConfiguration =
        AudioLoadConfiguration(androidLoadControl: loadControl);

    vocalsPlayer = AudioPlayer(audioLoadConfiguration: loadConfiguration);
    drumsPlayer = AudioPlayer(audioLoadConfiguration: loadConfiguration);
    bassPlayer = AudioPlayer(audioLoadConfiguration: loadConfiguration);
    guitarPlayer = AudioPlayer(audioLoadConfiguration: loadConfiguration);
    pianoPlayer = AudioPlayer(audioLoadConfiguration: loadConfiguration);
    otherPlayer = AudioPlayer(audioLoadConfiguration: loadConfiguration);

    _initializePlayers();
  }

  Future<void> _initializePlayers() async {
    //final session = await AudioSession.instance;
    //await session.configure(AudioSessionConfiguration.music());　音質悪くなる
    await vocalsPlayer.setFilePath(widget.separatedAudio.vocalsPath);
    //await vocalsPlayer.load();
    await drumsPlayer.setFilePath(widget.separatedAudio.drumsPath);
    //await drumsPlayer.load();
    await bassPlayer.setFilePath(widget.separatedAudio.bassPath);
    //await bassPlayer.load();
    await guitarPlayer.setFilePath(widget.separatedAudio.guitarPath);
    //await guitarPlayer.load();
    await pianoPlayer.setFilePath(widget.separatedAudio.pianoPath);
    //await pianoPlayer.load();
    await otherPlayer.setFilePath(widget.separatedAudio.otherPath);
    //await otherPlayer.load();

    totalDuration = vocalsPlayer.duration ?? Duration.zero;

    _updatePositionStream();
  }

  // 全プレイヤーの位置を監視して、ズレがあれば修正する
  void _updatePositionStream() {
    // 各プレイヤーの位置を確認
    vocalsPlayer
        .createPositionStream(
      steps: 1000,
      minPeriod: Duration(milliseconds: 16),
      maxPeriod: Duration(milliseconds: 16),
    )
        .listen((position) {
      setState(() {
        currentPosition = position;
      });

      // 再生位置のズレが1ミリ秒を超えた場合、同期を取る
      _syncPlayers(position);
    });
  }

  // 再生位置の同期を取る
  Future<void> _syncPlayers(Duration position) async {
    // 他のプレイヤーの再生位置と比較
    /**
     * 
    await Future.wait([
      _seekIfNeeded(vocalsPlayer, position),
      _seekIfNeeded(drumsPlayer, position),
      _seekIfNeeded(bassPlayer, position),
      _seekIfNeeded(guitarPlayer, position),
      _seekIfNeeded(pianoPlayer, position),
      _seekIfNeeded(otherPlayer, position),
    ]);
     */
    _seekIfNeeded(vocalsPlayer, position);
    _seekIfNeeded(drumsPlayer, position);
    _seekIfNeeded(bassPlayer, position);
    _seekIfNeeded(guitarPlayer, position);
    _seekIfNeeded(pianoPlayer, position);
    _seekIfNeeded(otherPlayer, position);
  }

  // プレイヤーが指定された位置とずれていたら位置を調整
  Future<void> _seekIfNeeded(AudioPlayer player, Duration position) async {
    if ((player.position - position).inMilliseconds.abs() > 10) {
      player.seek(position);
      print('位置補正');
    }
  }

  Future<void> _playAll() async {
    /**
     * 
    await Future.wait([
      vocalsPlayer.play(),
      drumsPlayer.play(),
      bassPlayer.play(),
      guitarPlayer.play(),
      pianoPlayer.play(),
      otherPlayer.play(),
    ]);
     */
    vocalsPlayer.play();
    drumsPlayer.play();
    bassPlayer.play();
    guitarPlayer.play();
    pianoPlayer.play();
    otherPlayer.play();
    setState(() {
      isPlaying = true;
    });
  }

  Future<void> _pauseAll() async {
    await Future.wait([
      vocalsPlayer.pause(),
      drumsPlayer.pause(),
      bassPlayer.pause(),
      guitarPlayer.pause(),
      pianoPlayer.pause(),
      otherPlayer.pause(),
    ]);
    setState(() {
      isPlaying = false;
    });
  }

  Future<void> _stopAll() async {
    await Future.wait([
      vocalsPlayer.stop(),
      drumsPlayer.stop(),
      bassPlayer.stop(),
      guitarPlayer.stop(),
      pianoPlayer.stop(),
      otherPlayer.stop(),
    ]);
    setState(() {
      currentPosition = Duration.zero;
      isPlaying = false;
    });
  }

  Future<void> _seekAll(Duration position) async {
    await Future.wait([
      vocalsPlayer.seek(position),
      drumsPlayer.seek(position),
      bassPlayer.seek(position),
      guitarPlayer.seek(position),
      pianoPlayer.seek(position),
      otherPlayer.seek(position),
    ]);
  }

  @override
  void dispose() {
    vocalsPlayer.dispose();
    drumsPlayer.dispose();
    bassPlayer.dispose();
    guitarPlayer.dispose();
    pianoPlayer.dispose();
    otherPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('パート別音源再生プレイヤー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: isPlaying ? _pauseAll : _playAll, // 再生状態に応じて切り替え
              child: Text(isPlaying ? '一時停止' : '再生'), // 再生中か停止中かで表示を切り替え
            ),
            ElevatedButton(
              onPressed: _stopAll,
              child: Text('停止'),
            ),
            SizedBox(height: 20),
            Text('再生位置 (ms)'),
            Text(
              '${currentPosition.inMilliseconds}', // ミリ秒を表示
              style: TextStyle(fontSize: 24),
            ),
            Slider(
              min: 0.0,
              max: totalDuration.inMilliseconds.toDouble(),
              value: currentPosition.inMilliseconds.toDouble(),
              onChanged: (value) async {
                Duration newPosition = Duration(milliseconds: value.toInt());
                await _seekAll(newPosition);
                setState(() {
                  currentPosition = newPosition;
                });
              },
              label:
                  '${currentPosition.inMilliseconds} ms', // ミリ秒単位でスライダーラベルを表示
            ),
            SizedBox(height: 20),
            _buildVolumeSlider('ボーカル', vocalsPlayer),
            _buildVolumeSlider('ドラム', drumsPlayer),
            _buildVolumeSlider('ベース', bassPlayer),
            _buildVolumeSlider('ギター', guitarPlayer),
            _buildVolumeSlider('ピアノ', pianoPlayer),
            _buildVolumeSlider('その他', otherPlayer),
          ],
        ),
      ),
    );
  }

  Widget _buildVolumeSlider(String label, AudioPlayer player) {
    return Column(
      children: [
        Text(label),
        Slider(
          min: 0.0,
          max: 1.0,
          value: player.volume,
          onChanged: (value) {
            setState(() {
              player.setVolume(value);
            });
          },
          label: "$label 音量",
        ),
      ],
    );
  }
}
