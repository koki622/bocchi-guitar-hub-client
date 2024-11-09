import 'package:bocchi_guitar_hub_client/application/notifier/songs_notifier.dart';
import 'package:bocchi_guitar_hub_client/core/enum/download_json.dart';
import 'package:bocchi_guitar_hub_client/core/enum/download_zip_file.dart';
import 'package:bocchi_guitar_hub_client/core/enum/job_status.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';
import 'package:bocchi_guitar_hub_client/core/enum/remote_job.dart';
import 'package:bocchi_guitar_hub_client/core/exception/remote_job_exceptions.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/remote_job/remote_job_status.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/repository/remote_job_repository.dart';
import 'package:bocchi_guitar_hub_client/domain/repository/song_elements_repository.dart';
import 'package:bocchi_guitar_hub_client/domain/repository/song_repository.dart';

class SongUsecase {
  final SongsNotifier _songsNotifier;
  final SongRepository _songRepository;
  final SongElementsRepository _songElementsRepository;
  final RemoteJobRepository _remoteJobRepository;

  SongUsecase(this._songsNotifier, this._songRepository,
      this._songElementsRepository, this._remoteJobRepository);

  List<Song?> fetchAllSongs() {
    return _songRepository.fetchAllSong();
  }

  Future<void> addSong(
      {required String title, required String filePath}) async {
    NewSong newSong = NewSong(title: title, filePath: filePath);
    Song unuploadedSong = await _songRepository.addSong(newSong: newSong);
    _songsNotifier.upsertSong(unuploadedSong);
    await executeProcess(song: unuploadedSong);
  }

  Future<void> deleteSong({required Song song}) async {
    try {
      await _songRepository.deleteSong(song: song);
      await _songElementsRepository.deleteSongElements(song: song);
      _songsNotifier.deleteSong(song.songId);
    } catch (e) {
      Exception('削除処理中に例外発生: $e');
    }
  }

  Future<void> executeProcess({required Song song}) async {
    Song currentSong = song.copyWith();
    while (true) {
      // 次に実行すべきプロセスを得る
      ProcessType? nextProcess =
          currentSong.processType.nextProcess(currentSong.processStatusType);

      if (nextProcess == null) break;
      try {
        switch (nextProcess.category) {
          case ProcessCategory.init:
            throw Exception('${ProcessCategory.init}はここでの使用が想定されていません');

          case ProcessCategory.upload:
            Song resultSong = await _upload(song: song);
            currentSong = resultSong.copyWith();
            break;

          case ProcessCategory.remoteJob:
            Song resultSong = await _remoteJob(
                song: currentSong,
                remoteJobType: RemoteJobType.fromProcessType(nextProcess));
            currentSong = resultSong.copyWith();
            break;

          case ProcessCategory.downloadZip:
            Song resultSong = await _downloadZip(
                song: currentSong,
                downloadZipFileType:
                    DownloadZipFileType.fromProcessType(nextProcess));
            currentSong = resultSong.copyWith();
            break;

          case ProcessCategory.downloadJson:
            Song resultSong = await _downloadJson(
                song: currentSong,
                downloadJsonType:
                    DownloadJsonType.fromProcessType(nextProcess));
            currentSong = resultSong.copyWith();
            break;
        }

        if (currentSong.processStatusType != ProcessStatusType.completed) {
          throw Exception('処理に失敗');
        }
      } catch (e) {
        print('エラーが発生: $e');
        break;
      }
    }
  }

  Future<Song> _downloadJson(
      {required Song song, required DownloadJsonType downloadJsonType}) async {
    final processType = downloadJsonType.processType;

    Song processingSong = song.copyWith(
        processType: processType,
        processStatusType: ProcessStatusType.processing);

    // 処理前にステータスを更新
    await _songRepository.updateSong(songId: song.songId, song: processingSong);
    _songsNotifier.upsertSong(processingSong);

    ProcessStatusType processStatusType = ProcessStatusType.failed;
    Song resultSong;

    try {
      // ダウンロードと永続化
      await _songElementsRepository.downloadAndSaveJsonType(
          song: song, downloadJsonType: downloadJsonType);

      processStatusType = ProcessStatusType.completed;
    } catch (e) {
      processStatusType = ProcessStatusType.failed;
      rethrow;
    } finally {
      resultSong = song.copyWith(
          processType: processType, processStatusType: processStatusType);
      await _songRepository.updateSong(songId: song.songId, song: resultSong);
      _songsNotifier.upsertSong(resultSong);
    }

    return resultSong;
  }

