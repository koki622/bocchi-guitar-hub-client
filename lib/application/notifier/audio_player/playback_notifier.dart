import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'playback_notifier.g.dart';

@riverpod
class PlaybackStateNotifier extends _$PlaybackStateNotifier {
  @override
  bool build() => false;

  void togglePlayPause(bool isPlaying) {
    state = isPlaying ? false : true;
  }

  bool get currentPlaybackState => state;
}
