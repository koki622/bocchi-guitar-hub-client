import 'dart:convert';

import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord.dart';
import 'package:flutter/services.dart';
import 'package:flutter_guitar_chord/flutter_guitar_chord.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chord_diagram_notifier.g.dart';
part 'chord_diagram_notifier.freezed.dart';

enum ChordJsonType {
  main(fileName: 'guitar.json'),
  sub(fileName: 'chords.json');

  const ChordJsonType({required this.fileName});

  final String fileName;
}

@freezed
class ChordDiagramState with _$ChordDiagramState {
  factory ChordDiagramState({
    required String chordName,
    required FlutterGuitarChord flutterGuitarChord,
  }) = _ChordDiagramState;
}

abstract class ChordInfo {
  List<String>? get positions;
  List<List<String>>? get fingerings;

  ChordInfo.fromJson(Map<String, dynamic> json);
}

@freezed
class MainChordInfo with _$MainChordInfo implements ChordInfo {
  factory MainChordInfo({
    required List<String>? positions,
    required List<List<String>>? fingerings,
  }) = _MainChordInfo;

  @override
  factory MainChordInfo.fromJson(Map<String, dynamic> json) {
    int baseFret = json['baseFret'];
    List<String> positions = [];
    for (int fret in json['frets']) {
      String stringFret;
      if (fret == -1) {
        stringFret = 'x';
      } else if (fret == 0) {
        stringFret = '0';
      } else {
        stringFret = (fret + (baseFret - 1)).toString();
      }
      positions.add(stringFret);
    }
    List<String> fingers = [];
    for (int finger in json['fingers']) {
      String stringFinger = finger.toString();
      fingers.add(stringFinger);
    }
    return MainChordInfo(positions: positions, fingerings: [fingers]);
  }
}

@freezed
class SubChordInfo with _$SubChordInfo implements ChordInfo {
  factory SubChordInfo({
    @JsonKey(name: 'positions') required List<String>? positions,
    @JsonKey(name: 'fingerings') required List<List<String>>? fingerings,
  }) = _SubChordInfo;

  @override
  factory SubChordInfo.fromJson(Map<String, dynamic> json) =>
      _$SubChordInfoFromJson(json);
}

@freezed
class ChordDiagramInfoCollection with _$ChordDiagramInfoCollection {
  factory ChordDiagramInfoCollection({
    required Map<String, List<ChordInfo>> chordDiagramInfos,
  }) = _ChordDiagramInfoCollection;

  static const mainChordInfoKeyMap = {
    'C': 'C',
    'C#': 'C#',
    'D': 'D',
    'Eb': 'D#',
    'E': 'E',
    'F': 'F',
    'F#': 'F#',
    'G': 'G',
    'Ab': 'G#',
    'A': 'A',
    'Bb': 'A#',
    'B': 'B',
  };

  static const mainChordInfoSuffixMap = {
    'major': '',
    'minor': 'm',
    '/Bb': '/A#',
    'm9/Bb': 'm9/A#',
    'm9/Eb': 'm9/D#',
    'm9/Ab': 'm9/G#',
    '/Eb': '/D#',
    '/Ab': '/G#',
    'm/Bb': 'm/A#',
    'm/Eb': 'm/D#',
    'm/Ab': 'm/G#',
  };

  factory ChordDiagramInfoCollection.fromJson(
      Map<String, dynamic> json, ChordJsonType chordJsonType) {
    try {
      switch (chordJsonType) {
        case ChordJsonType.main:
          final Map<String, dynamic> chords = json['chords'];
          final Map<String, List<MainChordInfo>> chordInfoMap = {};
          for (String chordIndex in chords.keys) {
            for (Map<String, dynamic> chord in chords[chordIndex]) {
              String chordKey = mainChordInfoKeyMap[chord['key']]!;
              String chordSuffix =
                  mainChordInfoSuffixMap[chord['suffix']] ?? chord['suffix'];
              List<MainChordInfo> chordInfos = [
                for (Map<String, dynamic> position in chord['positions'])
                  MainChordInfo.fromJson({
                    'frets': position['frets'],
                    'fingers': position['fingers'],
                    'baseFret': position['baseFret'],
                  })
              ];
              chordInfoMap[chordKey + chordSuffix] = chordInfos;
            }
          }
          return ChordDiagramInfoCollection(chordDiagramInfos: chordInfoMap);
        case ChordJsonType.sub:
          return ChordDiagramInfoCollection(
            chordDiagramInfos: json.map((key, value) {
              if (value[0] == null) {
                value[0] = {
                  'positions': null,
                  'fingerings': null,
                };
              }
              final List<ChordInfo> infos = (value as List)
                  .map((item) => SubChordInfo.fromJson(item))
                  .toList();
              return MapEntry(key, infos);
            }),
          );
      }
    } catch (e) {
      rethrow;
    }
  }
}

