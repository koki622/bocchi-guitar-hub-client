import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyric_word.freezed.dart';

@freezed
class LyricWord with _$LyricWord {
  factory LyricWord({
    required String word,
    required double start,
    required double end,
  }) = _LyricWord;
}
