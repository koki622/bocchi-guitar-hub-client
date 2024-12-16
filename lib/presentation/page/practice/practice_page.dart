import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/audio_player_usecase.dart';
import 'package:bocchi_guitar_hub_client/presentation/notifier/selected_song.dart';
import 'package:bocchi_guitar_hub_client/core/constant/size.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/presentation/notifier/selected_tab_notifier.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/audio_control/playback_control_panel.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/audio_control/volume_control_panel.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/chord_diagram/chord_panel.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/navi_bar/navi_bar_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PracticePage extends ConsumerWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSong = ref.watch(selectedSongProvider)!;
    final audioPlayerUsecase =
        ref.watch(audioPlayerUsecaseProvider(selectedSong));
    const initTabType = SelectedTabType.guide;
    final selectedTab = ref.watch(selectedTabNotifierProvider(initTabType));
    return audioPlayerUsecase.when(data: (state) {
      return Scaffold(
          appBar: _buildAppBar(context, selectedSong),
          body: Column(
            children: [
              Expanded(
                  // 下寄せしない要素をここに書く
                  child: _buildSelectedWidget(selectedTab!, selectedSong, state)
                  //VolumeControlPanel(audioPlayerUsecase: state),
                  ),
              PlaybackControlPanel(audioPlayerUsecase: state),
              const NaviBarPanel(initSelectedTab: initTabType),
            ],
          ));
    }, error: (error, stackTrace) {
      return Center(
        child: Text('エラー: $error'),
      );
    }, loading: () {
      return Scaffold(
        appBar: _buildAppBar(context, selectedSong),
        body: const Center(
          child: CircularProgressIndicator(), // 初期化中のインジケーター
        ),
      );
    });
  }

  AppBar _buildAppBar(BuildContext context, Song selectedSong) {
    return AppBar(
      title: Text(
        selectedSong.title,
        style: TextStyle(fontSize: Sizes.fontNormal(context)),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: Sizes.iconNormal(context),
        ),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }

  Widget _buildSelectedWidget(Map<SelectedTabType, bool> selectedTabs,
      Song song, AudioPlayerUsecase state) {
    SelectedTabType? selectedTab;
    for (SelectedTabType key in selectedTabs.keys) {
      if (selectedTabs[key]!) {
        selectedTab = key;
        break;
      }
    }

    return switch (selectedTab) {
      SelectedTabType.volumeMixer =>
        VolumeControlPanel(audioPlayerUsecase: state),
      SelectedTabType.guide => ChordPanel(
          song: song,
        ),
      _ => const Center(child: Text("Unknown Tab")), // デフォルトケース
    };
  }
}
