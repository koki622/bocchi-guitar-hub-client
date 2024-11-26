import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/core/enum/job_status.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/remote_job/remote_job_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'job_status.freezed.dart';
part 'job_status.g.dart';

@freezed
class JobStatusData with _$JobStatusData {
  @HiveType(typeId: HiveBoxConstant.jobStatusBoxTypeId)
  const factory JobStatusData({
    @JsonKey(name: 'job_name') @HiveField(0) required String jobName,
    @JsonKey(name: 'job_id') @HiveField(1) required String jobId,
    @JsonKey(name: 'job_status') @HiveField(2) required String jobStatus,
    @JsonKey(name: 'queue_position', defaultValue: -1)
    @HiveField(3)
    required int queuePosition,
  }) = _JobStatusData;

  factory JobStatusData.fromJson(Map<String, dynamic> json) =>
      _$JobStatusDataFromJson(json);
}

extension JobStatusDataX on JobStatusData {
  RemoteJobStatus toEntity() => RemoteJobStatus(
      currentRemoteJobType: RemoteJobType.fromJobName(jobName),
      jobId: jobId,
      jobStatus: JobStatusType.fromMessage(jobStatus),
      queuePosition: queuePosition);
}
