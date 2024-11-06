import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/section/section.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SectionsHive {
  final Box<SectionsData> _box =
      Hive.box<SectionsData>(HiveBoxConstant.sectionsBoxName);

  Future<void> create(SectionsData sectionsData, int songId) async {
    await _box.put(songId, sectionsData);
  }

  SectionsData? readSections(int songId) {
    return _box.get(songId);
  }

  Future<void> delete(int songId) async {
    await _box.delete(songId);
  }
}
