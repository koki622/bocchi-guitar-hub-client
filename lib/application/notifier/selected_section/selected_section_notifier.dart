import 'package:bocchi_guitar_hub_client/application/notifier/song_elements/song_elements_notifier.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/section/section.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_section_notifier.g.dart';

@riverpod
class SelectedSectionNotifier extends _$SelectedSectionNotifier {
  late final List<Section> _sections;
  @override
  List<int> build(Song song) {
    _sections = ref.watch(sectionNotifierProvider(song));
    return [];
  }

  List<int> getState() => state;

  List<Section> getSections() => _sections;

  void addIndex(int newIndex) {
    if (state.isEmpty) state = [newIndex];

    List<int> input = [...state, newIndex]..sort();
    List<int> newState = [];
    for (int i = 0; i < input.length - 1; i++) {
      newState
          .addAll(List.generate(input[i + 1] - input[i], (j) => input[i] + j));
    }
    newState.add(input.last);
    state = newState;
  }

  void deleteIndex(int deleteIndex) {
    if (deleteIndex < 0 || !state.contains(deleteIndex)) {
      throw ArgumentError('削除するインデックスが範囲外です');
    }
    final deleteIndexAt = state.indexOf(deleteIndex);
    if (deleteIndexAt == 0) {
      // 先頭を削除
      state = state.sublist(1);
    } else if (deleteIndexAt == state.length - 1) {
      // 最後の要素を削除
      state = state.sublist(0, deleteIndexAt);
    } else {
      int leftDistance = deleteIndex - state[deleteIndexAt - 1];
      int rightDistance = state[deleteIndexAt + 1] - deleteIndex;

      if (leftDistance == rightDistance) {
        state = [state[deleteIndexAt]];
      } else if (leftDistance < rightDistance) {
        state = state.sublist(0, deleteIndexAt);
      } else {
        state = state.sublist(deleteIndexAt + 1);
      }
    }
  }

  void resetIndex() {
    state = [];
  }
}
