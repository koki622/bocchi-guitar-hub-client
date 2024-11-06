// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChordsResponseImpl _$$ChordsResponseImplFromJson(Map<String, dynamic> json) =>
    _$ChordsResponseImpl(
      chords: (json['chords'] as List<dynamic>)
          .map((e) => ChordResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChordsResponseImplToJson(
        _$ChordsResponseImpl instance) =>
    <String, dynamic>{
      'chords': instance.chords,
    };

_$ChordResponseImpl _$$ChordResponseImplFromJson(Map<String, dynamic> json) =>
    _$ChordResponseImpl(
      time: (json['time'] as num).toDouble(),
      duration: (json['duration'] as num).toDouble(),
      value: json['value'] as String,
    );

Map<String, dynamic> _$$ChordResponseImplToJson(_$ChordResponseImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'duration': instance.duration,
      'value': instance.value,
    };
