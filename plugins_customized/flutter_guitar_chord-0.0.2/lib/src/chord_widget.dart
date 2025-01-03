import 'package:flutter/material.dart';

import 'chord_painter.dart';

/// Simple Flutter Guitar Chord Widget using CustomPainter
class FlutterGuitarChord extends StatelessWidget {
  /// Show the fret number and string
  /// For the Cmajor key
  /// -1 3 2 0 1 0
  final String frets;

  /// Show the finger number and fret
  /// For the Cmajor key
  ///  0 3 2 0 1 0
  final String fingers;

  /// Show the base fret number
  /// Start from 1
  /// For the Cmajor key
  /// 1
  final int baseFret;

  /// Name of the chord
  /// For example: Cm7
  final String chordName;

  /// Finger tab size on fret
  final double fingerSize;

  /// The total strings count of instrument
  final int totalString;

  /// The total bars to display
  final int barCount;

  /// The stroke width of the strings
  final double stringStroke;

  /// The stroke width of the bars
  final double barStroke;

  /// The stroke width of the  first frame
  final double firstFrameStroke;

  /// The color of the strings
  final Color stringColor;

  /// The color of the bars
  final Color barColor;

  /// The background color of tabs
  final Color tabBackgroundColor;

  /// The foreground color of tabs
  final Color tabForegroundColor;

  /// The color of labels
  final Color labelColor;

  /// Status to show label
  final bool showFretLabel;

  final bool showChordLabel;

  const FlutterGuitarChord({
    Key? key,
    required this.fingers,
    required this.frets,
    required this.baseFret,
    required this.chordName,
    this.totalString = 6,
    this.fingerSize = 24,
    this.barCount = 4,
    this.stringStroke = 2,
    this.barStroke = 1,
    this.firstFrameStroke = 4,
    this.stringColor = const Color(0xff000000),
    this.barColor = const Color(0xff000000),
    this.tabBackgroundColor = const Color(0xff000000),
    this.tabForegroundColor = const Color(0xffffffff),
    this.labelColor = const Color(0xff000000),
    this.showFretLabel = false,
    this.showChordLabel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: ChordPainter(
        frets: frets,
        fingers: fingers,
        chordName: chordName,
        bar: barCount,
        barStroke: barStroke,
        fingerSize: fingerSize,
        firstFrameStroke: firstFrameStroke,
        stringStroke: stringStroke,
        totalString: totalString,
        barColor: barColor,
        labelColor: labelColor,
        stringColor: stringColor,
        tabBackgroundColor: tabBackgroundColor,
        tabForegroundColor: tabForegroundColor,
        showFretLabel: showFretLabel,
        showChordLabel: showChordLabel,
      ),
    );
  }
}
