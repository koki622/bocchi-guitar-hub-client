import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/audio_player_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'playback_volume_notifier.g.dart';

@riverpod
class PlaybackVolumeNotifier extends _$PlaybackVolumeNotifier {
  Map<SoundType, double>? previousVolumes;
  Map<SoundType, bool>? isSoundOn;

  @override
  Map<SoundType, double> build() {
    final Map<SoundType, double> initVolumes = {
      SoundType.vocals: 1.0,
      SoundType.drums: 1.0,
      SoundType.bass: 1.0,
      SoundType.guitar: 1.0,
      SoundType.piano: 1.0,
      SoundType.other: 1.0,
      SoundType.click: 0,
      SoundType.chord: 0,
    };
    isSoundOn = {
      SoundType.vocals: true,
      SoundType.drums: true,
      SoundType.bass: true,
      SoundType.guitar: true,
      SoundType.piano: true,
      SoundType.other: true,
      SoundType.click: false,
      SoundType.chord: false,
    };
    previousVolumes = initVolumes;

    return initVolumes;
  }

  void setVolume(SoundType soundType, double volume) {
    // 現在の音量を記録
    previousVolumes![soundType] = state[soundType]!;

    state = {
      ...state,
      soundType: volume,
    };
  }

  Map<SoundType, double> get currentVolumes => state;
}
