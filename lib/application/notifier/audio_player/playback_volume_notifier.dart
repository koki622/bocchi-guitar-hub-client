import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/audio_player_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'playback_volume_notifier.freezed.dart';
part 'playback_volume_notifier.g.dart';

@freezed
class PlaybackVolumeState with _$PlaybackVolumeState {
  factory PlaybackVolumeState({
    required double volume,
    required bool isSoundOn,
  }) = _PlaybackVolumeState;
}

@riverpod
class PlaybackVolumeNotifier extends _$PlaybackVolumeNotifier {
  Map<SoundType, double>? previousVolumes;

  @override
  Map<SoundType, PlaybackVolumeState> build() {
    final Map<SoundType, PlaybackVolumeState> initState = {
      SoundType.vocals: PlaybackVolumeState(volume: 1.0, isSoundOn: true),
      SoundType.drums: PlaybackVolumeState(volume: 1.0, isSoundOn: true),
      SoundType.bass: PlaybackVolumeState(volume: 1.0, isSoundOn: true),
      SoundType.guitar: PlaybackVolumeState(volume: 1.0, isSoundOn: true),
      SoundType.piano: PlaybackVolumeState(volume: 1.0, isSoundOn: true),
      SoundType.other: PlaybackVolumeState(volume: 1.0, isSoundOn: true),
      SoundType.click: PlaybackVolumeState(volume: 0, isSoundOn: false),
      SoundType.chord: PlaybackVolumeState(volume: 0, isSoundOn: false),
    };

    previousVolumes = {
      for (SoundType soundType in initState.keys)
        soundType: initState[soundType]!.volume
    };

    return initState;
  }

  void setVolume(SoundType soundType, double volume) {
    // 現在の音量を記録
    previousVolumes![soundType] = state[soundType]!.volume;
    final updatedPlaybackVolumeState =
        state[soundType]!.copyWith(volume: volume);
    state = {
      ...state,
      soundType: updatedPlaybackVolumeState,
    };
  }

  void toggleSoundOn(SoundType soundType) {
    final isSoundOn = state[soundType]!.isSoundOn;
    final PlaybackVolumeState updatedPlaybackVolumeState;
    if (isSoundOn) {
      updatedPlaybackVolumeState = state[soundType]!.copyWith(isSoundOn: false);
    } else {
      updatedPlaybackVolumeState = state[soundType]!.copyWith(isSoundOn: true);
    }
    state = {...state, soundType: updatedPlaybackVolumeState};
  }

  bool isSoundOn(SoundType soundType) => state[soundType]!.isSoundOn;

  double getVolume(SoundType soundType) => state[soundType]!.volume;

  Map<SoundType, PlaybackVolumeState> get currentStates => state;
}
