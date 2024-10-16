import 'package:bocchi_guitar_hub_client/domain/song/entity/song.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final songRepositoryProvider = Provider<SongRepository>(
  (_) => throw UnimplementedError(),
);

abstract interface class SongRepository {
  // 曲を管理するディレクトリを作成をし、データベースに曲情報を書き込む
  Future<Song> addSong({required NewSong newSong});

  Future<void> deleteSong({required int songId});

  Song? fetchSong({required int songId});

  List<Song?> fetchAllSong();

  Future<Song> updateSong({required int songId, required Song song});
}
