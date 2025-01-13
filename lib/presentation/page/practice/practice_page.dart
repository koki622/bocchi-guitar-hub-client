import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/song_elements/song_elements_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/audio_player_usecase.dart';
import 'package:bocchi_guitar_hub_client/presentation/notifier/selected_song.dart';
import 'package:bocchi_guitar_hub_client/core/constant/size.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/presentation/notifier/selected_tab_notifier.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/audio_control/playback_control_panel.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/audio_control/volume_control_panel.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/beat_position/beat_position_panel.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/chord_diagram/chord_panel.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/lyrics/lyric_panel.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/navi_bar/navi_bar_panel.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/settings/settings_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class PracticePage extends ConsumerStatefulWidget {
  const PracticePage({super.key});

  @override
  PracticePageState createState() => PracticePageState();
}

class PracticePageState extends ConsumerState<PracticePage> {
  @override
  void initState() {
    super.initState();
    WakelockPlus.enable(); // 画面スリープを防止
  }

  @override
  void dispose() {
    WakelockPlus.disable(); // 画面スリープ防止を解除
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedSong = ref.watch(selectedSongProvider)!;
    ref.watch(chordNotifierProvider(selectedSong, 0));
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
                  child:
                      _buildSelectedWidget(selectedTab!, selectedSong, state)),
              PlaybackControlPanel(
                  song: selectedSong, audioPlayerUsecase: state),
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
      SelectedTabType.guide => Column(
          children: [
            Flexible(
              flex: 3,
              child: LyricPanel(song: song),
            ),
            Flexible(
              flex: 6,
              child: ChordPanel(song: song),
            ),
            Flexible(
              flex: 1,
              child: BeatPositionPanel(song: song),
            ),
          ],
        ),
      SelectedTabType.setting =>
        SettingsPanel(song: song, audioPlayerUsecase: state),
      _ => const Center(child: Text("Unknown Tab")),
    };
  }
}
