import 'package:bocchi_guitar_hub_client/core/enum/analysis.dart';
import 'package:bocchi_guitar_hub_client/core/enum/analysis_status.dart';
import 'package:bocchi_guitar_hub_client/core/enum/job_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_job_status.freezed.dart';
part 'remote_job_status.g.dart';

@freezed
class RemoteJobStatus with _$RemoteJobStatus {
  factory RemoteJobStatus(
          {required AnalysisType analysisType,
          @JsonKey(name: 'job_id') required String jobId,
          @JsonKey(name: 'job_status') required JobStatusType jobStatus,
          @JsonKey(name: 'queue_position') required int queuePosition}) =
      _RemoteJobStatus;

  factory RemoteJobStatus.fromJson(Map<String, dynamic> json) =>
      _$RemoteJobStatusFromJson(json);
}
