import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_loop_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/audio_player_usecase.dart';
import 'package:bocchi_guitar_hub_client/core/constant/size.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/practice/component/section_box/section_box_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaybackControlPanel extends StatelessWidget {
  final Song song;
  final AudioPlayerUsecase audioPlayerUsecase;

  const PlaybackControlPanel(
      {super.key, required this.song, required this.audioPlayerUsecase});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height: 100,
              child: SeekBar(
                audioPlayerUsecase: audioPlayerUsecase,
              )),
          Container(
            height: 50,
            child: SectionBoxPanel(
              song: song,
              audioPlayerUsecase: audioPlayerUsecase,
            ),
          ),
          Container(
            height: 100,
            child: PlaybackControl(audioPlayerUsecase: audioPlayerUsecase),
          ),
        ],
      ),
    );
  }
}

class PlaybackControl extends ConsumerWidget {
  final AudioPlayerUsecase audioPlayerUsecase;

  const PlaybackControl({super.key, required this.audioPlayerUsecase});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(playbackStateNotifierProvider);
    final isLoopOn = ref.watch(
        playbackLoopNotifierProvider(audioPlayerUsecase.getTotalDuration())
            .select((selector) => selector.isLooping));
    final double iconSize = Sizes.iconLarge(context);
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.fast_rewind,
                  size: iconSize,
                ),
                onPressed: () {
                  audioPlayerUsecase.seekRewind(Duration(seconds: 10));
                },
              ),
              IconButton(
                icon: Icon(
                  isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  size: iconSize,
                ),
                onPressed: () {
                  audioPlayerUsecase.togglePlayPause();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.fast_forward,
                  size: iconSize,
                ),
                onPressed: () {
                  audioPlayerUsecase.seekForward(Duration(seconds: 10));
                },
              ),
            ],
          ),
        ),
        // ループアイコン
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              Icons.loop,
              size: iconSize,
              color: isLoopOn ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              audioPlayerUsecase.toggleLooping();
            },
          ),
        ),
      ],
    );
  }
}

class SeekBar extends ConsumerWidget {
  final AudioPlayerUsecase audioPlayerUsecase;

  const SeekBar({super.key, required this.audioPlayerUsecase});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(playbackPositionNotifierProvider);
    final double fontSize = Sizes.fontSmall(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // スライダーの左右の余白
          child: Slider(
            min: 0,
            max:
                audioPlayerUsecase.getTotalDuration().inMilliseconds.toDouble(),
            value: position.inMilliseconds.toDouble(),
            onChanged: (value) {
              if (audioPlayerUsecase.isPlaying()) {
                audioPlayerUsecase.stopPositionTracking();
              }
              audioPlayerUsecase
                  .updatePosition(Duration(milliseconds: value.toInt()));
            },
            onChangeEnd: (value) {
              if (audioPlayerUsecase.isPlaying() &&
                  !audioPlayerUsecase.isStartPositionTracking()) {
                audioPlayerUsecase.startPositionTracking();
              }
              audioPlayerUsecase.seek(Duration(milliseconds: value.toInt()));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${position.inMilliseconds} ミリ秒',
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
              ),
              Text(
                '${audioPlayerUsecase.getTotalDuration().inMilliseconds - position.inMilliseconds} ミリ秒',
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
