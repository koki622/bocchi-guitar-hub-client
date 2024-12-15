import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/audio_player_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_volume_notifier.dart';
import 'package:bocchi_guitar_hub_client/presentation/notifier/selected_song.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/audio_player_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioPlayer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('オーディオプレイヤーで再描画');
    final selectedSong = ref.watch(selectedSongProvider);
    final audioPlayerUsecase =
        ref.watch(audioPlayerUsecaseProvider(selectedSong!));
    return audioPlayerUsecase.when(
      data: (state) {
        // 初期化完了後のUI
        return _buildPlayerUI(state);
      },
      error: (error, stackTrace) {
        // エラー発生時のUI
        return Center(child: Text('Error: $error'));
      },
      loading: () {
        // ロード中のUI
        return const Center(
          child: CircularProgressIndicator(), // 初期化中のインジケーター
        );
      },
    );
  }

  Widget _buildPlayerUI(AudioPlayerUsecase state) {
    // 再生ボタン、スライダーなど、プレイヤーのUIを構築
    return Column(
      children: [
        PlaybackControl(audioPlayerUsecase: state),
        SeekBar(audioPlayerUsecase: state),
        VolumeBar(audioPlayerUsecase: state, soundType: SoundType.vocals),
        VolumeBar(audioPlayerUsecase: state, soundType: SoundType.drums),
        VolumeBar(audioPlayerUsecase: state, soundType: SoundType.bass),
        VolumeBar(audioPlayerUsecase: state, soundType: SoundType.guitar),
        VolumeBar(audioPlayerUsecase: state, soundType: SoundType.piano),
        VolumeBar(audioPlayerUsecase: state, soundType: SoundType.other)
      ],
    );
  }
}

class PlaybackControl extends ConsumerWidget {
  final AudioPlayerUsecase audioPlayerUsecase;

  const PlaybackControl({super.key, required this.audioPlayerUsecase});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('再生停止で再描画');
    final isPlaying = ref.watch(playbackStateNotifierProvider);
    return IconButton(
      icon: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
      ),
      onPressed: () {
        audioPlayerUsecase.togglePlayPause();
      },
    );
  }
}

class SeekBar extends ConsumerWidget {
  final AudioPlayerUsecase audioPlayerUsecase;

  const SeekBar({super.key, required this.audioPlayerUsecase});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('再描画');
    final position = ref.watch(playbackPositionNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Slider(
          min: 0,
          max: audioPlayerUsecase.getTotalDuration().inMilliseconds.toDouble(),
          value: position.inMilliseconds.toDouble(),
          // スライダーをクリックしたとき
          onChanged: (value) {
            if (audioPlayerUsecase.isPlaying()) {
              audioPlayerUsecase.stopPositionTracking();
            }
            audioPlayerUsecase
                .updatePosition(Duration(milliseconds: value.toInt()));
          },
          // スライダーを離したとき
          onChangeEnd: (value) {
            if (audioPlayerUsecase.isPlaying() &&
                !audioPlayerUsecase.isStartPositionTracking()) {
              audioPlayerUsecase.startPositionTracking();
            }
            print('この位置にシークします${value}');
            audioPlayerUsecase.seek(Duration(milliseconds: value.toInt()));
          },
        ),
        // 現在の再生位置と合計時間を横並びで表示
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '現在の再生位置: ${position.inMilliseconds} ミリ秒',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                '合計時間: ${audioPlayerUsecase.getTotalDuration().inMilliseconds} ミリ秒',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
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
    return Column(
      children: [
        Text(soundType.name),
        Row(
          children: [
            IconButton(
              icon: isSoundOn
                  ? const Icon(Icons.volume_up)
                  : const Icon(Icons.volume_off),
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
            ))
          ],
        )
      ],
    );
  }
}
