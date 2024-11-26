import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/separated_audio/separated_audio.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MultiTrackPlayer extends StatefulWidget {
  final SeparatedAudio separatedAudio;

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
  late Future<void> _loadingFuture;

  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    vocalsPlayer = AudioPlayer();
    drumsPlayer = AudioPlayer();
    bassPlayer = AudioPlayer();
    guitarPlayer = AudioPlayer();
    pianoPlayer = AudioPlayer();
    otherPlayer = AudioPlayer();

    _loadingFuture = _initializePlayers();

    // 再生位置が更新されるたびに呼ばれるリスナーを登録
    [
      vocalsPlayer,
      drumsPlayer,
      bassPlayer,
      guitarPlayer,
      pianoPlayer,
      otherPlayer
    ].forEach((player) {
      player.onPositionChanged.listen((position) {
        setState(() {
          _currentPosition = position;
        });
      });
      player.onDurationChanged.listen((duration) {
        setState(() {
          _totalDuration = duration;
        });
      });
    });
  }

  // 各音声ファイルのロードを完了させてから再生を開始
  Future<void> _initializePlayers() async {
    await Future.wait([
      vocalsPlayer.setPlayerMode(PlayerMode.lowLatency),
      vocalsPlayer
          .setSource(DeviceFileSource(widget.separatedAudio.vocalsPath)),
      drumsPlayer.setPlayerMode(PlayerMode.lowLatency),
      drumsPlayer.setSource(DeviceFileSource(widget.separatedAudio.drumsPath)),
      bassPlayer.setPlayerMode(PlayerMode.lowLatency),
      bassPlayer.setSource(DeviceFileSource(widget.separatedAudio.bassPath)),
      guitarPlayer.setPlayerMode(PlayerMode.lowLatency),
      guitarPlayer
          .setSource(DeviceFileSource(widget.separatedAudio.guitarPath)),
      pianoPlayer.setPlayerMode(PlayerMode.lowLatency),
      pianoPlayer.setSource(DeviceFileSource(widget.separatedAudio.pianoPath)),
      otherPlayer.setPlayerMode(PlayerMode.lowLatency),
      otherPlayer.setSource(DeviceFileSource(widget.separatedAudio.otherPath)),
    ]);
  }

  Future<void> _playAll() async {
    // 再生中でない場合にのみ再生
    if (await vocalsPlayer.state != PlayerState.playing) {
      await vocalsPlayer.resume();
    }
    if (await drumsPlayer.state != PlayerState.playing) {
      await drumsPlayer.resume();
    }
    if (await bassPlayer.state != PlayerState.playing) {
      await bassPlayer.resume();
    }
    if (await guitarPlayer.state != PlayerState.playing) {
      await guitarPlayer.resume();
    }
    if (await pianoPlayer.state != PlayerState.playing) {
      await pianoPlayer.resume();
    }
    if (await otherPlayer.state != PlayerState.playing) {
      await otherPlayer.resume();
    }
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
      _currentPosition = Duration.zero;
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
        title: Text('Multi-track Player'),
      ),
      body: FutureBuilder<void>(
        future: _loadingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('ロードエラーが発生しました'));
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _playAll,
                    child: Text('Play All'),
                  ),
                  ElevatedButton(
                    onPressed: _pauseAll,
                    child: Text('Pause All'),
                  ),
                  ElevatedButton(
                    onPressed: _stopAll,
                    child: Text('Stop All'),
                  ),
                  SizedBox(height: 20),
                  Slider(
                    min: 0.0,
                    max: _totalDuration.inSeconds.toDouble(),
                    value: _currentPosition.inSeconds.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        _seekAll(Duration(seconds: value.toInt()));
                      });
                    },
                    label:
                        "${_currentPosition.inMinutes}:${(_currentPosition.inSeconds % 60).toString().padLeft(2, '0')}",
                  ),
                  SizedBox(height: 20),
                  _buildVolumeSlider('Vocals', vocalsPlayer),
                  _buildVolumeSlider('Drums', drumsPlayer),
                  _buildVolumeSlider('Bass', bassPlayer),
                  _buildVolumeSlider('Guitar', guitarPlayer),
                  _buildVolumeSlider('Piano', pianoPlayer),
                  _buildVolumeSlider('Other', otherPlayer),
                ],
              ),
            );
          }
        },
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
          label: "$label Volume",
        ),
      ],
    );
  }
}
