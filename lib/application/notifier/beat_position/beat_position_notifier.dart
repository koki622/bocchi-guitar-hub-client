import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beat_position_notifier.g.dart';

@riverpod
class BeatPositionNotifier extends _$BeatPositionNotifier {
  @override
  int build(List<Beat> beats) {
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

  // 現在の再生位置に一致するビートのインデックスを検索
  int? _findCurrentIndex(Duration currentPlaybackPosition) {
    int? currentIndex;
    for (var (index, beat) in beats.indexed) {
      Duration beatTime =
          Duration(milliseconds: (beat.beatTime * 1000).round());
      if (beatTime > currentPlaybackPosition) {
        continue;
      }
      if (beats.length - 1 > index) {
        Duration nextBeatTime =
            Duration(milliseconds: (beats[index + 1].beatTime * 1000).round());
        if (nextBeatTime > currentPlaybackPosition) {
          currentIndex = index;
          break;
        }
      } else {
        currentIndex = index;
        break;
      }
    }
    return currentIndex;
  }
}
