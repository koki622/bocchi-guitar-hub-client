import 'dart:io';

import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord_sound.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/analysis_result/chord/chord.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'chord.freezed.dart';
part 'chord.g.dart';

@freezed
class ChordsData with _$ChordsData {
  @HiveType(typeId: HiveBoxConstant.chordsBoxTypeId)
  const factory ChordsData({
    @HiveField(0) List<ChordData>? chords,
    @HiveField(1) String? soundFilePath,
  }) = _ChordsData;

  // ChordsResponseをChordsDataに変換するメソッド
  factory ChordsData.fromChordsResponse(ChordsResponse response) {
    return ChordsData(
      chords: response.chords.map((chord) {
        return ChordData(
          // ChordDataからChordへ変換
          chord: chord.value, // ChordResponseのvalueをChordのchordにマップ
          time: chord.time,
          duration: chord.duration,
        );
      }).toList(), // List<Chord>として返す
    );
  }
}

extension ChordsDataX on ChordsData {
  List<Chord> toChordEntityList() {
    if (chords == null) {
      throw Exception('コードの解析結果が存在しません');
    }
    return chords!
        .map((chordData) => Chord(
            chord: chordData.chord,
            time: chordData.time,
            duration: chordData.duration))
        .toList();
  }

  Future<ChordSound> toChordSoundEntity() async {
    if (await allFilesExist()) {
      return ChordSound(filePath: soundFilePath!);
    } else {
      throw Exception('コード音声が存在しません');
    }
  }

  // 各ファイルが存在するか確認するメソッド
  Future<bool> allFilesExist() async {
    if (soundFilePath != null) {
      return await _fileExists(soundFilePath!);
    } else {
      return false;
    }
  }

  Future<bool> _fileExists(String path) async {
    return await File(path).exists();
  }
}

@HiveType(typeId: HiveBoxConstant.chordTypeId)
class ChordData {
  @HiveField(0)
  String chord;

  @HiveField(1)
  double time;

  @HiveField(2)
  double duration;

  ChordData({required this.chord, required this.time, required this.duration});
}
