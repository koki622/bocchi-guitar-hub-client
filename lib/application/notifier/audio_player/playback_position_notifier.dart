import 'dart:async';

import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/audio_player_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'playback_position_notifier.g.dart';

@riverpod
class PlaybackPositionNotifier extends _$PlaybackPositionNotifier {
  Timer? _timer;
  bool? _isStartPositionTracking;

  @override
  Duration build() {
    ref.onDispose(() {
      stopPositionTracking();
    });
    _isStartPositionTracking = false;
    return Duration.zero;
  }

  // タイマーを開始し、定期的に再生位置を更新
  void startPositionTracking(AudioPlayerState audioPlayerState) {
    _timer?.cancel(); // 既存のタイマーをキャンセル
    _isStartPositionTracking = true;
    _timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      state = audioPlayerState.soloud
          .getPosition(audioPlayerState.soundState.groupHandle);
    });
  }

  // タイマーを停止
  void stopPositionTracking() {
    _timer?.cancel();
    _timer = null;
    _isStartPositionTracking = false;
  }

  bool isStartPositionTracking() {
    return _isStartPositionTracking!;
  }

  void updatePosition(Duration newPosition) {
    state = newPosition;
  }

  void resetPosition() {
    state = Duration.zero;
  }
}