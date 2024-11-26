import 'dart:io';

import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/click_sound.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'click_sound.freezed.dart';
part 'click_sound.g.dart';

@freezed
class ClickSoundData with _$ClickSoundData {
  @HiveType(typeId: HiveBoxConstant.clickSoundBoxTypeId)
  const factory ClickSoundData({
    @HiveField(0) String? normalClickPath,
    @HiveField(1) String? x2Path,
    @HiveField(2) String? halfPath,
  }) = _ClicksoundData;
}

extension ClickSoundDataX on ClickSoundData {
  Future<ClickSound> toEntity() async {
    if (await allFilesExist()) {
      return ClickSound(
          normalClickPath: normalClickPath!,
          x2Path: x2Path!,
          halfPath: halfPath!);
    } else {
      throw Exception('全種類のクリック音のダウンロードが完了していません');
    }
  }

  // 各ファイルが存在するか確認するメソッド
  Future<bool> allFilesExist() async {
    if (normalClickPath != null && x2Path != null && halfPath != null) {
      return await _fileExists(normalClickPath!) &&
          await _fileExists(x2Path!) &&
          await _fileExists(halfPath!);
    } else {
      return false;
    }
  }

  Future<bool> _fileExists(String path) async {
    return await File(path).exists();
  }
}
