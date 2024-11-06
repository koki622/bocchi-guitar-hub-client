import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric_word.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lyric.freezed.dart';

@freezed
class Lyric with _$Lyric {
  factory Lyric({
    required String segmentedLyric,
    required double start,
    required double end,
    required List<LyricWord> words,
  }) = _Lyric;
}
