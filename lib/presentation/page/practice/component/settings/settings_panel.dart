import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/audio_player_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/audio_player_usecase.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/audio_control/audio_player.dart';
import 'package:flutter/material.dart';

class SettingsPanel extends StatelessWidget {
  final AudioPlayerUsecase audioPlayerUsecase;

  const SettingsPanel({super.key, required this.audioPlayerUsecase});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VolumeBar(
            audioPlayerUsecase: audioPlayerUsecase, soundType: SoundType.click),
        VolumeBar(
            audioPlayerUsecase: audioPlayerUsecase, soundType: SoundType.chord),
      ],
    );
  }
}
