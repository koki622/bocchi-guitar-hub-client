import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/core/enum/analysis.dart';
import 'package:bocchi_guitar_hub_client/core/enum/analysis_status.dart';
import 'package:bocchi_guitar_hub_client/domain/song/entity/song.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class SongData with _$SongData {
  @HiveType(typeId: HiveBoxConstant.songBoxTypeId)
  const factory SongData({
    @HiveField(0) required String audioFileId,
    @HiveField(1) required String title,
    @HiveField(2) required String analysisType,
    @HiveField(3) required String analysisStatusType,
    @HiveField(4) required String filePath,
    @HiveField(5) required String directoryPath,
    @HiveField(6) required DateTime createdAt,
    @HiveField(7) DateTime? updatedAt,
  }) = _SongData;

  static SongData fromEntity(Song entity) => SongData(
      audioFileId: entity.audioFileId,
      title: entity.title,
      analysisType: entity.analysisType.name,
      analysisStatusType: entity.analysisStatusType.name,
      filePath: entity.filePath,
      directoryPath: entity.directoryPath,
      createdAt: entity.createdAt,
      updatedAt: null);
}

extension SongDataX on SongData {
  Song toEntity(int songId) => Song(
      songId: songId,
      audioFileId: audioFileId,
      title: title,
      filePath: filePath,
      directoryPath: directoryPath,
      createdAt: createdAt,
      analysisType: AnalysisType.values.byName(analysisType),
      analysisStatusType: AnalysisStatusType.values.byName(analysisStatusType));
}
