import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/section/section.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/separated_audio/separated_audio.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/infrastructure_module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'song_elements_notifier.g.dart';

@riverpod
class SeparatedAudioNotifier extends _$SeparatedAudioNotifier {
  @override
  SeparatedAudio build(Song song) {
    // 初期状態としてsongRepositoryから取得した全曲をMap形式に変換して格納
    return ref
        .watch(songElementsRepositoryProvider)
        .fetchSeparatedAudio(song: song);
  }
}

@riverpod
class ChordNotifier extends _$ChordNotifier {
  @override
  List<Chord> build(Song song) {
    return ref.watch(songElementsRepositoryProvider).fetchChordList(song: song);
  }
}

@riverpod
class BeatNotifier extends _$BeatNotifier {
  @override
  List<Beat> build(Song song) {
    return ref.watch(songElementsRepositoryProvider).fetchBeatList(song: song);
  }
}

@riverpod
class SectionNotifier extends _$SectionNotifier {
  @override
  List<Section> build(Song song) {
    return ref
        .watch(songElementsRepositoryProvider)
        .fetchSectionList(song: song);
  }
}

@riverpod
class LyricNotifier extends _$LyricNotifier {
  @override
  List<Lyric> build(Song song) {
    return ref.watch(songElementsRepositoryProvider).fetchLyricList(song: song);
  }
}
