import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class SongData with _$SongData {
  @HiveType(typeId: HiveBoxConstant.songBoxTypeId)
  const factory SongData({
    @HiveField(0) String? audioFileId,
    @HiveField(1) required String title,
    @HiveField(2) required String processType,
    @HiveField(3) required String processStatusType,
    @HiveField(4) required String filePath,
    @HiveField(5) required String directoryPath,
    @HiveField(6) required DateTime createdAt,
    @HiveField(7) DateTime? updatedAt,
  }) = _SongData;

  static SongData fromEntity(Song entity) => SongData(
      audioFileId: entity.audioFileId,
      title: entity.title,
      processType: entity.processType.name,
      processStatusType: entity.processStatusType.name,
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
      processType: ProcessType.values.byName(processType),
      processStatusType: ProcessStatusType.values.byName(processStatusType));
}
