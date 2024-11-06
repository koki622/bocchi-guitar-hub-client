import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/lyric/lyric.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LyricsHive {
  final Box<LyricsData> _box =
      Hive.box<LyricsData>(HiveBoxConstant.lyricsBoxName);

  Future<void> create(LyricsData lyricsData, int songId) async {
    await _box.put(songId, lyricsData);
  }

  LyricsData? readLyrics(int songId) {
    return _box.get(songId);
  }

  Future<void> delete(int songId) async {
    await _box.delete(songId);
  }
}
