import 'package:bocchi_guitar_hub_client/core/enum/remote_job.dart';
import 'package:bocchi_guitar_hub_client/domain/song/entity/remote_job_status.dart';
import 'package:bocchi_guitar_hub_client/domain/song/entity/song.dart';
import 'package:bocchi_guitar_hub_client/domain/song/repository/remote_job_repository.dart';
import 'package:bocchi_guitar_hub_client/domain/song/repository/song_repository.dart';
import 'package:flutter/foundation.dart';

class SongUsecase {
  final SongRepository _songRepository;
  final RemoteJobRepository _remoteJobRepository;

  SongUsecase(this._songRepository, this._remoteJobRepository);

  Future<Song> addSong(
      {required String title, required String filePath}) async {
    NewSong newSong = NewSong(title: title, filePath: filePath);
    Song song = await _songRepository.addSong(newSong: newSong);
    debugPrint('曲の追加が完了しました: $song');
    return song;
  }

  Future<void> analysis(
      {required Song song, required RemoteJobType startRemoteJob}) async {
    // どの処理から始めるか決める
    List<RemoteJobType> remoteJobTypes =
        RemoteJobType.getJobsFromAndAfter(startRemoteJob);

    try {
      for (RemoteJobType remoteJobType in remoteJobTypes) {
        Stream<RemoteJobStatus> response = _remoteJobRepository
            .requestRemoteJob(song: song, remoteJobType: remoteJobType);

        await for (RemoteJobStatus jobStatus in response) {
          print('ジョブのステータス: $jobStatus');
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
