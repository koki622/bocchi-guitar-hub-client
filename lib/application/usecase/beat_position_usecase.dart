import 'package:bocchi_guitar_hub_client/application/notifier/beat_position/beat_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord.dart';

class BeatPositionUsecase {
  final BeatPositionNotifier _beatPositionNotifier;
  final List<Beat> _beats;

  const BeatPositionUsecase(this._beatPositionNotifier, this._beats);

  List<Beat> get getBeats => _beats;

  List<List<String>> calculateBeatOfChord(List<Chord> chords) {
    List<Chord> remainingChords = List.from(chords);
    List<List<String>> beatOfChord = [];
    for (var (beatIndex, beat) in _beats.indexed) {
      List<String> chordNames = [];
      List<int> toRemoveIndexes = [];
      for (var (chordIndex, chord) in remainingChords.indexed) {
        // コードの時間がビートの時間に達してない場合
        if (beat.beatTime > chord.time) {
          continue;
        }
        // 最後のビートの場合
        else if (beatIndex == _beats.length - 1) {
          chordNames.add(chord.chord);
          toRemoveIndexes.add(chordIndex);
        }
        // 次のビートの時間には達していない場合
        else if (_beats[beatIndex + 1].beatTime > chord.time) {
          chordNames.add(chord.chord);
          toRemoveIndexes.add(chordIndex);
        }
      }
      // 削除対象を削除
      for (var index in toRemoveIndexes.reversed) {
        remainingChords.removeAt(index);
      }
      beatOfChord.add(chordNames);
    }
    return beatOfChord;
  }
}
