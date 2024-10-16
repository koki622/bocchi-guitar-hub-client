import 'dart:async';

import 'package:bocchi_guitar_hub_client/core/enum/analysis_status.dart';
import 'package:bocchi_guitar_hub_client/core/enum/remote_job.dart';
import 'package:bocchi_guitar_hub_client/core/exception/http_exceptions.dart';
import 'package:bocchi_guitar_hub_client/core/exception/remote_job_exceptions.dart';
import 'package:bocchi_guitar_hub_client/domain/song/entity/remote_job_status.dart';
import 'package:bocchi_guitar_hub_client/domain/song/entity/song.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/job_status_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/song_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/webapi/song_webapi.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/job_status.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song.dart';
import 'package:http/http.dart';

import '../../domain/song/repository/remote_job_repository.dart';

class RemoteJobRepositoryImpl implements RemoteJobRepository {
  final JobStatusHive _jobStatusHive;
  final SongHive _songHive;
  final SongWebapi _songWebapi;

  RemoteJobRepositoryImpl(
      this._jobStatusHive, this._songHive, this._songWebapi);

  @override
  Stream<RemoteJobStatus> requestRemoteJob(
      {required Song song, required RemoteJobType remoteJobType}) async* {
    String endpoint = remoteJobType.endpoint + song.audioFileId;

    Stream<JobStatusData> response = _songWebapi.sendRequestJob(endpoint);
    try {
      await for (JobStatusData jobStatusData in response) {
        yield jobStatusData.toEntity(analysisType: remoteJobType.analysisType);

        // データベースにジョブのステータスを随時記録
        _jobStatusHive.create(jobStatusData, song.songId);
      }

      // ジョブが成功したら現在のステータスの進行を更新
      _songHive.update(
          SongData.fromEntity(
              song.copyWith(analysisStatusType: AnalysisStatusType.completed)),
          song.songId);
    } on HttpException catch (e) {
      throw RequestFailedException('Request Failed exception: $e');
    } on ClientException catch (e) {
      // ジョブのリクエストには成功したが、接続が失われた場合
      _songHive.update(
          SongData.fromEntity(song.copyWith(
              analysisStatusType: AnalysisStatusType.interrupted)),
          song.songId);
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
