import 'dart:convert';

import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord.dart';
import 'package:flutter/services.dart';
import 'package:flutter_guitar_chord/flutter_guitar_chord.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chord_diagram_notifier.g.dart';
part 'chord_diagram_notifier.freezed.dart';

@freezed
class ChordDiagramState with _$ChordDiagramState {
  factory ChordDiagramState({
    required String chordName,
    required FlutterGuitarChord flutterGuitarChord,
  }) = _ChordDiagramState;
}

@freezed
class ChordDiagramInfo with _$ChordDiagramInfo {
  factory ChordDiagramInfo({
    required List<String>? positions,
    required List<List<String>>? fingerings,
  }) = _ChordDiagramInfo;

  factory ChordDiagramInfo.fromJson(Map<String, dynamic> json) =>
      _$ChordDiagramInfoFromJson(json);
}

@freezed
class ChordDiagramInfoCollection with _$ChordDiagramInfoCollection {
  factory ChordDiagramInfoCollection({
    required Map<String, List<ChordDiagramInfo>> chordDiagramInfos,
  }) = _ChordDiagramInfoCollection;

  factory ChordDiagramInfoCollection.fromJson(Map<String, dynamic> json) {
    try {
      return ChordDiagramInfoCollection(
        chordDiagramInfos: json.map((key, value) {
          if (value[0] == null) {
            value[0] = {
              'positions': null,
              'fingerings': null,
            };
          }
          final List<ChordDiagramInfo> infos = (value as List)
              .map((item) => ChordDiagramInfo.fromJson(item))
              .toList();
          return MapEntry(key, infos);
        }),
      );
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
        ChordTimeRange(Duration(seconds: chord.time.toInt()),
            Duration(seconds: (chord.time + chord.duration).toInt())): index
    };
  }

  Map<ChordTimeRange, int> get getState => state;
}

@riverpod
class ChordDiagramNotifier extends _$ChordDiagramNotifier {
  late ChordDiagramInfoCollection _chordInfos;

  @override
  Future<List<ChordDiagramState>> build(List<Chord> chords) async {
    await _loadChordsJson();
    return _convertChordToDiagram(chords);
  }

  Future<void> _loadChordsJson() async {
    String jsonStr = await rootBundle.loadString('assets/chords.json');
    _chordInfos = ChordDiagramInfoCollection.fromJson(json.decode(jsonStr));
  }

  List<ChordDiagramState> _convertChordToDiagram(List<Chord> chords) {
    List<ChordDiagramState> chordDiagramStates = [];
    for (Chord chord in chords) {
      FlutterGuitarChord flutterGuitarChord;
      if (['X', 'N'].contains(chord.chord)) {
        // XやNコードを含む場合
        flutterGuitarChord = _getNoChord(chord.chord);
      } else {
        List<ChordDiagramInfo>? chordInfo =
            _chordInfos.chordDiagramInfos[chord.chord];
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
