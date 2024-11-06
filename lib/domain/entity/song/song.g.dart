// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongImpl _$$SongImplFromJson(Map<String, dynamic> json) => _$SongImpl(
      songId: (json['songId'] as num).toInt(),
      audioFileId: json['audioFileId'] as String?,
      title: json['title'] as String,
      filePath: json['filePath'] as String,
      directoryPath: json['directoryPath'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      processType: $enumDecode(_$ProcessTypeEnumMap, json['processType']),
      processStatusType:
          $enumDecode(_$ProcessStatusTypeEnumMap, json['processStatusType']),
    );

Map<String, dynamic> _$$SongImplToJson(_$SongImpl instance) =>
    <String, dynamic>{
      'songId': instance.songId,
      'audioFileId': instance.audioFileId,
      'title': instance.title,
      'filePath': instance.filePath,
      'directoryPath': instance.directoryPath,
      'createdAt': instance.createdAt.toIso8601String(),
      'processType': _$ProcessTypeEnumMap[instance.processType]!,
      'processStatusType':
          _$ProcessStatusTypeEnumMap[instance.processStatusType]!,
    };

const _$ProcessTypeEnumMap = {
  ProcessType.init: 'init',
  ProcessType.uploading: 'uploading',
  ProcessType.separating: 'separating',
  ProcessType.compression: 'compression',
  ProcessType.chordAnalysis: 'chordAnalysis',
  ProcessType.extractingSpectrograms: 'extractingSpectrograms',
  ProcessType.structureAnalysis: 'structureAnalysis',
  ProcessType.lyricAnalysis: 'lyricAnalysis',
  ProcessType.downloadSeparationResult: 'downloadSeparationResult',
  ProcessType.downloadChordAnalysisResult: 'downloadChordAnalysisResult',
  ProcessType.downloadStructureAnalysisResult:
      'downloadStructureAnalysisResult',
  ProcessType.downloadLyricAnalysisResult: 'downloadLyricAnalysisResult',
};

const _$ProcessStatusTypeEnumMap = {
  ProcessStatusType.processing: 'processing',
  ProcessStatusType.failed: 'failed',
  ProcessStatusType.completed: 'completed',
  ProcessStatusType.interrupted: 'interrupted',
};
