import 'dart:async';

import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/core/exception/http_exceptions.dart';
import 'package:bocchi_guitar_hub_client/core/exception/remote_job_exceptions.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/remote_job/remote_job_status.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/job_status_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/song_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/webapi/song_webapi.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/remote_job/job_status.dart';
import 'package:http/http.dart';

import '../../domain/repository/remote_job_repository.dart';

class RemoteJobRepositoryImpl implements RemoteJobRepository {
  final JobStatusHive _jobStatusHive;
  final SongHive _songHive;
  final SongWebapi _songWebapi;

  RemoteJobRepositoryImpl(
      this._jobStatusHive, this._songHive, this._songWebapi);

  @override
  Stream<RemoteJobStatus> requestRemoteJob(
      {required Song song, required RemoteJobType remoteJobType}) async* {
    String? audioFileId = song.audioFileId;
    if (audioFileId == null) {
      throw Exception('audioFileId is Null');
    }
    String endpoint = remoteJobType.endpoint + audioFileId;
    yield* _handleJobRequest(endpoint: endpoint, songId: song.songId);
  }

  @override
  Stream<RemoteJobStatus> requestBulkRemoteJob(
      {required Song song,
      required BulkRemoteJobType bulkRemoteJobType}) async* {
    String? audioFileId = song.audioFileId;
    if (audioFileId == null) {
      throw Exception('audioFileId is Null');
    }
    String endpoint = bulkRemoteJobType.endpoint + audioFileId;
    yield* _handleJobRequest(endpoint: endpoint, songId: song.songId);
  }

  Stream<RemoteJobStatus> _handleJobRequest({
    required String endpoint,
    required int songId,
  }) async* {
    Stream<JobStatusData> response =
        _songWebapi.sendRequestJob(endpoint: endpoint);

    try {
      await for (JobStatusData jobStatusData in response) {
        yield jobStatusData.toEntity();

        // データベースにジョブのステータスを随時記録
        _jobStatusHive.create(jobStatusData, songId);
      }
    } on HttpException catch (e) {
      throw RequestFailedException('Request Failed exception: $e');
    } on ClientException catch (e) {
      // ジョブのリクエストには成功したが、接続が失われた場合
      throw ServerDisconnectedException('Server Disconnected exception: $e');
    } on JobFailedException {
      // ジョブが失敗した場合、何もしない
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<RemoteJobStatus> reconnectBulkRemoteJob(
      {required Song song,
      required BulkRemoteJobType bulkRemoteJobType}) async* {
    final jobStatusData = _jobStatusHive.readJobStatus(song.songId);
    if (jobStatusData == null) {
      throw Exception('ジョブステータスのデータがないため、再接続できません');
    }
    String? audioFileId = song.audioFileId;
    if (audioFileId == null) {
      throw Exception('audioFileId is Null');
    }
    String endpoint = bulkRemoteJobType.endpoint + audioFileId;
    Stream<JobStatusData> response = _songWebapi.sendRequestJob(
        endpoint: endpoint, jobId: jobStatusData.jobId);
    try {
      await for (JobStatusData jobStatusData in response) {
        yield jobStatusData.toEntity();

        // データベースにジョブのステータスを随時記録
        _jobStatusHive.create(jobStatusData, song.songId);
      }
    } on HttpException catch (e) {
      throw RequestFailedException('Request Failed exception: $e');
    } on ClientException catch (e) {
      // ジョブのリクエストには成功したが、接続が失われた場合
      throw ServerDisconnectedException('Server Disconnected exception: $e');
    } on JobFailedException {
      // ジョブが失敗した場合、何もしない
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addRemoteJobStatus(
      {required String songId, required RemoteJobStatus remoteJobStatus}) {
    // TODO: implement addRemoteJobStatus
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRemoteJobStatus({required String songId}) {
    // TODO: implement deleteRemoteJobStatus
    throw UnimplementedError();
  }

  @override
  Future<RemoteJobStatus> fetchRemoteJobStatus(
      {required String songId, required RemoteJobType remoteJobType}) {
    // TODO: implement fetchRemoteJobStatus
    throw UnimplementedError();
  }

  @override
  Future<void> updateRemoteJobStatus(
      {required String songId, required RemoteJobStatus remoteJobStatus}) {
    // TODO: implement updateRemoteJobStatus
    throw UnimplementedError();
  }
}
