import 'package:bocchi_guitar_hub_client/application/notifier/lyric_position/lyric_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric.dart';

class LyricPositionUsecase {
  final SegmentedLyricPositionNotifier _segmentedLyricPositionNotifier;
  final List<WordLyricPositionNotifier> _wordLyricPositionNotifierList;
  final List<Lyric> _lyrics;

  const LyricPositionUsecase(this._segmentedLyricPositionNotifier,
      this._wordLyricPositionNotifierList, this._lyrics);

  List<Lyric> get getLyrics => _lyrics;
}
