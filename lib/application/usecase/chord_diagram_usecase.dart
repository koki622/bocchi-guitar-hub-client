import 'package:bocchi_guitar_hub_client/application/notifier/chord_diagram/chord_diagram_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/chord_diagram/current_chord_diagram_notifier.dart';
import 'package:flutter_guitar_chord/flutter_guitar_chord.dart';

class ChordDiagramUsecase {
  final ChordDiagramNotifier _chordDiagramNotifier;
  final CurrentChordDiagramNotifier _currentChordDiagramNotifier;
  final List<ChordDiagramState> _chordDiagramStates;

  const ChordDiagramUsecase(this._chordDiagramNotifier,
      this._currentChordDiagramNotifier, this._chordDiagramStates);

  void updateCurrentChord(int newIndex) {
    _currentChordDiagramNotifier.updateIndex(newIndex);
  }

  List<FlutterGuitarChord> get getFlutterGuitarChords => [
        for (ChordDiagramState chordDiagramState in _chordDiagramStates)
          chordDiagramState.flutterGuitarChord
      ];

  Map<ChordTimeRange, int> get getChordChange =>
      _currentChordDiagramNotifier.chordChange;
}
