import 'package:bocchi_guitar_hub_client/domain/repository/remote_job_repository.dart';
import 'package:bocchi_guitar_hub_client/domain/repository/server_repository.dart';
import 'package:bocchi_guitar_hub_client/domain/repository/song_elements_repository.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/beat_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/chord_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/click_sound_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/job_status_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/lyric_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/section_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/separated_audio_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/webapi/song_webapi.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/repository/remote_job_repository_impl.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/repository/server_repository_impl.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/repository/song_elements_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/repository/song_repository.dart';
import 'datasource/database/song_datasource.dart';
import 'repository/song_repository_impl.dart';

part 'infrastructure_module.g.dart';

@riverpod
SongHive songDatasource(SongDatasourceRef ref) {
  // SongHiveインスタンスを返す
  return SongHive();
}

@riverpod
JobStatusHive jobStatusDatasource(JobStatusDatasourceRef ref) {
  return JobStatusHive();
}

@riverpod
SeparatedAudioHive separatedAudioDatasource(SeparatedAudioDatasourceRef ref) {
  return SeparatedAudioHive();
}

@riverpod
ChordsHive chordsDatasource(ChordsDatasourceRef ref) {
  return ChordsHive();
}

@riverpod
BeatsHive beatsDatasource(BeatsDatasourceRef ref) {
  return BeatsHive();
}

@riverpod
SectionsHive sectionsDatasource(SectionsDatasourceRef ref) {
  return SectionsHive();
}

@riverpod
LyricsHive lyricsDatasource(LyricsDatasourceRef ref) {
  return LyricsHive();
}

@riverpod
ClickSoundHive clickSoundDatasource(ClickSoundDatasourceRef ref) {
  return ClickSoundHive();
}

@riverpod
SongWebapi songWebapiDatasource(SongWebapiDatasourceRef ref) {
  return SongWebapi();
}

@riverpod
SongRepository songRepository(SongRepositoryRef ref) {
  return SongRepositoryImpl(ref.watch(songDatasourceProvider),
      ref.watch(songWebapiDatasourceProvider));
}

@riverpod
RemoteJobRepository remoteJobRepository(RemoteJobRepositoryRef ref) {
  return RemoteJobRepositoryImpl(
      ref.watch(jobStatusDatasourceProvider),
      ref.watch(songDatasourceProvider),
      ref.watch(songWebapiDatasourceProvider));
}

@riverpod
SongElementsRepository songElementsRepository(SongElementsRepositoryRef ref) {
  return SongElementsRepositoryImpl(
      ref.watch(separatedAudioDatasourceProvider),
      ref.watch(chordsDatasourceProvider),
      ref.watch(beatsDatasourceProvider),
      ref.watch(sectionsDatasourceProvider),
      ref.watch(lyricsDatasourceProvider),
      ref.watch(clickSoundDatasourceProvider),
      ref.watch(songWebapiDatasourceProvider));
}

@riverpod
ServerRepository serverRepository(ServerRepositoryRef ref) {
  return ServerRepositoryImpl(ref.watch(songWebapiDatasourceProvider));
}
