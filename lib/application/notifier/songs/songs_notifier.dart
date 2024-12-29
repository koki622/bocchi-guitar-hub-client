import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';
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

    if (songs.isEmpty) {
      return null;
    }
    List<Song> noNullsongs = songs.whereType<Song>().toList();

    // 状態が処理中のものは中断に変更する
    List<Song> initedSongs = _initProcessStatusType(noNullsongs);
    return {
      for (var song in initedSongs) song.songId: song,
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

  List<Song> _initProcessStatusType(List<Song> songs) {
    List<Song> initedSongs = [];
    for (Song song in songs) {
      if (song.processStatusType == ProcessStatusType.processing) {
        initedSongs.add(
            song.copyWith(processStatusType: ProcessStatusType.interrupted));
      } else {
        initedSongs.add(song);
      }
    }
    return initedSongs;
  }
}
