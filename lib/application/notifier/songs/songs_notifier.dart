import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/infrastructure_module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'songs_notifier.g.dart';

@riverpod
class SongsNotifier extends _$SongsNotifier {
  @override
  Map<int, Song>? build() {
    // 初期状態としてsongRepositoryから取得した全曲をMap形式に変換して格納
    List<Song?> songs = ref.watch(songRepositoryProvider).fetchAllSong();

    // songsリストにnullが含まれている場合、nullを返す
    if (songs.contains(null)) {
      return null;
    }

    return {
      for (var song in songs) song!.songId: song,
    };
  }

  void upsertSong(Song song) {
    state = {
      ...?state,
      song.songId: song, // songIdをキーにして新しい曲情報を更新または追加
    };
  }

  void deleteSong(int songId) {
    if (state != null) {
      // 指定されたsongIdの曲を除外して新しい状態に更新
      final updatedState = Map<int, Song>.from(state!)..remove(songId);
      state = updatedState;
    }
  }
}
