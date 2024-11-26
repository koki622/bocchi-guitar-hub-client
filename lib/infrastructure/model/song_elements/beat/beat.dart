import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/analysis_result/structure/structure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'beat.freezed.dart';
part 'beat.g.dart';

@freezed
class BeatsData with _$BeatsData {
  @HiveType(typeId: HiveBoxConstant.beatsBoxTypeId)
  const factory BeatsData({
    @HiveField(0) required int bpm,
    @HiveField(1) required List<BeatData> beats,
  }) = _BeatsData;

  // StructureResponseからBeatsDataに変換するメソッド
  factory BeatsData.fromStructureResponse(StructureResponse response) {
    final List<BeatData> beatsList =
        response.beatPositions.asMap().entries.map((entry) {
      final index = entry.key;
      final position = entry.value;
      final time = response.beats[index]; // beatsとbeatPositionsのインデックスが一致すると仮定
      return BeatData(beatPosition: position, beatTime: time);
    }).toList();

    return BeatsData(bpm: response.bpm, beats: beatsList);
  }
}

extension BeatsDataX on BeatsData {
  List<Beat> toEntityList() {
    return beats
        .map((beatData) => Beat(
            beatPosition: beatData.beatPosition, beatTime: beatData.beatTime))
        .toList();
  }
}

@HiveType(typeId: HiveBoxConstant.beatTypeId)
class BeatData {
  @HiveField(0)
  double beatPosition;

  @HiveField(1)
  double beatTime;

  BeatData({required this.beatPosition, required this.beatTime});
}
