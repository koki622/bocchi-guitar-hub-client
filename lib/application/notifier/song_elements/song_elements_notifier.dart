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
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:convert';

part 'song_elements_notifier.g.dart';
part 'song_elements_notifier.freezed.dart';

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

@freezed
class ChordState with _$ChordState {
  factory ChordState({
    required List<Chord> chords,
    required int capo,
  }) = _ChordState;
}

@riverpod
class ChordNotifier extends _$ChordNotifier {
  final _scales = [
    'C',
    'C#',
    'D',
    'D#',
    'E',
    'F',
    'F#',
    'G',
    'G#',
    'A',
    'A#',
    'B'
  ];

  @override
  ChordState build(Song song, int? defaultCapo) {
    List<Chord> chordList =
        ref.watch(songElementsRepositoryProvider).fetchChordList(song: song);
    if (chordList[0].time != 0) {
      chordList[0] =
          chordList[0].copyWith(time: 0, duration: chordList[1].time - 0);
    }

    if (defaultCapo != null) {
      chordList = _setCapo(chordList, defaultCapo);
    }
    return ChordState(chords: chordList, capo: defaultCapo ?? 0);
  }

  void changeCapo(int capo) {
    state = ChordState(chords: _setCapo(state.chords, capo), capo: capo);
  }

  List<Chord> _setCapo(List<Chord> chords, int capo) {
    final pattern = RegExp(r'([A-G][#]?)', caseSensitive: true);
    List<Chord> newChords = [];
    for (Chord chord in chords) {
      final capoChordName = chord.chord.replaceAllMapped(pattern, (match) {
        final matchedScale = match.group(0)!;

        final index = _scales.indexOf(matchedScale);
        if (index == -1) {
          print('見つからなかった ${chord.chord} ,$matchedScale');
          return matchedScale;
        }
        int capoIndex = (index - capo) % _scales.length;
        if (capoIndex < 0) {
          capoIndex += _scales.length;
        }
        return _scales[capoIndex];
      });

      newChords.add(chord.copyWith(chord: capoChordName));
    }
    return newChords;
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
