// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_job_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteJobStatusImpl _$$RemoteJobStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$RemoteJobStatusImpl(
      analysisType: $enumDecode(_$AnalysisTypeEnumMap, json['analysisType']),
      jobId: json['job_id'] as String,
      jobStatus: $enumDecode(_$JobStatusTypeEnumMap, json['job_status']),
      queuePosition: (json['queue_position'] as num).toInt(),
    );

Map<String, dynamic> _$$RemoteJobStatusImplToJson(
        _$RemoteJobStatusImpl instance) =>
    <String, dynamic>{
      'analysisType': _$AnalysisTypeEnumMap[instance.analysisType]!,
      'job_id': instance.jobId,
      'job_status': _$JobStatusTypeEnumMap[instance.jobStatus]!,
      'queue_position': instance.queuePosition,
    };

const _$AnalysisTypeEnumMap = {
  AnalysisType.uploading: 'uploading',
  AnalysisType.separating: 'separating',
  AnalysisType.compression: 'compression',
  AnalysisType.chordAnalysis: 'chordAnalysis',
  AnalysisType.extractingSpectrograms: 'extractingSpectrograms',
  AnalysisType.structureAnalysis: 'structureAnalysis',
  AnalysisType.lyricAnalysis: 'lyricAnalysis',
  AnalysisType.downloadSeparationResult: 'downloadSeparationResult',
  AnalysisType.downloadChordAnalysisResult: 'downloadChordAnalysisResult',
  AnalysisType.downloadStructureAnalysisResult:
      'downloadStructureAnalysisResult',
  AnalysisType.downloadLyricAnalysisResult: 'downloadLyricAnalysisResult',
};

const _$JobStatusTypeEnumMap = {
  JobStatusType.enqueueSuccess: 'enqueueSuccess',
  JobStatusType.queued: 'queued',
  JobStatusType.processingSoon: 'processingSoon',
  JobStatusType.jobSuccess: 'jobSuccess',
  JobStatusType.jobFailed: 'jobFailed',
};
