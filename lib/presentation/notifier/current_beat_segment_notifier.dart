import 'package:bocchi_guitar_hub_client/application/notifier/beat_position/beat_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_beat_segment_notifier.g.dart';

@riverpod
class CurrentBeatSegmentNotifier extends _$CurrentBeatSegmentNotifier {
  @override
  int build(List<Beat> beats) {
    final int currentBeatIndex = ref.read(beatPositionNotifierProvider(beats));
    _listenCurrentBeatIndex();
    return _findCurrentBeatSegment(currentBeatIndex);
  }

  void _listenCurrentBeatIndex() {
    ref.listen(beatPositionNotifierProvider(beats), (previous, next) {
      final int currentBeatSegmentIndex = _findCurrentBeatSegment(next);
      if (state != currentBeatSegmentIndex) state = currentBeatSegmentIndex;
    });
  }

  int _findCurrentBeatSegment(int currentBeatIndex) {
    final currentBeatPosition = beats[currentBeatIndex].beatPosition;
    if (currentBeatPosition == 1.0 || currentBeatPosition == -1.0) {
      return currentBeatIndex;
    }
    for (int i = currentBeatIndex; i >= 0; i--) {
      if (beats[i].beatPosition == 1.0) {
        return i;
      }
    }
    return 0;
  }
}
