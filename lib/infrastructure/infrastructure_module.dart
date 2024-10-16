import 'package:bocchi_guitar_hub_client/domain/song/repository/remote_job_repository.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/job_status_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/webapi/song_webapi.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/repository/remote_job_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/song/repository/song_repository.dart';
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
