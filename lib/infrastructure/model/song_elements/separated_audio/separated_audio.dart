import 'dart:io';

import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/separated_audio/separated_audio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'separated_audio.freezed.dart';
part 'separated_audio.g.dart';

@freezed
class SeparatedAudioData with _$SeparatedAudioData {
  @HiveType(typeId: HiveBoxConstant.separatedAudioBoxTypeId)
  const factory SeparatedAudioData({
    @HiveField(0) required String vocalsPath,
    @HiveField(1) required String drumsPath,
    @HiveField(2) required String bassPath,
    @HiveField(3) required String guitarPath,
    @HiveField(4) required String pianoPath,
    @HiveField(5) required String otherPath,
  }) = _SeparatedAudioData;
}

extension SeparatedAudioDataX on SeparatedAudioData {
  SeparatedAudio toEntity() => SeparatedAudio(
      vocalsPath: vocalsPath,
      drumsPath: drumsPath,
      bassPath: bassPath,
      guitarPath: guitarPath,
      pianoPath: pianoPath,
      otherPath: otherPath);

  // 各ファイルが存在するか確認するメソッド
  Future<bool> allFilesExist() async {
    return await _fileExists(vocalsPath) &&
        await _fileExists(drumsPath) &&
        await _fileExists(bassPath) &&
        await _fileExists(guitarPath) &&
        await _fileExists(pianoPath) &&
        await _fileExists(otherPath);
  }

  Future<bool> _fileExists(String path) async {
    return await File(path).exists();
  }
}
