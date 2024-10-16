import 'dart:io';

import 'package:bocchi_guitar_hub_client/core/constant/reference/file_extensions.dart';
import 'package:bocchi_guitar_hub_client/core/constant/reference/webapi_endpoint.dart';
import 'package:bocchi_guitar_hub_client/core/enum/analysis.dart';
import 'package:bocchi_guitar_hub_client/core/enum/analysis_status.dart';
import 'package:bocchi_guitar_hub_client/domain/song/entity/song.dart';
import 'package:bocchi_guitar_hub_client/domain/song/repository/song_repository.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/webapi/song_webapi.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

import '../datasource/database/song_datasource.dart';

class SongRepositoryImpl implements SongRepository {
  final SongHive _songHive;
  final SongWebapi _songWebapi;

  SongRepositoryImpl(this._songHive, this._songWebapi);

  // ディレクトリの作成
  // 曲のサーバーへのアップロード
  // 曲情報のデータベースへの書き込み
  @override
  Future<Song> addSong({required NewSong newSong}) async {
    const uuid = Uuid();

    // アプリケーションドキュメントディレクトリを取得
    var applicationDirectory = await getApplicationDocumentsDirectory();

    // 曲を管理するディレクトリを作成
    final directory = Directory(p.join(applicationDirectory.path, uuid.v4()));
    try {
      directory.create();
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

    // 音声ファイルをサーバーにアップロード
    var response = await _songWebapi.uploadFile(
        WebapiEndpointConstant.uploadAudioFile, filePath, mediaType);

    String? audioFileId = response['audiofile_id'];
    if (audioFileId == null) {
      throw Exception('audioFileIdが取得できませんでした');
    }

    // データベースに曲情報を保存するためのモデルを用意
    SongData songData = SongData(
        audioFileId: audioFileId,
        title: newSong.title,
        analysisType: AnalysisType.uploading.name,
        analysisStatusType: AnalysisStatusType.completed.name,
        filePath: filePath,
        directoryPath: directory.path,
        createdAt: DateTime.timestamp());

    try {
      // データベースへの曲情報書き込み処理
      int key = await _songHive.create(songData);
      return songData.toEntity(key);
    } catch (e) {
      throw Exception('曲情報をデータベースに保存する処理でエラー発生: $e');
    }
  }

  @override
  Future<void> deleteSong({required int songId}) async {
    try {
      await _songHive.delete(songId);
    } catch (e) {
      throw Exception('曲情報をデータベースから削除する処理でエラー発生: $e');
    }
  }

  @override
  Song? fetchSong({required int songId}) {
    try {
      SongData? songData = _songHive.readSong(songId);
      if (songData == null) {
        return null;
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
