import 'package:bocchi_guitar_hub_client/core/constant/size.dart';
import 'package:bocchi_guitar_hub_client/presentation/notifier/selected_tab_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NaviBarPanel extends ConsumerWidget {
  final SelectedTabType initSelectedTab;

  const NaviBarPanel({super.key, required this.initSelectedTab});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedTabNotifierProvider(initSelectedTab));
    final selectedTabNotifier =
        ref.read(selectedTabNotifierProvider(initSelectedTab).notifier);

    return ToggleButtons(
      isSelected: selectedTab.values.toList(),
      children: const [
        Icon(Icons.tune),
        Icon(Icons.play_arrow),
        Icon(Icons.settings),
      ],
      onPressed: (index) {
        selectedTabNotifier.set(SelectedTabType.values[index]);
      },
      /**
         * 
        IconButton(
          icon: const Icon(Icons.tune),
          onPressed: () {
            selectedTabNotifier.set(SelectedTabType.volumeMixer);
          },
          iconSize: Sizes.iconNormal(context),
          selectedIcon: const Icon(
            Icons.tune,
            color: Color.,
            ),
          isSelected:
              selectedTabNotifier.isSelected(SelectedTabType.volumeMixer),
        )
         */
    );
  }
}
