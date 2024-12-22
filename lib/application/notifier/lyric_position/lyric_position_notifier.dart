import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lyric_position_notifier.g.dart';
part 'lyric_position_notifier.freezed.dart';

@riverpod
class SegmentedLyricPositionNotifier extends _$SegmentedLyricPositionNotifier {
  @override
  int build(List<Lyric> lyrics) {
    final currentPlaybackPosition = ref.read(playbackPositionNotifierProvider);
    _listenPlaybackPosition();
    return _findCurrentIndex(currentPlaybackPosition) ?? 0;
  }

  // 再生位置を監視する
  void _listenPlaybackPosition() {
    ref.listen<Duration>(playbackPositionNotifierProvider, (previous, next) {
      final currentIndex = _findCurrentIndex(next);
      if (currentIndex != state && currentIndex != null) {
        state = currentIndex;
      }
    });
  }

  // 現在の再生位置に一致する歌詞セグメントのインデックスを検索
  int? _findCurrentIndex(Duration currentPlaybackPosition) {
    if (currentPlaybackPosition == Duration.zero) return 0;
    int? currentIndex;
    for (var (index, segmentedLyric) in lyrics.indexed) {
      // スタート時間
      Duration segmentedLyricTime =
          Duration(milliseconds: (segmentedLyric.start * 1000).round());
      // 終了時間
      Duration segmentedLyricEndTime =
          Duration(milliseconds: (segmentedLyric.end * 1000).round());
      //print(
      //    'position: $currentPlaybackPosition, start: $segmentedLyricTime, end: $segmentedLyricEndTime');
      if (currentPlaybackPosition < segmentedLyricTime) {
        continue;
      }
      if (currentPlaybackPosition <= segmentedLyricEndTime) {
        // 現在の再生位置がセグメント歌詞の範囲内の場合
        currentIndex = index;
        break;
      } else if (lyrics.length - 1 > index) {
        Duration nextSegmentedLyricTime =
            Duration(milliseconds: (lyrics[index + 1].start * 1000).round());
        if (currentPlaybackPosition < nextSegmentedLyricTime) {
          currentIndex = index + 1;
          break;
        }
      }
    }
    return currentIndex;
  }
}

@freezed
class WordLyricPosition with _$WordLyricPosition {
  factory WordLyricPosition({
    required int index,
    required bool isStarted,
    required bool isFinished,
  }) = _WordLyricPosition;
}

@riverpod
class WordLyricPositionNotifier extends _$WordLyricPositionNotifier {
  @override
  WordLyricPosition? build(List<Lyric> lyrics, int segmentedLyricIndex) {
    final currentSegmentedLyricIndex =
        ref.watch(segmentedLyricPositionNotifierProvider(lyrics));
    if (currentSegmentedLyricIndex == segmentedLyricIndex) {
      final currentPlaybackPosition =
          ref.read(playbackPositionNotifierProvider);
      _listenPlaybackPosition();
      return _findCurrentWordLyricPosition(currentPlaybackPosition);
    } else {
      return null;
    }
  }

  // 再生位置を監視する
  void _listenPlaybackPosition() {
    ref.listen<Duration>(playbackPositionNotifierProvider, (previous, next) {
      final currentWordLyricPosition = _findCurrentWordLyricPosition(next);
      if (currentWordLyricPosition != state) {
        state = currentWordLyricPosition;
      }
    });
  }

  // 現在の再生位置に一致する歌詞ワードのインデックスを検索
  WordLyricPosition? _findCurrentWordLyricPosition(
      Duration currentPlaybackPosition) {
    WordLyricPosition? wordLyricPosition;
    for (var (index, lyricWord) in lyrics[segmentedLyricIndex].words.indexed) {
      Duration lyricWordTime =
          Duration(milliseconds: (lyricWord.start * 1000).round());
      Duration lyricWordEndTime =
          Duration(milliseconds: (lyricWord.end * 1000).round());

      if (currentPlaybackPosition < lyricWordTime) {
        continue;
      }
      if (currentPlaybackPosition <= lyricWordEndTime) {
        // 現在の再生位置がワードの範囲内の場合
        wordLyricPosition =
            WordLyricPosition(index: index, isStarted: true, isFinished: false);
        break;
      } else if (lyrics[segmentedLyricIndex].words.length - 1 > index) {
        Duration nextLyricWordTime = Duration(
            milliseconds:
                (lyrics[segmentedLyricIndex].words[index + 1].start * 1000)
                    .round());
        if (currentPlaybackPosition < nextLyricWordTime) {
          WordLyricPosition(
              index: index + 1, isStarted: false, isFinished: false);
          break;
        }
      } else {
        // 最後のインデックスの場合
        WordLyricPosition(index: index, isStarted: false, isFinished: true);
        break;
      }
    }
    return wordLyricPosition;
    /**
       * 
      if (currentPlaybackPosition < lyricWordTime) {
        continue;
      }
      if (currentPlaybackPosition <= lyricWordEndTime) {
        // 現在の再生位置がワードの範囲内の場合
        currentIndex = index;
        WordLyricPosition(index: index, isStarted: true);
        break;
      } else if (lyrics[segmentedLyricIndex].words.length - 1 > index) {
        Duration nextLyricWordTime = Duration(
            milliseconds:
                (lyrics[segmentedLyricIndex].words[index + 1].start * 1000)
                    .round());
        if (currentPlaybackPosition < nextLyricWordTime) {
          break;
        }
      }
    }
    return currentIndex;
       */
  }
}
