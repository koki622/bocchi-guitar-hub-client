// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StructureResponseImpl _$$StructureResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StructureResponseImpl(
      beats: (json['beats'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      beatPositions: (json['beat_positions'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      segments: (json['segments'] as List<dynamic>)
          .map((e) => SegmentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StructureResponseImplToJson(
        _$StructureResponseImpl instance) =>
    <String, dynamic>{
      'beats': instance.beats,
      'beat_positions': instance.beatPositions,
      'segments': instance.segments,
    };

_$SegmentResponseImpl _$$SegmentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SegmentResponseImpl(
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
      label: json['label'] as String,
    );

Map<String, dynamic> _$$SegmentResponseImplToJson(
        _$SegmentResponseImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
      'label': instance.label,
    };
