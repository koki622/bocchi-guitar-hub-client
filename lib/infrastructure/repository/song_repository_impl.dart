import 'dart:io';

import 'package:bocchi_guitar_hub_client/core/constant/reference/file_extensions.dart';
import 'package:bocchi_guitar_hub_client/core/constant/reference/webapi.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/exception.dart';
import 'package:bocchi_guitar_hub_client/domain/repository/song_repository.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/webapi/song_webapi.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song/song.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

import '../datasource/database/song_datasource.dart';

class SongRepositoryImpl implements SongRepository {
  final SongHive _songHive;
  final SongWebapi _songWebapi;

  SongRepositoryImpl(this._songHive, this._songWebapi);

  @override
  Stream<SongEvent?> get stream async* {
    Stream<BoxEvent> stream = _songHive.stream;
    try {
      await for (BoxEvent event in stream) {
        SongData songData = event.value;
        Song songEntity = songData.toEntity(event.key);
        if (event.deleted) {
          yield SongEvent(deleted: true, song: songEntity);
        } else {
          yield SongEvent(deleted: false, song: songEntity);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  // ディレクトリの作成
  // 曲情報のデータベースへの書き込み
  @override
  Future<Song> addSong({required NewSong newSong}) async {
    const uuid = Uuid();

    // アプリケーションドキュメントディレクトリを取得
    var applicationDirectory = await getApplicationDocumentsDirectory();

    // 曲を管理するディレクトリを作成
    final directory = Directory(p.join(applicationDirectory.path, uuid.v4()));
    try {
      await directory.create();
    } catch (e) {
      Exception('ディレクトリの作成処理でエラー発生: $e');
    }
    String filePath = newSong.filePath;

    // 拡張子を取得
    String extension = p.extension(filePath);

    String? mediaType = FileExtensions.allowFileExtensions[extension];

    if (mediaType == null) {
      throw Exception('許可されない拡張子のファイルが選択されました');
    }
    try {
      // データベースに曲情報を登録
      SongData unuploadedSongData = SongData(
          title: newSong.title,
          processType: ProcessType.init.name,
          processStatusType: ProcessStatusType.completed.name,
          filePath: filePath,
          directoryPath: directory.path,
          createdAt: DateTime.timestamp());
      int key = await _songHive.create(unuploadedSongData);
      return unuploadedSongData.toEntity(key);
    } catch (e) {
      throw Exception('曲情報の追加処理で例外発生');
    }
  }

  @override
  Future<Song> uploadSong({required Song song}) async {
    String filePath = song.filePath;

    // 拡張子を取得
    String extension = p.extension(filePath);

    String? mediaType = FileExtensions.allowFileExtensions[extension];

    if (mediaType == null) {
      throw Exception('許可されない拡張子のファイルが選択されました');
    }

    // 音声ファイルをサーバーにアップロード
    var response = await _songWebapi.uploadFile(
        WebapiEndpointConstant.uploadAudioFile, filePath, mediaType);

    String? audioFileId = response['audiofile_id'];
    if (audioFileId == null) {
      throw Exception('audioFileIdが取得できませんでした');
    }

    try {
      // 曲情報にaudioFileIdを追加して更新
      SongData songData = SongData.fromEntity(song).copyWith(
          audioFileId: audioFileId,
          processType: ProcessType.uploading.name,
          processStatusType: ProcessStatusType.completed.name);
      await _songHive.update(songData, song.songId);

      return songData.toEntity(song.songId);
    } catch (e) {
      throw Exception('曲情報の更新処理で例外発生: $e');
    }
  }

  @override
  Future<void> deleteSong({required Song song}) async {
    await Directory(song.directoryPath).delete(recursive: true);
    await _songHive.delete(song.songId);
    await _songWebapi.deleteUploadFile(
        '${WebapiEndpointConstant.deleteAudioFile}/${song.audioFileId}');
  }

  @override
  Song? fetchSong({required int songId}) {
    try {
      SongData? songData = _songHive.readSong(songId);
      if (songData == null) {
        throw SongNotFoundException(songId);
      } else {
        return songData.toEntity(songId);
      }
    } catch (e) {
      throw Exception('曲情報をデータベースから取得する処理でエラー発生: $e');
    }
  }

  @override
  List<Song?> fetchAllSong() {
    try {
      Map<dynamic, SongData> songDataMap = _songHive.readAllSongs();
      List<Song?> songs = [];
      for (int key in songDataMap.keys) {
        songs.add(songDataMap[key]?.toEntity(key));
      }
      return songs;
    } catch (e) {
      throw Exception('曲情報をデータベースから全取得する処理でエラー発生: $e');
    }
  }

  @override
  Future<Song> updateSong({required int songId, required Song song}) async {
    try {
      SongData songData = SongData.fromEntity(song);

      // オブジェクトに更新日を追加する
      SongData newSongData = songData.copyWith(updatedAt: DateTime.timestamp());

      await _songHive.update(newSongData, songId);
      return newSongData.toEntity(songId);
    } catch (e) {
      throw Exception('曲情報をデータベースに更新する処理でエラー発生: $e');
    }
  }
}
