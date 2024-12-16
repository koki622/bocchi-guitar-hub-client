import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/chord_diagram/chord_diagram_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_chord_diagram_notifier.g.dart';

@riverpod
class CurrentChordDiagramNotifier extends _$CurrentChordDiagramNotifier {
  bool _isFirst = true;
  @override
  int build(Map<ChordTimeRange, int> chordChange) {
    final currentPosition = ref.watch(playbackPositionNotifierProvider);
    final currentIndex = _findCurrentIndex(chordChange, currentPosition);

    return currentIndex ?? 0;
  }

  void updateIndex(int newIndex) {
    state = newIndex;
  }

  int? _findCurrentIndex(
      Map<ChordTimeRange, int> chordChange, Duration currentPosition) {
    int? currentIndex;
    for (ChordTimeRange chordTimeRange in chordChange.keys) {
      if (chordTimeRange.contains(currentPosition)) {
        currentIndex = chordChange[chordTimeRange]!;
        break;
      }
    }
    return currentIndex;
  }
}
