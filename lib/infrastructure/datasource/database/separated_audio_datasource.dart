import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/separated_audio/separated_audio.dart';

class SeparatedAudioHive {
  final Box<SeparatedAudioData> _box =
      Hive.box<SeparatedAudioData>(HiveBoxConstant.separatedAudioBoxName);

  Future<void> create(SeparatedAudioData separatedAudioData, int songId) async {
    await _box.put(songId, separatedAudioData);
  }

  SeparatedAudioData? readSeparatedAudio(int songId) {
    return _box.get(songId);
  }

  Future<void> delete(int songId) async {
    await _box.delete(songId);
  }
}
