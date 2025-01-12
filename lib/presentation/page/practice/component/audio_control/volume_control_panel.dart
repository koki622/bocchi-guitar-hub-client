import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/audio_player_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_volume_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/audio_player_usecase.dart';
import 'package:bocchi_guitar_hub_client/core/constant/reference/responsive_breakpoints.dart';
import 'package:bocchi_guitar_hub_client/core/constant/size.dart';
import 'package:bocchi_guitar_hub_client/core/constant/text/sound.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VolumeControlPanel extends StatelessWidget {
  final AudioPlayerUsecase audioPlayerUsecase;

  const VolumeControlPanel({super.key, required this.audioPlayerUsecase});

  @override
  Widget build(BuildContext context) {
    List<Widget> volumeBars = [
      VolumeBar(
          audioPlayerUsecase: audioPlayerUsecase, soundType: SoundType.vocals),
      VolumeBar(
          audioPlayerUsecase: audioPlayerUsecase, soundType: SoundType.drums),
      VolumeBar(
          audioPlayerUsecase: audioPlayerUsecase, soundType: SoundType.bass),
      VolumeBar(
          audioPlayerUsecase: audioPlayerUsecase, soundType: SoundType.guitar),
      VolumeBar(
          audioPlayerUsecase: audioPlayerUsecase, soundType: SoundType.piano),
      VolumeBar(
          audioPlayerUsecase: audioPlayerUsecase, soundType: SoundType.other)
    ];
    if (MediaQuery.of(context).size.height < 650 &&
        ResponsiveBreakpoints.getDeviceType(context) != DeviceSizeType.mobile) {
      return GridView.count(
        childAspectRatio: MediaQuery.of(context).size.width / 120,
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        children: volumeBars,
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: volumeBars,
    );
  }
}

class VolumeBar extends ConsumerWidget {
  final AudioPlayerUsecase audioPlayerUsecase;
  final SoundType soundType;

  const VolumeBar(
      {super.key, required this.audioPlayerUsecase, required this.soundType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackVolumeState = ref.watch(
        playbackVolumeNotifierProvider.select((value) => value[soundType]));
    final isSoundOn = playbackVolumeState!.isSoundOn;
    final volume = playbackVolumeState.volume;
    final iconSize = Sizes.iconNormal(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // 左右に16pxの余白を追加
        child: Row(
          children: [
            // Textを横並びに配置
            SizedBox(
              width: Sizes.volumeBarText(context), // 幅を固定
              child: Text(
                SoundNameText.soundName[soundType]!,
                style: TextStyle(fontSize: Sizes.fontNormal(context)),
                overflow: TextOverflow.ellipsis, // テキストが長い場合に省略する
              ),
            ),

            // Rowでスライダーとアイコンを横並びにする
            IconButton(
              icon: isSoundOn
                  ? const Icon(Icons.volume_up)
                  : const Icon(Icons.volume_off),
              iconSize: iconSize,
              onPressed: () {
                audioPlayerUsecase.toggleSoundOn(soundType);
              },
            ),
            Expanded(
              child: Slider(
                min: 0.0,
                max: 1.0,
                value: volume,
                onChanged: isSoundOn
                    ? (newVolume) {
                        audioPlayerUsecase.setVolume(soundType, newVolume);
                      }
                    : null,
                label: '音量',
              ),
            ),
          ],
        ));
  }
}
