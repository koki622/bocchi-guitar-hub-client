import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';

abstract interface class SongRepository {
  Stream<SongEvent?> get stream;

  // 曲を管理するディレクトリを作成をし、データベースに曲情報を書き込む
  Future<Song> addSong({required NewSong newSong});

  // 曲をサーバにアップロードする
  Future<Song> uploadSong({required Song song, required UploadType uploadType});

  Future<void> deleteSong({required Song song});

  Song? fetchSong({required int songId});

  List<Song?> fetchAllSong();

  Future<Song> updateSong({required int songId, required Song song});
}
