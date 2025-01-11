import 'dart:async';

import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/audio_player_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_loop_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_volume_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/selected_section/selected_section_notifier.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

class AudioPlayerUsecase {
  final AudioPlayerState _audioPlayerState;
  final PlaybackStateNotifier _playbackStateNotifier;
  final PlaybackPositionNotifier _playbackPositionNotifier;
  final PlaybackVolumeNotifier _playbackVolumeNotifier;
  final PlaybackLoopNotifier _playbackLoopNotifier;
  final SelectedSectionNotifier _selectedSectionNotifier;

  late final StreamSubscription _soundEventSubscription;

  AudioPlayerUsecase(
      this._audioPlayerState,
      this._playbackStateNotifier,
      this._playbackPositionNotifier,
      this._playbackVolumeNotifier,
      this._playbackLoopNotifier,
      this._selectedSectionNotifier) {
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

  void toggleSoundOn(SoundType soundType) {
    final soloud = _audioPlayerState.soloud;
    final handle = _audioPlayerState.soundState.soundHandles[soundType]!;
    bool isSoundOn = _playbackVolumeNotifier.isSoundOn(soundType);

    if (isSoundOn) {
      soloud.setVolume(handle, 0.0);
    } else {
      soloud.setVolume(handle, _playbackVolumeNotifier.getVolume(soundType));
    }
    _playbackVolumeNotifier.toggleSoundOn(soundType);
  }

  StreamSubscription<Duration>? _positionSub;
  void toggleLooping() {
    final bool isLoopOn = _playbackLoopNotifier.isLoopOn;

    if (isLoopOn) {
      _positionSub?.cancel();
    } else {
      _monitoringLoopPoint();
      seek(_playbackLoopNotifier.loopingStartAt);
    }
    _playbackLoopNotifier.toggleLoop();
  }

  void setLoopPoint({Duration? loopingStartAt, Duration? loopingEndAt}) {
    _playbackLoopNotifier.setNewLoopPoint(
        loopingStartAt: loopingStartAt, loopingEndAt: loopingEndAt);
    if (loopingStartAt != null) {
      _audioPlayerState.soloud.setLoopPoint(
          _audioPlayerState.soundState.groupHandle, loopingStartAt);
      _monitoringLoopPoint();
    }
  }

  void _monitoringLoopPoint() {
    _positionSub?.cancel();
    bool loopingEndIsTotalDuration;
    if (_playbackLoopNotifier.loopingEndAt == getTotalDuration()) {
      loopingEndIsTotalDuration = true;
    } else {
      loopingEndIsTotalDuration = false;
    }
    // 現在のポジションを監視して、ループ終了地点になったらシーク
    bool isSeeked = false;
    _positionSub = _playbackPositionNotifier.positionStream.listen((duration) {
      if (duration < _playbackLoopNotifier.loopingStartAt &&
          _playbackLoopNotifier.isLoopOn &&
          !isSeeked) {
        seek(_playbackLoopNotifier.loopingStartAt);
        isSeeked = true;
      }
      if (duration >= _playbackLoopNotifier.loopingEndAt &&
          _playbackLoopNotifier.isLoopOn) {
        if (!loopingEndIsTotalDuration) {
          seek(_playbackLoopNotifier.loopingStartAt);
        }
      }
    });
  }

  void resetLoopPoint() {
    _playbackLoopNotifier.setDefaultLoopPoint();
    _audioPlayerState.soloud
        .setLoopPoint(_audioPlayerState.soundState.groupHandle, Duration.zero);
  }

  void setSelectedSection(int selectedSectionIndex) {
    if (_selectedSectionNotifier.getState().contains(selectedSectionIndex)) {
      _selectedSectionNotifier.deleteIndex(selectedSectionIndex);
    } else {
      _selectedSectionNotifier.addIndex(selectedSectionIndex);
    }
    final sections = _selectedSectionNotifier.getSections();
    List<int> selectedIndexes = _selectedSectionNotifier.getState();

    // 選択されているセクションに基づいてループポイントをセット
    if (selectedIndexes.isEmpty) {
      resetLoopPoint();
    } else if (selectedIndexes.length == 1) {
      final selectedSection = sections[selectedIndexes.first];
      setLoopPoint(
          loopingStartAt:
              Duration(milliseconds: (selectedSection.start * 1000).round()),
          loopingEndAt:
              Duration(milliseconds: (selectedSection.end * 1000).round()));
    } else {
      final startSelectedSection = sections[selectedIndexes.first];
      final endSelectedSection = sections[selectedIndexes.last];
      setLoopPoint(
          loopingStartAt: Duration(
              milliseconds: (startSelectedSection.start * 1000).round()),
          loopingEndAt:
              Duration(milliseconds: (endSelectedSection.end * 1000).round()));
    }
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

  void seekForward(Duration timeForward) {
    final Duration newPosition = _calculateNewPosition(timeForward, true);
    seek(newPosition);
  }

  void seekRewind(Duration timeRewind) {
    final Duration newPosition = _calculateNewPosition(timeRewind, false);
    seek(newPosition);
  }

  Duration _calculateNewPosition(Duration time, bool isForward) {
    final SoLoud soloud = _audioPlayerState.soloud;
    final Duration currentPosition =
        soloud.getPosition(_audioPlayerState.soundState.groupHandle);
    final Duration totalDuration = _audioPlayerState.totalDuration;
    Duration newPosition;
    if (isForward) {
      newPosition = currentPosition + time;
      if (newPosition > totalDuration) {
        newPosition = totalDuration;
      }
    } else {
      newPosition = currentPosition - time;
      if (newPosition < Duration.zero) {
        newPosition = Duration.zero;
      }
    }
    return newPosition;
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

    final bool isLoopOn = _playbackLoopNotifier.isLoopOn;
    final Duration newPosition =
        isLoopOn ? _playbackLoopNotifier.loopingStartAt : Duration.zero;

    // handle等をリセット
    await _audioPlayerState.soundState.resetPlayer(
        soloudInstance: soloud,
        initVolumes: _playbackVolumeNotifier.currentStates);

    // 一時停止にする
    _playbackStateNotifier.togglePlayPause(true);
    _playbackPositionNotifier.stopPositionTracking();

    if (isLoopOn) {
      seek(newPosition);
      togglePlayPause();
    } else {
      _playbackPositionNotifier.updatePosition(Duration.zero);
    }
  }

  // 解放処理
  void dispose() {
    _soundEventSubscription.cancel();
    _positionSub?.cancel();
  }
}
