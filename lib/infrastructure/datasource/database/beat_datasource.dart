import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/beat/beat.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BeatsHive {
  final Box<BeatsData> _box = Hive.box<BeatsData>(HiveBoxConstant.beatsBoxName);

  Future<void> create(BeatsData beatsData, int songId) async {
    await _box.put(songId, beatsData);
  }

  BeatsData? readBeats(int songId) {
    return _box.get(songId);
  }

  Future<void> delete(int songId) async {
    await _box.delete(songId);
  }
}