class ChordTimeRange {
  final Duration startTime;
  final Duration endTime;

  ChordTimeRange(this.startTime, this.endTime);

  // 再生時間がこの範囲内かを確認する
  bool contains(Duration time) {
    return time >= startTime && time <= endTime;
  }

  @override
  bool operator ==(Object other) {
    if (other is ChordTimeRange) {
      return startTime == other.startTime && endTime == other.endTime;
    }
    return false;
  }

  @override
  int get hashCode => startTime.hashCode ^ endTime.hashCode;
}

@riverpod
class ChordChangeNotifier extends _$ChordChangeNotifier {
  @override
  Map<ChordTimeRange, int> build(List<Chord> chords) {
    return {
      for (var (index, chord) in chords.indexed)
        ChordTimeRange(
            Duration(milliseconds: (chord.time * 1000).round()),
            Duration(
                milliseconds:
                    (chord.time * 1000 + chord.duration * 1000).round())): index
    };
  }

  Map<ChordTimeRange, int> get getState => state;
}

@riverpod
class ChordDiagramNotifier extends _$ChordDiagramNotifier {
  late ChordDiagramInfoCollection _mainChordInfos;
  late ChordDiagramInfoCollection _subChordInfos;

  @override
  Future<List<ChordDiagramState>> build(List<Chord> chords) async {
    _mainChordInfos = ChordDiagramInfoCollection.fromJson(
        json.decode(await _loadChordsJson(ChordJsonType.main)),
        ChordJsonType.main);
    _subChordInfos = ChordDiagramInfoCollection.fromJson(
        json.decode(await _loadChordsJson(ChordJsonType.sub)),
        ChordJsonType.sub);
    return _convertChordToDiagram(chords);
  }

  Future<String> _loadChordsJson(ChordJsonType chordJsonType) async {
    return await rootBundle.loadString('assets/${chordJsonType.fileName}');
  }

  List<ChordDiagramState> _convertChordToDiagram(List<Chord> chords) {
    List<ChordDiagramState> chordDiagramStates = [];
    for (Chord chord in chords) {
      FlutterGuitarChord flutterGuitarChord;
      if (['X', 'N'].contains(chord.chord)) {
        // XやNコードを含む場合
        flutterGuitarChord = _getNoChord(chord.chord);
      } else {
        List<ChordInfo>? chordInfo =
            _mainChordInfos.chordDiagramInfos[chord.chord] ??
                _subChordInfos.chordDiagramInfos[chord.chord];
        if (chordInfo == null) {
          // コードのダイアグラム情報が見つからない場合
          flutterGuitarChord = _getNoChord('${chord.chord}(Unknown)');
        } else {
          // xを-1に変換し、空白で区切る
          List<String>? positions = chordInfo[0].positions;
          List<List<String>>? fingerings = chordInfo[0].fingerings;
          if (positions == null || fingerings == null) {
            flutterGuitarChord = _getNoChord('${chord.chord}{Unknown}');
          } else {
            String frets = positions.map((e) => e == 'x' ? '-1' : e).join(' ');
            String fingers = fingerings[0].join(' ');
            flutterGuitarChord = FlutterGuitarChord(
              baseFret: 1,
              chordName: chord.chord,
              fingers: fingers,
              frets: frets,
              totalString: 6,
              barCount: 5,
              fingerSize: 32,
              showChordLabel: true,
            );
          }
        }
      }
      chordDiagramStates.add(ChordDiagramState(
        chordName: chord.chord,
        flutterGuitarChord: flutterGuitarChord,
      ));
    }
    return chordDiagramStates;
  }

  FlutterGuitarChord _getNoChord(String chordName) {
    return FlutterGuitarChord(
      baseFret: 1,
      chordName: chordName,
      fingers: '0 0 0 0 0 0',
      frets: '-1 -1 -1 -1 -1 -1',
      totalString: 6,
      barCount: 5,
      showChordLabel: true,
    );
  }
}
