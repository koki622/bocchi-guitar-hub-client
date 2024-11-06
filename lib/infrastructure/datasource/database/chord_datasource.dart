import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/chord/chord.dart';

class ChordsHive {
  final Box<ChordsData> _box =
      Hive.box<ChordsData>(HiveBoxConstant.chordsBoxName);

  Future<void> create(ChordsData chordsData, int songId) async {
    await _box.put(songId, chordsData);
  }

  ChordsData? readChords(int songId) {
    return _box.get(songId);
  }

  Future<void> delete(int songId) async {
    await _box.delete(songId);
  }
}
