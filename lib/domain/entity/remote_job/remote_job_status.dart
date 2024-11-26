import 'package:bocchi_guitar_hub_client/core/enum/job_status.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_job_status.freezed.dart';

@freezed
class RemoteJobStatus with _$RemoteJobStatus {
  factory RemoteJobStatus(
      {required RemoteJobType currentRemoteJobType,
      required String jobId,
      required JobStatusType jobStatus,
      required int queuePosition}) = _RemoteJobStatus;
}
