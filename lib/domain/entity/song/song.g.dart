// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongImpl _$$SongImplFromJson(Map<String, dynamic> json) => _$SongImpl(
      songId: (json['songId'] as num).toInt(),
      audioFileId: json['audioFileId'] as String?,
      destApiServerType:
          $enumDecode(_$DestApiServerTypeEnumMap, json['destApiServerType']),
      title: json['title'] as String,
      filePath: json['filePath'] as String,
      directoryPath: json['directoryPath'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      processType: $enumDecode(_$ProcessStepEnumMap, json['processType']),
      processStatusType:
          $enumDecode(_$ProcessStatusTypeEnumMap, json['processStatusType']),
    );

Map<String, dynamic> _$$SongImplToJson(_$SongImpl instance) =>
    <String, dynamic>{
      'songId': instance.songId,
      'audioFileId': instance.audioFileId,
      'destApiServerType':
          _$DestApiServerTypeEnumMap[instance.destApiServerType]!,
      'title': instance.title,
      'filePath': instance.filePath,
      'directoryPath': instance.directoryPath,
      'createdAt': instance.createdAt.toIso8601String(),
      'processType': _$ProcessStepEnumMap[instance.processType]!,
      'processStatusType':
          _$ProcessStatusTypeEnumMap[instance.processStatusType]!,
    };

const _$DestApiServerTypeEnumMap = {
  DestApiServerType.main: 'main',
  DestApiServerType.sub: 'sub',
};

const _$ProcessStepEnumMap = {
  ProcessStep.init: 'init',
  ProcessStep.uploading: 'uploading',
  ProcessStep.bulkRemoteJob: 'bulkRemoteJob',
  ProcessStep.downloadVocalsStem: 'downloadVocalsStem',
  ProcessStep.downloadDrumsStem: 'downloadDrumsStem',
  ProcessStep.downloadBassStem: 'downloadBassStem',
  ProcessStep.downloadGuitarStem: 'downloadGuitarStem',
  ProcessStep.downloadPianoStem: 'downloadPianoStem',
  ProcessStep.downloadOtherStem: 'downloadOtherStem',
  ProcessStep.downloadClickSoundNormal: 'downloadClickSoundNormal',
  ProcessStep.downloadClickSound2x: 'downloadClickSound2x',
  ProcessStep.downloadClickSoundHalf: 'downloadClickSoundHalf',
  ProcessStep.downloadChordSound: 'downloadChordSound',
  ProcessStep.downloadChordAnalysisResult: 'downloadChordAnalysisResult',
  ProcessStep.downloadStructureAnalysisResult:
      'downloadStructureAnalysisResult',
  ProcessStep.downloadLyricAnalysisResult: 'downloadLyricAnalysisResult',
};

const _$ProcessStatusTypeEnumMap = {
  ProcessStatusType.processing: 'processing',
  ProcessStatusType.failed: 'failed',
  ProcessStatusType.completed: 'completed',
  ProcessStatusType.interrupted: 'interrupted',
};
