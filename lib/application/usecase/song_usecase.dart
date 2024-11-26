import 'package:bocchi_guitar_hub_client/application/notifier/songs_notifier.dart';
import 'package:bocchi_guitar_hub_client/core/enum/job_status.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_step.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';
import 'package:bocchi_guitar_hub_client/core/exception/remote_job_exceptions.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/remote_job/remote_job_status.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/repository/remote_job_repository.dart';
import 'package:bocchi_guitar_hub_client/domain/repository/song_elements_repository.dart';
import 'package:bocchi_guitar_hub_client/domain/repository/song_repository.dart';
import 'package:path/path.dart';

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
      ProcessStep? nextProcess =
          currentSong.processType.nextProcess(currentSong.processStatusType);

      if (nextProcess == null) break;
      try {
        if (nextProcess.process.runtimeType == InitType) {
          throw Exception('${ProcessStep.init}はここでの使用が想定されていません');
        } else if (nextProcess.process.runtimeType == UploadType) {
          Song resultSong = await _upload(
              song: song,
              processType: nextProcess,
              uploadType: nextProcess.process as UploadType);
          currentSong = resultSong.copyWith();
        } else if (nextProcess.process.runtimeType == BulkRemoteJobType) {
          Song resultSong = await _bulkRemoteJob(
              song: currentSong,
              processType: nextProcess,
              bulkRemoteJobType: nextProcess.process as BulkRemoteJobType);
          currentSong = resultSong.copyWith();
        } else if (nextProcess.process.runtimeType == RemoteJobType) {
          Song resultSong = await _remoteJob(
              song: currentSong,
              processType: nextProcess,
              remoteJobType: nextProcess.process as RemoteJobType);
          currentSong = resultSong.copyWith();
        } else if (nextProcess.process.runtimeType == DownloadZipFileType) {
          Song resultSong = await _downloadZip(
              song: currentSong,
              processType: nextProcess,
              downloadZipFileType: nextProcess.process as DownloadZipFileType);
          currentSong = resultSong.copyWith();
        } else if (nextProcess.process.runtimeType == DownloadAudioFileType) {
          Song resultSong = await _downloadAudioFile(
              song: currentSong,
              processType: nextProcess,
              downloadAudioFileType:
                  nextProcess.process as DownloadAudioFileType);
          currentSong = resultSong.copyWith();
        } else if (nextProcess.process.runtimeType == DownloadJsonType) {
          Song resultSong = await _downloadJson(
              song: currentSong,
              processType: nextProcess,
              downloadJsonType: nextProcess.process as DownloadJsonType);
          currentSong = resultSong.copyWith();
        } else {
          throw Exception('${nextProcess.process}の使用は想定されていません');
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

  Future<Song> _updateSongProcess(
      // 曲の処理状況を更新する
      {required Song song,
      required ProcessStep processType,
      required ProcessStatusType processStatusType}) async {
    Song updateSong = song.copyWith(
        processType: processType, processStatusType: processStatusType);
    await _songRepository.updateSong(songId: song.songId, song: updateSong);
    _songsNotifier.upsertSong(updateSong);

    return updateSong;
  }

  Future<Song> _downloadJson(
      {required Song song,
      required ProcessStep processType,
      required DownloadJsonType downloadJsonType}) async {
    await _updateSongProcess(
        song: song,
        processType: processType,
        processStatusType: ProcessStatusType.processing);

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
      resultSong = await _updateSongProcess(
          song: song,
          processType: processType,
          processStatusType: processStatusType);
    }

    return resultSong;
  }

  Future<Song> _downloadAudioFile(
      {required Song song,
      required ProcessStep processType,
      required DownloadAudioFileType downloadAudioFileType}) async {
    await _updateSongProcess(
        song: song,
        processType: processType,
        processStatusType: ProcessStatusType.processing);

    ProcessStatusType processStatusType = ProcessStatusType.failed;
    Song resultSong;

    try {
      // ダウンロード
      await _songElementsRepository.downloadAudioFileType(
          song: song, downloadAudioFileType: downloadAudioFileType);
      processStatusType = ProcessStatusType.completed;
    } catch (e) {
      processStatusType = ProcessStatusType.failed;
      rethrow;
    } finally {
      resultSong = await _updateSongProcess(
          song: song,
          processType: processType,
          processStatusType: processStatusType);
    }

    return resultSong;
  }

  Future<Song> _downloadZip(
      {required Song song,
      required ProcessStep processType,
      required DownloadZipFileType downloadZipFileType}) async {
    await _updateSongProcess(
        song: song,
        processType: processType,
        processStatusType: ProcessStatusType.processing);

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
      resultSong = await _updateSongProcess(
          song: song,
          processType: processType,
          processStatusType: processStatusType);
    }

    return resultSong;
  }

  Future<Song> _upload(
      {required Song song,
      required ProcessStep processType,
      required UploadType uploadType}) async {
    await _updateSongProcess(
        song: song,
        processType: processType,
        processStatusType: ProcessStatusType.processing);

    ProcessStatusType processStatusType = ProcessStatusType.failed;
    String? audioFileId;
    Song resultSong;
    try {
      Song uploadedSong =
          await _songRepository.uploadSong(song: song, uploadType: uploadType);

      // 処理に成功
      audioFileId = uploadedSong.audioFileId;
      processStatusType = ProcessStatusType.completed;
    } catch (e) {
      // 処理に失敗
      processStatusType = ProcessStatusType.failed;
    } finally {
      // 最終結果のデータ用意
      resultSong = await _updateSongProcess(
          song: song.copyWith(audioFileId: audioFileId),
          processType: processType,
          processStatusType: processStatusType);
    }

    return resultSong;
  }

  Future<Song> _remoteJob(
      {required Song song,
      required ProcessStep processType,
      required RemoteJobType remoteJobType}) async {
    final resultSong = await _remoteJobHandle(song, processType);
    return resultSong;
  }

  Future<Song> _bulkRemoteJob(
      {required Song song,
      required ProcessStep processType,
      required BulkRemoteJobType bulkRemoteJobType}) async {
    final resultSong = await _remoteJobHandle(song, processType);
    return resultSong;
  }

  Future<Song> _remoteJobHandle(Song song, ProcessStep processType) async {
    ProcessStatusType lastProcessStatusType = ProcessStatusType.failed;
    Song resultSong;
    Stream<RemoteJobStatus> response;
    try {
      if (processType.process.runtimeType == RemoteJobType) {
        response = _remoteJobRepository.requestRemoteJob(
            song: song, remoteJobType: processType.process as RemoteJobType);
      } else if (processType.process.runtimeType == BulkRemoteJobType) {
        response = _remoteJobRepository.requestBulkRemoteJob(
            song: song,
            bulkRemoteJobType: processType.process as BulkRemoteJobType);
      } else {
        throw ArgumentError('ここで$processTypeが入ることは想定されていません');
      }
      await for (RemoteJobStatus jobStatus in response) {
        ProcessStatusType? processStatusType;
        switch (jobStatus.jobStatus) {
          case JobStatusType.jobSuccess:
            //processStatusType = ProcessStatusType.completed;
            lastProcessStatusType = ProcessStatusType.completed;
            break;
          case JobStatusType.jobCompleted:
            lastProcessStatusType = ProcessStatusType.completed;
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
          await _updateSongProcess(
              song: song,
              processType: processType,
              processStatusType: processStatusType);
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
      resultSong = await _updateSongProcess(
          song: song,
          processType: processType,
          processStatusType: lastProcessStatusType);
    }
    return resultSong;
  }
}
