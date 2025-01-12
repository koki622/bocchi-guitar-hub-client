import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/audio_player_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/song_elements/song_elements_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/audio_player_usecase.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/audio_control/volume_control_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPanel extends StatelessWidget {
  final Song song;
  final AudioPlayerUsecase audioPlayerUsecase;

  const SettingsPanel(
      {super.key, required this.song, required this.audioPlayerUsecase});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VolumeBar(
            audioPlayerUsecase: audioPlayerUsecase, soundType: SoundType.click),
        VolumeBar(
            audioPlayerUsecase: audioPlayerUsecase, soundType: SoundType.chord),
        SettingCapo(song: song),
      ],
    );
  }
}

class SettingCapo extends ConsumerWidget {
  final Song song;

  const SettingCapo({super.key, required this.song});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chordState = ref.watch(chordNotifierProvider(song, 0));
    final capoNumbers = _generateItems();
    return DropdownButton<int>(
        value: chordState.capo,
        items: capoNumbers.map((number) {
          return DropdownMenuItem(
            value: number,
            child: Text('カポ: ${number.toString()}'),
          );
        }).toList(),
        onChanged: (newValue) {
          if (newValue != null) {
            ref
                .read(chordNotifierProvider(song, 0).notifier)
                .changeCapo(newValue);
          }
        });
  }

  List<int> _generateItems() {
    return List.generate(10, (index) => index);
  }
}
