import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/click_sound.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord_sound.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric_word.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/section/section.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/separated_audio/separated_audio.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/infrastructure_module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:convert';

part 'song_elements_notifier.g.dart';

@riverpod
class SeparatedAudioNotifier extends _$SeparatedAudioNotifier {
  @override
  Future<SeparatedAudio> build(Song song) async {
    return await ref
        .watch(songElementsRepositoryProvider)
        .fetchSeparatedAudio(song: song);
  }
}

@riverpod
class ClickSoundNotifier extends _$ClickSoundNotifier {
  @override
  Future<ClickSound> build(Song song) async {
    return await ref
        .watch(songElementsRepositoryProvider)
        .fetchClickSound(song: song);
  }
}

@riverpod
class ChordSoundNotifier extends _$ChordSoundNotifier {
  @override
  Future<ChordSound> build(Song song) async {
    return await ref
        .watch(songElementsRepositoryProvider)
        .fetchChordSound(song: song);
  }
}

@riverpod
class ChordNotifier extends _$ChordNotifier {
  @override
  List<Chord> build(Song song) {
    List<Chord> chordList =
        ref.watch(songElementsRepositoryProvider).fetchChordList(song: song);
    if (chordList[0].time != 0) {
      chordList[0] =
          chordList[0].copyWith(time: 0, duration: chordList[1].time - 0);
    }
    return chordList;
  }
}

@riverpod
class BeatNotifier extends _$BeatNotifier {
  @override
  List<Beat> build(Song song) {
    List<Beat> beatList =
        ref.watch(songElementsRepositoryProvider).fetchBeatList(song: song);
    if (beatList[0].beatTime != 0) {
      // 0秒からビートが始まっていない場合は以下を追加
      beatList.insert(0, Beat(beatPosition: -1, beatTime: 0));
    }
    return beatList;
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
    final List<Lyric> lyrics =
        ref.watch(songElementsRepositoryProvider).fetchLyricList(song: song);
    List<Lyric> convertedLyrics = [];
    for (Lyric lyric in lyrics) {
      List<LyricWord> convertedWords = [];
      for (LyricWord lyricWord in lyric.words) {
        convertedWords.add(lyricWord.copyWith(
            word: utf8.decode(lyricWord.word.runes.toList())));
      }
      convertedLyrics.add(lyric.copyWith(
          segmentedLyric: utf8.decode(lyric.segmentedLyric.runes.toList()),
          words: convertedWords));
    }
    return convertedLyrics;
  }
}
