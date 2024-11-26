import 'dart:async';

import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/click_sound.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord_sound.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/separated_audio/separated_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

class MultiTrackPlayer extends StatefulWidget {
  final SeparatedAudio separatedAudio;
  final ClickSound clickSound;
  final ChordSound chordSound;

  // コンストラクタで音声ファイルのパスを受け取る
  MultiTrackPlayer(
      {required this.separatedAudio,
      required this.clickSound,
      required this.chordSound});

  @override
  _MultiTrackPlayerState createState() => _MultiTrackPlayerState();
}

class _MultiTrackPlayerState extends State<MultiTrackPlayer> {
  SoLoud? _soloud;
  AudioSource? _click;
  AudioSource? _chord;
  AudioSource? _vocal;
  AudioSource? _drum;
  AudioSource? _bass;
  AudioSource? _guitar;
  AudioSource? _piano;
  AudioSource? _other;
  SoundHandle? _clickHandle;
  SoundHandle? _chordHandle;
  SoundHandle? _vocalHandle;
  SoundHandle? _drumHandle;
  SoundHandle? _bassHandle;
  SoundHandle? _guitarHandle;
  SoundHandle? _pianoHandle;
  SoundHandle? _otherHandle;
  SoundHandle? _separatedAudioHandle;
  SoundHandle? _soundHandle;
  Duration _currentPosition = Duration.zero;
  Duration? _totalDuration;
  bool _isPlaying = false; // 再生状態を追跡
  bool _isInitialized = false; // 初期化が完了したかどうかを管理するフラグ
  Timer? _timer;

  double _vocalVolume = 1.0;
  double _drumVolume = 1.0;
  double _bassVolume = 1.0;
  double _guitarVolume = 1.0;
  double _pianoVolume = 1.0;
  double _otherVolume = 1.0;

  // クリック音のオンオフフラグ
  bool _isClickSoundOn = false;
  double _clickVolume = 0.0; // クリック音の音量
  double _previousClickVolume = 1.0; // クリック音がオフになる前の音量

  // コード音声のオンオフフラグ
  bool _isChordSoundOn = false;
  double _chordSoundVolume = 0.0;
  double _previousChordSoundVolume = 1.0;

  // クリック音の設定を操作するタブの表示状態
  bool _isClickSoundTabOpen = false;

