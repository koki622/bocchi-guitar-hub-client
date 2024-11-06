import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class Song with _$Song {
  factory Song({
    required int songId,
    String? audioFileId,
    required String title,
    required String filePath,
    required String directoryPath,
    required DateTime createdAt,
    required ProcessType processType,
    required ProcessStatusType processStatusType,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}

@freezed
class NewSong with _$NewSong {
  factory NewSong({
    required String title,
    required String filePath,
  }) = _NewSong;
}

@freezed
class SongEvent with _$SongEvent {
  factory SongEvent({required bool deleted, required Song song}) = _SongEvent;
}
