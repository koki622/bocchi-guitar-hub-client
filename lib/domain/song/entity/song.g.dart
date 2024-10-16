// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongImpl _$$SongImplFromJson(Map<String, dynamic> json) => _$SongImpl(
      songId: (json['songId'] as num).toInt(),
      audioFileId: json['audioFileId'] as String,
      title: json['title'] as String,
      filePath: json['filePath'] as String,
      directoryPath: json['directoryPath'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      analysisType: $enumDecode(_$AnalysisTypeEnumMap, json['analysisType']),
      analysisStatusType:
          $enumDecode(_$AnalysisStatusTypeEnumMap, json['analysisStatusType']),
    );

Map<String, dynamic> _$$SongImplToJson(_$SongImpl instance) =>
    <String, dynamic>{
      'songId': instance.songId,
      'audioFileId': instance.audioFileId,
      'title': instance.title,
      'filePath': instance.filePath,
      'directoryPath': instance.directoryPath,
      'createdAt': instance.createdAt.toIso8601String(),
      'analysisType': _$AnalysisTypeEnumMap[instance.analysisType]!,
      'analysisStatusType':
          _$AnalysisStatusTypeEnumMap[instance.analysisStatusType]!,
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

const _$AnalysisStatusTypeEnumMap = {
  AnalysisStatusType.processing: 'processing',
  AnalysisStatusType.failed: 'failed',
  AnalysisStatusType.completed: 'completed',
  AnalysisStatusType.interrupted: 'interrupted',
};
