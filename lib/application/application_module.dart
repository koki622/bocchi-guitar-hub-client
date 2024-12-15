import 'dart:async';

import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/audio_player_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_volume_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/songs/songs_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/audio_player_usecase.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/song_usecase.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/infrastructure_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_module.g.dart';

@riverpod
SongUsecase songUsecase(SongUsecaseRef ref) {
  return SongUsecase(
      ref.watch(songsNotifierProvider.notifier),
      ref.watch(songRepositoryProvider),
      ref.watch(songElementsRepositoryProvider),
      ref.watch(remoteJobRepositoryProvider));
}

@riverpod
Future<AudioPlayerUsecase> audioPlayerUsecase(Ref ref, Song song) async {
  final playbackStateNotifier =
      ref.watch(playbackStateNotifierProvider.notifier);
  final playbackPositionNotifier =
      ref.watch(playbackPositionNotifierProvider.notifier);
  final playbackVolumeNotifier =
      ref.watch(playbackVolumeNotifierProvider.notifier);
  final initVolumes = playbackVolumeNotifier.currentStates;
  final audioPlayer =
      await ref.watch(audioPlayerProvider(song, initVolumes).future);
  final usecase = AudioPlayerUsecase(audioPlayer, playbackStateNotifier,
      playbackPositionNotifier, playbackVolumeNotifier);
  ref.onDispose(() {
    usecase.dispose();
  });
  return usecase;
}
