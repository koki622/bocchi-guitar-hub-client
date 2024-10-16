import 'package:hive/hive.dart';

import '../../../core/constant/reference/hive_box.dart';
import '../../model/song.dart';

class SongHive {
  final Box<SongData> box = Hive.box<SongData>(HiveBoxConstant.songBoxName);

  Future<int> create(SongData song) async {
    int key = await box.add(song);
    return key;
  }

  Future<void> delete(int key) async {
    await box.delete(key);
  }

  Future<void> update(SongData song, int key) async {
    await box.put(key, song);
  }

  SongData? readSong(int key) {
    return box.get(key);
  }

  Map<dynamic, SongData> readAllSongs() {
    return box.toMap();
  }
}