  // 再生速度設定用の変数（デフォルトは1.0倍速）
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _initializePlayers();
  }

  Future<void> _initializePlayers() async {
    _soloud = SoLoud.instance;
    await _soloud!.init(bufferSize: 512);
    //_soloud!.filters.pitchShiftFilter.activate();
    // 各AudioSourceに代入
    _click = await _soloud!
        .loadFile(widget.clickSound.normalClickPath, mode: LoadMode.disk);
    _chord = await _soloud!
        .loadFile(widget.chordSound.filePath, mode: LoadMode.disk);
    _vocal = await _soloud!
        .loadFile(widget.separatedAudio.vocalsPath, mode: LoadMode.disk);
    _drum = await _soloud!
        .loadFile(widget.separatedAudio.drumsPath, mode: LoadMode.disk);
    _bass = await _soloud!
        .loadFile(widget.separatedAudio.bassPath, mode: LoadMode.disk);
    _guitar = await _soloud!
        .loadFile(widget.separatedAudio.guitarPath, mode: LoadMode.disk);
    _piano = await _soloud!
        .loadFile(widget.separatedAudio.pianoPath, mode: LoadMode.disk);
    _other = await _soloud!
        .loadFile(widget.separatedAudio.otherPath, mode: LoadMode.disk);

    /** 
     * 
    // 分離オーディオをまとめて操作するためのハンドル
    _separatedAudioHandle = _soloud!.createVoiceGroup();
    _soloud!.addVoicesToGroup(_separatedAudioHandle!, [
      _voiceHandle!,
      _drumHandle!,
      _bassHandle!,
      _guitarHandle!,
      _pianoHandle!,
      _otherHandle!
    ]);
    */
    _clickHandle = await _soloud!.play(_click!, paused: true);
    _chordHandle = await _soloud!.play(_chord!, paused: true);
    _vocalHandle = await _soloud!.play(_vocal!, paused: true);
    _drumHandle = await _soloud!.play(_drum!, paused: true);
    _bassHandle = await _soloud!.play(_bass!, paused: true);
    _guitarHandle = await _soloud!.play(_guitar!, paused: true);
    _pianoHandle = await _soloud!.play(_piano!, paused: true);
    _otherHandle = await _soloud!.play(_other!, paused: true);

    // アプリ全体で再生するオーディオをまとめて操作するためのハンドル
    _soundHandle = _soloud!.createVoiceGroup();
    _soloud!.addVoicesToGroup(_soundHandle!, [
      _vocalHandle!,
      _drumHandle!,
      _bassHandle!,
      _guitarHandle!,
      _pianoHandle!,
      _otherHandle!,
      _clickHandle!,
      _chordHandle!,
    ]);
    //await _preparePlay();
    _initClickSound();
    _initChordSound();
    _totalDuration = _soloud!.getLength(_vocal!);

    setState(() {
      _isInitialized = true; // 初期化が完了したら状態を更新
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // タイマーをキャンセル
    _soloud!.deinit();
    super.dispose();
  }

  Future<void> _preparePlay() async {
    _vocal!.soundEvents.listen((eventResult) {
      if (eventResult.event == SoundEventType.handleIsNoMoreValid) {
        print('nomore');
        _resetPlayer();
      }
    });
  }

  void _resetPlayer() {
    _isPlaying = false;
    _timer?.cancel();
    _initTimer();

    _soloud!.setVolume(_vocalHandle!, _vocalVolume);
    _soloud!.setVolume(_drumHandle!, _drumVolume);
    _soloud!.setVolume(_bassHandle!, _bassVolume);
    _soloud!.setVolume(_guitarHandle!, _guitarVolume);
    _soloud!.setVolume(_pianoHandle!, _pianoVolume);
    _soloud!.setVolume(_otherHandle!, _otherVolume);
    _currentPosition = Duration.zero;
  }

  // 再生時間を更新するメソッド
  void _updateTime(Timer timer) {
    setState(() {
      _currentPosition = _soloud!.getPosition(_soundHandle!); // 再生時間を取得して更新
      print(_currentPosition);
    });
  }

  void _initTimer() {
    _timer = null;
  }

  void _setTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 50), _updateTime);
  }

  void _initClickSound() {
    _soloud!.setVolume(_clickHandle!, _clickVolume);
  }

  void _initChordSound() {
    _soloud!.setVolume(_chordHandle!, _chordSoundVolume);
  }

  // クリック音のオンオフ切り替え
  void _toggleClickSound(bool isSoundOn) {
    _isClickSoundOn = isSoundOn; // 状態を更新
    if (_isClickSoundOn) {
      // 音量を元に戻す
      _soloud!.setVolume(_clickHandle!, _previousClickVolume);
      _clickVolume = _previousClickVolume;
    } else {
      // 音量を記録して音をオフにする
      _previousClickVolume = _soloud!.getVolume(_clickHandle!);
      _soloud!.setVolume(_clickHandle!, 0.0);
    }
  }

  // コード音声のオンオフ切り替え
  void _toggleChordSound(bool isSoundOn) {
    _isChordSoundOn = isSoundOn;
    if (_isChordSoundOn) {
      _soloud!.setVolume(_chordHandle!, _previousChordSoundVolume);
      _chordSoundVolume = _previousChordSoundVolume;
    } else {
      _previousChordSoundVolume = _soloud!.getVolume(_chordHandle!);
      _soloud!.setVolume(_chordHandle!, 0.0);
    }
  }

  // 再生を開始するメソッド
  void _play() {
    if (!_isPlaying) {
      _soloud!.pauseSwitch(_soundHandle!); // 全ての音を再生
      _setTimer();
      setState(() {
        _isPlaying = true; // 再生状態に変更
      });
    }
  }

  void _seek(Duration newPosition) {
    bool needResume = false;
    if (_isPlaying) {
      needResume = true;
      _soloud!.pauseSwitch(_soundHandle!);
      _timer?.cancel();
    }
    _soloud!.seek(_vocalHandle!, newPosition);
    _soloud!.seek(_drumHandle!, newPosition);
    _soloud!.seek(_bassHandle!, newPosition);
    _soloud!.seek(_guitarHandle!, newPosition);
    _soloud!.seek(_pianoHandle!, newPosition);
    _soloud!.seek(_otherHandle!, newPosition);
    _soloud!.seek(_clickHandle!, newPosition);
    _soloud!.seek(_chordHandle!, newPosition);

    if (needResume) {
      _soloud!.pauseSwitch(_soundHandle!);
      _setTimer();
    }
    setState(() {
      _currentPosition = newPosition;
    });
  }

  // 一時停止するメソッド
  void _pause() {
    _soloud!.pauseSwitch(_soundHandle!);
    _timer?.cancel(); // タイマーを停止
    setState(() {
      _isPlaying = false; // 一時停止状態に変更
    });
  }

  // 再生速度を設定する
  void _applyPlaybackSpeed() {
    // `setRelativePlaySpeed` を使って再生速度を適用
    _soloud!.setRelativePlaySpeed(_soundHandle!, _playbackSpeed);
    if (_playbackSpeed == 1.00) {
      _soloud!.filters.pitchShiftFilter.deactivate();
    } else {
      double shiftValue = 1 / _playbackSpeed;
      if (!_soloud!.filters.pitchShiftFilter.isActive) {
        _soloud!.filters.pitchShiftFilter.activate();
      }
      _soloud!.filters.pitchShiftFilter.shift.value = shiftValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Scaffold(
        appBar: AppBar(title: Text('パート別音源再生プレイヤー')),
        body: Center(
          child: CircularProgressIndicator(), // 初期化中のインジケーター
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('パート別音源再生プレイヤー'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: _showClickSoundSettingsDialog, // 設定ダイアログを表示
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _isPlaying ? _pause() : _play(),
                child: Text(_isPlaying ? '一時停止' : '再生'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _soloud!.stop(_soundHandle!);
                  print(_soundHandle);
                  _resetPlayer();
                },
                child: Text('停止'),
              ),
              SizedBox(height: 20),
              Text('再生位置 (ms)'),
              Text(
                '${_currentPosition.inMilliseconds}',
                style: TextStyle(fontSize: 24),
              ),
              Slider(
                min: 0,
                max: _totalDuration!.inMilliseconds.toDouble(),
                value: _currentPosition.inMilliseconds.toDouble(),
                onChanged: (value) {
                  _timer?.cancel();
                  setState(() {
                    _currentPosition = Duration(milliseconds: value.toInt());
                  });
                },
                onChangeEnd: (value) {
                  _seek(Duration(milliseconds: value.toInt()));
                },
                label:
                    '${_currentPosition.inMilliseconds} ms', // ミリ秒単位でスライダーラベルを表示
              ),
              SizedBox(height: 20),
              _buildVolumeSlider('ボーカル', _vocalHandle!),
              _buildVolumeSlider('ドラム', _drumHandle!),
              _buildVolumeSlider('ベース', _bassHandle!),
              _buildVolumeSlider('ギター', _guitarHandle!),
              _buildVolumeSlider('ピアノ', _pianoHandle!),
              _buildVolumeSlider('その他', _otherHandle!),
            ],
          ),
        ),
      );
    }
  }

  // クリック音の設定ダイアログを表示
  void _showClickSoundSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("設定"),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setDialogState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                      title: Text("クリック音"),
                      value: _isClickSoundOn,
                      onChanged: (value) {
                        _toggleClickSound(value); // クリック音のオンオフを切り替える
                        setDialogState(() {}); // ダイアログのUIを更新
                      }),
                  Slider(
                    value: _clickVolume,
                    min: 0.0,
                    max: 1.0,
                    divisions: 10,
                    label: (_clickVolume * 100).toStringAsFixed(0) + '%',
                    onChanged: _isClickSoundOn
                        ? (value) {
                            setState(() {
                              _clickVolume = value;
                              _soloud!.setVolume(
                                  _clickHandle!, _clickVolume); // 音量を変更
                            });
                            setDialogState(() {}); // ダイアログのUIを更新
                          }
                        : null,
                  ),
                  SwitchListTile(
                      title: Text("コード音声"),
                      value: _isChordSoundOn,
                      onChanged: (value) {
                        _toggleChordSound(value); // クリック音のオンオフを切り替える
                        setDialogState(() {}); // ダイアログのUIを更新
                      }),
                  Slider(
                    value: _chordSoundVolume,
                    min: 0.0,
                    max: 1.0,
                    divisions: 10,
                    label: (_chordSoundVolume * 100).toStringAsFixed(0) + '%',
                    onChanged: _isChordSoundOn
                        ? (value) {
                            setState(() {
                              _chordSoundVolume = value;
                              _soloud!.setVolume(
                                  _chordHandle!, _chordSoundVolume); // 音量を変更
                            });
                            setDialogState(() {}); // ダイアログのUIを更新
                          }
                        : null,
                  ),
                  /**
                   * 
                  SizedBox(height: 20),
                  Text('再生速度'),
                  Slider(
                    value: _playbackSpeed,
                    min: 0.05,
                    max: 2.0,
                    divisions: 200,
                    label: (_playbackSpeed.toStringAsFixed(2) + '倍'),
                    onChanged: (newSpeed) {
                      setState(() {
                        _playbackSpeed = newSpeed;
                      });
                      _applyPlaybackSpeed(); // スライダーで調整した再生速度を適用
                      setDialogState(() {}); // ダイアログのUIを更新
                    },
                  ),
                   */
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ダイアログを閉じる
              },
              child: Text('閉じる'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildVolumeSlider(String label, SoundHandle handle) {
    return Column(
      children: [
        Text(label),
        Slider(
          min: 0.0,
          max: 1.0,
          value: _soloud!.getVolume(handle),
          onChanged: (value) {
            _soloud!.setVolume(handle, value);
            if (handle == _vocalHandle)
              _vocalVolume = value;
            else if (handle == _drumHandle)
              _drumVolume = value;
            else if (handle == _bassHandle)
              _bassVolume = value;
            else if (handle == _guitarHandle)
              _guitarVolume = value;
            else if (handle == _pianoHandle)
              _pianoVolume = value;
            else if (handle == _otherHandle) _otherVolume = value;
            setState(() {});
          },
          label: "$label 音量",
        ),
      ],
    );
  }
}
