import 'package:bocchi_guitar_hub_client/core/enum/remote_job.dart';
import 'package:bocchi_guitar_hub_client/domain/song/entity/remote_job_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/song.dart';

final remoteJobRepositoryProvider = Provider<RemoteJobRepository>(
  (_) => throw UnimplementedError(),
);

abstract interface class RemoteJobRepository {
  Stream<RemoteJobStatus> requestRemoteJob(
      {required Song song, required RemoteJobType remoteJobType});

  Future<void> addRemoteJobStatus(
      {required String songId, required RemoteJobStatus remoteJobStatus});

  Future<void> updateRemoteJobStatus(
      {required String songId, required RemoteJobStatus remoteJobStatus});

  Future<void> deleteRemoteJobStatus({required String songId});

  Future<RemoteJobStatus> fetchRemoteJobStatus(
      {required String songId, required RemoteJobType remoteJobType});
}