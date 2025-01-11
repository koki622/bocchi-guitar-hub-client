import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'playback_loop_notifier.g.dart';
part 'playback_loop_notifier.freezed.dart';

@freezed
class PlaybackLoopState with _$PlaybackLoopState {
  factory PlaybackLoopState({
    required bool isLooping,
    required Duration loopingStartAt,
    required Duration loopingEndAt,
  }) = _PlaybackLoopState;
}

@riverpod
class PlaybackLoopNotifier extends _$PlaybackLoopNotifier {
  @override
  PlaybackLoopState build(Duration totalDuration) {
    return PlaybackLoopState(
        isLooping: false,
        loopingStartAt: Duration.zero,
        loopingEndAt: totalDuration);
  }

  Duration get loopingStartAt => state.loopingStartAt;
  Duration get loopingEndAt => state.loopingEndAt;
  bool get isLoopOn => state.isLooping;

  void toggleLoop() {
    state = state.copyWith(isLooping: state.isLooping ? false : true);
  }

  void setDefaultLoopPoint() {
    state = state.copyWith(
        loopingStartAt: Duration.zero, loopingEndAt: totalDuration);
  }

  void setNewLoopPoint({Duration? loopingStartAt, Duration? loopingEndAt}) {
    state = state.copyWith(
        loopingStartAt: loopingStartAt ?? state.loopingStartAt,
        loopingEndAt: loopingEndAt ?? state.loopingEndAt);
  }
}
