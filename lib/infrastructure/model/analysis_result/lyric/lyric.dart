import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyric.freezed.dart';
part 'lyric.g.dart';

@freezed
class LyricsResponse with _$LyricsResponse {
  const factory LyricsResponse({
    required List<LyricResponse> segments,
    required List<LyricResponse> word,
  }) = _LyricsResponse;

  factory LyricsResponse.fromJson(Map<String, dynamic> json) =>
      _$LyricsResponseFromJson(json);
}

@freezed
class LyricResponse with _$LyricResponse {
  const factory LyricResponse({
    required double start,
    required double end,
    required String text,
  }) = _LyricResponse;

  factory LyricResponse.fromJson(Map<String, dynamic> json) =>
      _$LyricResponseFromJson(json);
}
