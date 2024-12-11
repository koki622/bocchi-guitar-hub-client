import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_song.g.dart';

@riverpod
class SelectedSong extends _$SelectedSong {
  @override
  Song? build() {
    return null;
  }

  void set(Song? song) => state = song?.copyWith();
}
