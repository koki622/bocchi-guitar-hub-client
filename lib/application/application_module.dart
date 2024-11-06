import 'package:bocchi_guitar_hub_client/application/notifier/songs_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/song_usecase.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/infrastructure_module.dart';
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
