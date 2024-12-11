import 'dart:async';

import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/audio_player_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_volume_notifier.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

class AudioPlayerUsecase {
  final AudioPlayerState _audioPlayerState;
  final PlaybackStateNotifier _playbackStateNotifier;
  final PlaybackPositionNotifier _playbackPositionNotifier;
  final PlaybackVolumeNotifier _playbackVolumeNotifier;

  late final StreamSubscription _soundEventSubscription;

  AudioPlayerUsecase(this._audioPlayerState, this._playbackStateNotifier,
      this._playbackPositionNotifier, this._playbackVolumeNotifier) {
    _soundEventSubscription = _setupSoundEventSubscription();
  }

  Duration getTotalDuration() {
    return _audioPlayerState.totalDuration;
  }

  bool isPlaying() {
    return _playbackStateNotifier.currentPlaybackState;
  }

  bool isStartPositionTracking() {
    return _playbackPositionNotifier.isStartPositionTracking();
  }

  void updatePosition(Duration newPosition) {
    _playbackPositionNotifier.updatePosition(newPosition);
  }

  void startPositionTracking() {
    _playbackPositionNotifier.startPositionTracking(_audioPlayerState);
  }

  void stopPositionTracking() {
    _playbackPositionNotifier.stopPositionTracking();
  }

  void togglePlayPause() {
    bool isPlaying = _playbackStateNotifier.currentPlaybackState;
    if (isPlaying) {
      // 現在再生中の場合, 再生位置のトラッキングを停止
      _playbackPositionNotifier.stopPositionTracking();
    } else {
      // 現在停止中の場合、再生位置のトラッキングをスタート
      _playbackPositionNotifier.startPositionTracking(_audioPlayerState);
    }

    // 再生停止フラグを切り替え
    _playbackStateNotifier.togglePlayPause(isPlaying);

    // 再生停止を切り替え
    _audioPlayerState.soloud
        .pauseSwitch(_audioPlayerState.soundState.groupHandle);
  }

  void setVolume(SoundType soundType, double volume) {
    _playbackVolumeNotifier.setVolume(soundType, volume);
    _audioPlayerState.soloud.setVolume(
        _audioPlayerState.soundState.soundHandles[soundType]!, volume);
  }

  void seek(Duration newPosition) {
    SoLoud soloud = _audioPlayerState.soloud;
    SoundHandle groupHandle = _audioPlayerState.soundState.groupHandle;
    bool needResume = false;
    if (_playbackStateNotifier.currentPlaybackState) {
      needResume = true;
      soloud.pauseSwitch(groupHandle);
    }
    try {
      for (SoundHandle soundHandle
          in _audioPlayerState.soundState.soundHandles.values) {
        // 一つずつハンドルに対してシークを行う
        soloud.seek(soundHandle, newPosition);
      }
    } catch (e) {
      print(e);
    }
    updatePosition(newPosition);
    if (needResume) {
      soloud.pauseSwitch(groupHandle);
    }
  }

  // サウンドイベントのサブスクリプションを設定
  StreamSubscription _setupSoundEventSubscription() {
    return _audioPlayerState
        .soundState.audioSources[SoundType.vocals]!.soundEvents
        .listen((eventResult) async {
      if (eventResult.event == SoundEventType.handleIsNoMoreValid) {
        await _resetPlayer();
      }
    });
  }

  // プレイヤーの初期化
  Future<void> _resetPlayer() async {
    SoLoud soloud = _audioPlayerState.soloud;

    // handle等をリセット
    await _audioPlayerState.soundState.resetPlayer(
        soloudInstance: soloud,
        initVolumes: _playbackVolumeNotifier.previousVolumes!);
    // 一時停止にする
    _playbackStateNotifier.togglePlayPause(true);
    _playbackPositionNotifier.stopPositionTracking();
    _playbackPositionNotifier.updatePosition(Duration.zero);
  }

  // 解放処理
  void dispose() {
    _soundEventSubscription.cancel();
  }
}
