import 'package:bocchi_guitar_hub_client/application/notifier/beat_position/beat_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_beat_notifier.g.dart';

@riverpod
class CurrentBeatNotifier extends _$CurrentBeatNotifier {
  @override
  List<bool> build(List<Beat> beats) {
    final int currentBeatIndex = ref.read(beatPositionNotifierProvider(beats));
    _listenCurrentBeatIndex();
    return [
      for (int i = 0; i < beats.length; i++)
        i == currentBeatIndex ? true : false
    ];
  }

  void _listenCurrentBeatIndex() {
    ref.listen<int>(beatPositionNotifierProvider(beats), (previous, next) {
      final newState = [...state];
      newState[previous!] = false;
      newState[next] = true;
      state = newState;
    });
  }
}
