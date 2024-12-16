import 'dart:async';

import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/audio_player_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_volume_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/chord_diagram/chord_diagram_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/chord_diagram/current_chord_diagram_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/song_elements/song_elements_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/songs/songs_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/audio_player_usecase.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/chord_diagram_usecase.dart';
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

@riverpod
Future<ChordDiagramUsecase> chordDiagramUsecase(Ref ref, Song song) async {
  final chords = ref.watch(chordNotifierProvider(song));
  final chordDiagramNotifier =
      ref.watch(chordDiagramNotifierProvider(chords).notifier);
  final chordChangeNotifier =
      ref.watch(chordChangeNotifierProvider(chords).notifier);
  final currentChordDiagramNotifier = ref.watch(
      currentChordDiagramNotifierProvider(chordChangeNotifier.getState)
          .notifier);
  final chordDiagramStates =
      await ref.watch(chordDiagramNotifierProvider(chords).future);
  return ChordDiagramUsecase(
      chordDiagramNotifier, currentChordDiagramNotifier, chordDiagramStates);
}
