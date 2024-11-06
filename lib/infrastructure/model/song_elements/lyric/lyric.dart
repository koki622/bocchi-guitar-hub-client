import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric_word.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/analysis_result/lyric/lyric.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'lyric.freezed.dart';
part 'lyric.g.dart';

@freezed
class LyricsData with _$LyricsData {
  @HiveType(typeId: HiveBoxConstant.lyricsBoxTypeId)
  const factory LyricsData({
    @HiveField(0) required List<LyricData> lyrics,
  }) = _LyricsData;

  // LyricsResponseからLyricsDataに変換するメソッド
  factory LyricsData.fromLyricsResponse(LyricsResponse response) {
    final List<LyricData> lyricsList = response.segments.map((segment) {
      final List<LyricWordData> words = response.word
          .where(
              (word) => word.start >= segment.start && word.end <= segment.end)
          .map((word) => LyricWordData(
                word: word.text,
                start: word.start,
                end: word.end,
              ))
          .toList();

      return LyricData(
        segmentedLyric: segment.text, // テキストはセグメントから取得
        start: segment.start,
        end: segment.end,
        words: words,
      );
    }).toList();

    return LyricsData(lyrics: lyricsList);
  }
}

extension LyricsDataX on LyricsData {
  List<Lyric> toEntityList() {
    return lyrics
        .map((lyricData) => Lyric(
              segmentedLyric: lyricData.segmentedLyric,
              start: lyricData.start,
              end: lyricData.end,
              words: lyricData.words
                  .map((lyricWordData) => LyricWord(
                        word: lyricWordData.word,
                        start: lyricWordData.start,
                        end: lyricWordData.end,
                      ))
                  .toList(),
            ))
        .toList();
  }
}

@HiveType(typeId: HiveBoxConstant.lyricTypeId)
class LyricData {
  @HiveField(0)
  String segmentedLyric;

  @HiveField(1)
  double start;

  @HiveField(2)
  double end;

  @HiveField(3)
  List<LyricWordData> words;

  LyricData(
      {required this.segmentedLyric,
      required this.start,
      required this.end,
      required this.words});
}

@HiveType(typeId: HiveBoxConstant.lyricWordTypeId)
class LyricWordData {
  @HiveField(0)
  String word;

  @HiveField(1)
  double start;

  @HiveField(2)
  double end;

  LyricWordData({required this.word, required this.start, required this.end});
}