  Future<Song> _downloadZip(
      {required Song song,
      required DownloadZipFileType downloadZipFileType}) async {
    final processType = downloadZipFileType.processType;

    Song processingSong = song.copyWith(
        processType: processType,
        processStatusType: ProcessStatusType.processing);

    // 処理前にステータスを更新
    await _songRepository.updateSong(songId: song.songId, song: processingSong);
    _songsNotifier.upsertSong(processingSong);

    ProcessStatusType processStatusType = ProcessStatusType.failed;
    Song resultSong;

    try {
      // ダウンロード
      await _songElementsRepository.downloadAndSaveZipFileType(
          song: song, downloadZipFileType: downloadZipFileType);
      processStatusType = ProcessStatusType.completed;
    } catch (e) {
      processStatusType = ProcessStatusType.failed;
      rethrow;
    } finally {
      resultSong = song.copyWith(
          processType: processType, processStatusType: processStatusType);
      await _songRepository.updateSong(songId: song.songId, song: resultSong);
      _songsNotifier.upsertSong(resultSong);
    }

    return resultSong;
  }

  Future<Song> _upload({required Song song}) async {
    const processType = ProcessType.uploading;
    Song processingSong = song.copyWith(
        processType: processType,
        processStatusType: ProcessStatusType.processing);

    // 処理前にステータスを更新
    await _songRepository.updateSong(songId: song.songId, song: processingSong);
    _songsNotifier.upsertSong(processingSong);

    ProcessStatusType processStatusType = ProcessStatusType.failed;
    String? audioFileId;
    Song resultSong;
    try {
      Song uploadedSong = await _songRepository.uploadSong(song: song);

      // 処理に成功
      audioFileId = uploadedSong.audioFileId;
      processStatusType = ProcessStatusType.completed;
    } catch (e) {
      // 処理に失敗
      processStatusType = ProcessStatusType.failed;
    } finally {
      // 最終結果のデータ用意
      resultSong = song.copyWith(
          audioFileId: audioFileId,
          processType: processType,
          processStatusType: processStatusType);
      // 最終結果のデータを更新
      await _songRepository.updateSong(songId: song.songId, song: resultSong);
      _songsNotifier.upsertSong(resultSong);
    }

    return resultSong;
  }

  Future<Song> _remoteJob(
      {required Song song, required RemoteJobType remoteJobType}) async {
    ProcessStatusType lastProcessStatusType = ProcessStatusType.failed;
    Song resultSong;
    try {
      Stream<RemoteJobStatus> response = _remoteJobRepository.requestRemoteJob(
          song: song, remoteJobType: remoteJobType);

      await for (RemoteJobStatus jobStatus in response) {
        print('ジョブのステータス: $jobStatus');

        ProcessStatusType? processStatusType;
        switch (jobStatus.jobStatus) {
          case JobStatusType.jobSuccess:
            //processStatusType = ProcessStatusType.completed;
            lastProcessStatusType = ProcessStatusType.completed;
            break;
          case JobStatusType.jobFailed:
            //processStatusType = ProcessStatusType.failed;
            break;
          case JobStatusType.enqueueSuccess:
            processStatusType = ProcessStatusType.processing;
            break;
          case JobStatusType.processingSoon:
            break;
          case JobStatusType.queued:
            break;
        }
        if (processStatusType != null) {
          Song updatedSong = song.copyWith(
              processType: remoteJobType.processType,
              processStatusType: processStatusType);

          await _songRepository.updateSong(
              songId: song.songId, song: updatedSong);
          _songsNotifier.upsertSong(updatedSong);
        }
      }
    } on RequestFailedException catch (e) {
      lastProcessStatusType = ProcessStatusType.failed;
      throw Exception(e);
    } on ServerDisconnectedException catch (e) {
      lastProcessStatusType = ProcessStatusType.interrupted;
      throw Exception(e);
    } on JobFailedException catch (e) {
      lastProcessStatusType = ProcessStatusType.failed;
      throw Exception(e);
    } finally {
      resultSong = song.copyWith(
          processType: remoteJobType.processType,
          processStatusType: lastProcessStatusType);
      _songRepository.updateSong(songId: song.songId, song: resultSong);
      _songsNotifier.upsertSong(resultSong);
    }
    return resultSong;
  }
}
