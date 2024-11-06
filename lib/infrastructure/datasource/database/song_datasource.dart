import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/constant/reference/hive_box.dart';
import '../../model/song/song.dart';

class SongHive {
  final Box<SongData> _box = Hive.box<SongData>(HiveBoxConstant.songBoxName);

  Stream<BoxEvent> get stream => _box.watch();

  Future<int> create(SongData song) async {
    int key = await _box.add(song);
    return key;
  }

  Future<void> delete(int key) async {
    await _box.delete(key);
  }

  Future<void> update(SongData song, int key) async {
    await _box.put(key, song.copyWith());
  }

  SongData? readSong(int key) {
    return _box.get(key);
  }

  Map<dynamic, SongData> readAllSongs() {
    return _box.toMap();
  }
}
