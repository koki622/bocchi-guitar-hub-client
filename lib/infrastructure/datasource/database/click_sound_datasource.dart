import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/beat/click_sound.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ClickSoundHive {
  final Box<ClickSoundData> _box =
      Hive.box<ClickSoundData>(HiveBoxConstant.clickSoundBoxName);

  Future<void> create(ClickSoundData clickSoundData, int songId) async {
    await _box.put(songId, clickSoundData);
  }

  ClickSoundData? readClickSound(int songId) {
    return _box.get(songId);
  }

  Future<void> delete(int songId) async {
    await _box.delete(songId);
  }
}
