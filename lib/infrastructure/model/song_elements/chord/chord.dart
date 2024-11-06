import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/analysis_result/chord/chord.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'chord.freezed.dart';
part 'chord.g.dart';

@freezed
class ChordsData with _$ChordsData {
  @HiveType(typeId: HiveBoxConstant.chordsBoxTypeId)
  const factory ChordsData({
    @HiveField(0) required List<ChordData> chords,
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
  List<Chord> toEntityList() {
    return chords
        .map((chordData) => Chord(
            chord: chordData.chord,
            time: chordData.time,
            duration: chordData.duration))
        .toList();
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
