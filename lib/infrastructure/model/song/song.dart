import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/core/enum/dest_api_server.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_step.dart';
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
    @HiveField(1) required String destApiServerType,
    @HiveField(2) required String title,
    @HiveField(3) required String processType,
    @HiveField(4) required String processStatusType,
    @HiveField(5) required String filePath,
    @HiveField(6) required String directoryPath,
    @HiveField(7) required DateTime createdAt,
    @HiveField(8) DateTime? updatedAt,
  }) = _SongData;

  static SongData fromEntity(Song entity) => SongData(
      audioFileId: entity.audioFileId,
      destApiServerType: entity.destApiServerType.name,
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
      destApiServerType: DestApiServerType.fromString(destApiServerType),
      title: title,
      filePath: filePath,
      directoryPath: directoryPath,
      createdAt: createdAt,
      processType: ProcessStep.values.byName(processType),
      processStatusType: ProcessStatusType.values.byName(processStatusType));
}
