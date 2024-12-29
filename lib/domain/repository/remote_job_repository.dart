import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/remote_job/remote_job_status.dart';
import '../entity/song/song.dart';

abstract interface class RemoteJobRepository {
  Stream<RemoteJobStatus> requestRemoteJob(
      {required Song song, required RemoteJobType remoteJobType});

  Stream<RemoteJobStatus> requestBulkRemoteJob(
      {required Song song, required BulkRemoteJobType bulkRemoteJobType});

  Future<void> addRemoteJobStatus(
      {required String songId, required RemoteJobStatus remoteJobStatus});

  Future<void> updateRemoteJobStatus(
      {required String songId, required RemoteJobStatus remoteJobStatus});

  Future<void> deleteRemoteJobStatus({required String songId});

  RemoteJobStatus? fetchRemoteJobStatus({required int songId});
}
