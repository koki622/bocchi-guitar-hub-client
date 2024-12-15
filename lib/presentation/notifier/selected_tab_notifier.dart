import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_tab_notifier.g.dart';

enum SelectedTabType {
  volumeMixer,
  guide,
}

@riverpod
class SelectedTabNotifier extends _$SelectedTabNotifier {
  @override
  Map<SelectedTabType, bool> build(SelectedTabType initTabType) {
    return _getNewState(initTabType);
  }

  void set(SelectedTabType selectedTab) {
    state = _getNewState(selectedTab);
  }

  bool isSelected(SelectedTabType selectedTab) {
    return state[selectedTab]!;
  }

  SelectedTabType? getSelectedTabType() {
    for (SelectedTabType selectedTabType in state.keys) {
      if (state[selectedTabType]!) {
        return selectedTabType;
      }
    }
    return null;
  }

  Map<SelectedTabType, bool> _getNewState(SelectedTabType selectedTabType) {
    final result = {
      for (SelectedTabType type in SelectedTabType.values)
        type: type == selectedTabType ? true : false
    };
    return result;
  }
}
