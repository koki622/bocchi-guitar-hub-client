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
    @HiveField(0) String? vocalsPath,
    @HiveField(1) String? drumsPath,
    @HiveField(2) String? bassPath,
    @HiveField(3) String? guitarPath,
    @HiveField(4) String? pianoPath,
    @HiveField(5) String? otherPath,
  }) = _SeparatedAudioData;
}

extension SeparatedAudioDataX on SeparatedAudioData {
  Future<SeparatedAudio> toEntity() async {
    if (await allFilesExist()) {
      return SeparatedAudio(
          vocalsPath: vocalsPath!,
          drumsPath: drumsPath!,
          bassPath: bassPath!,
          guitarPath: guitarPath!,
          pianoPath: pianoPath!,
          otherPath: otherPath!);
    } else {
      throw Exception('全パート別音源のダウンロードが完了していません');
    }
  }

  // 各ファイルが存在するか確認するメソッド
  Future<bool> allFilesExist() async {
    if (vocalsPath != null &&
        drumsPath != null &&
        bassPath != null &&
        guitarPath != null &&
        pianoPath != null &&
        otherPath != null) {
      return await _fileExists(vocalsPath!) &&
          await _fileExists(drumsPath!) &&
          await _fileExists(bassPath!) &&
          await _fileExists(guitarPath!) &&
          await _fileExists(pianoPath!) &&
          await _fileExists(otherPath!);
    } else {
      return false;
    }
  }

  Future<bool> _fileExists(String path) async {
    return await File(path).exists();
  }
}
