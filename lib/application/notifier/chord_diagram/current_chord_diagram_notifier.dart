import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/chord_diagram/chord_diagram_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_chord_diagram_notifier.g.dart';

@riverpod
class CurrentChordDiagramNotifier extends _$CurrentChordDiagramNotifier {
  @override
  int build(Map<ChordTimeRange, int> chordChange) {
    final currentPosition = ref.read(playbackPositionNotifierProvider);
    final currentIndex = _findCurrentIndex(chordChange, currentPosition);
    _listenPosition();
    return currentIndex ?? 0;
  }

  void updateIndex(int newIndex) {
    state = newIndex;
  }

  // 再生位置を監視する
  void _listenPosition() {
    ref.listen<Duration>(playbackPositionNotifierProvider, (previous, next) {
      final currentIndex = _findCurrentIndex(chordChange, next);
      if (currentIndex != state && currentIndex != null) {
        state = currentIndex;
      }
    });
  }

  // 現在の再生位置に一致するコードダイアグラムのインデックスを検索する
  int? _findCurrentIndex(
      Map<ChordTimeRange, int> chordChange, Duration currentPosition) {
    if (currentPosition == Duration.zero) return 0;
    for (ChordTimeRange chordTimeRange in chordChange.keys) {
      if (chordTimeRange.contains(currentPosition)) {
        return chordChange[chordTimeRange]!;
      }
    }
    return chordChange.length - 1;
  }
}
