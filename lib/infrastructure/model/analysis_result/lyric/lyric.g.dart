// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LyricsResponseImpl _$$LyricsResponseImplFromJson(Map<String, dynamic> json) =>
    _$LyricsResponseImpl(
      segments: (json['segments'] as List<dynamic>)
          .map((e) => LyricResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      word: (json['word'] as List<dynamic>)
          .map((e) => LyricResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LyricsResponseImplToJson(
        _$LyricsResponseImpl instance) =>
    <String, dynamic>{
      'segments': instance.segments,
      'word': instance.word,
    };

_$LyricResponseImpl _$$LyricResponseImplFromJson(Map<String, dynamic> json) =>
    _$LyricResponseImpl(
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$LyricResponseImplToJson(_$LyricResponseImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
      'text': instance.text,
    };
