// 修正版
import 'dart:math';
import 'package:flutter/material.dart';

/// Draw chords using CustomPainter
class ChordPainter extends CustomPainter {
  final String frets;
  final String fingers;
  final String chordName;
  final int baseFret;
  final double fingerSize;
  final int totalString;
  final int bar;
  final double stringStroke;
  final double barStroke;
  final double firstFrameStroke;
  final Color stringColor;
  final Color barColor;
  final Color tabBackgroundColor;
  final Color tabForegroundColor;
  final Color labelColor;

  ChordPainter({
    required this.fingerSize,
    required this.totalString,
    required this.bar,
    required this.stringStroke,
    required this.barStroke,
    required this.firstFrameStroke,
    required this.baseFret,
    required this.frets,
    required this.fingers,
    required this.chordName,
    required this.stringColor,
    required this.barColor,
    required this.tabBackgroundColor,
    required this.tabForegroundColor,
    required this.labelColor,
  })  : _stringsList = frets.split(' '),
        _fingeringList = fingers.split(' ') {
    assert(_stringsList.length == totalString);
    assert(_fingeringList.length == totalString);
  }

  final double _margin = 30;
  late double _stringGap;
  late double _barGap;
  final List<String> _stringsList, _fingeringList;

  @override
  void paint(Canvas canvas, Size size) {
    // Canvasのサイズを取得してスケーリング計算を行う
    double canvasSize = min(size.width, size.height);

    // 描画領域を正方形に調整
    double drawAreaWidth = canvasSize - _margin * 2;
    double drawAreaHeight = canvasSize - _margin * 2;

    // スケーリングの計算
    _stringGap = (drawAreaHeight / (totalString - 1)) -
        (stringStroke / 2 / (totalString - 1));
    _barGap = (drawAreaWidth / bar);

    final paint = Paint()..strokeWidth = stringStroke;

    double fontSize = canvasSize * 0.05; // キャンバスサイズの5%を文字サイズに設定

    // 弦の描画（縦方向、1弦が上、6弦が下）
    for (int i = 0; i < totalString; i++) {
      final y = _margin + ((totalString - 1 - i) * _stringGap); // 上から順に描画
      canvas.drawLine(
        Offset(_margin, y),
        Offset(_margin + drawAreaWidth, y),
        paint..color = stringColor,
      );
    }

    // フレットの描画（横方向）
    for (int i = 0; i <= bar; i++) {
      final x = _margin + (i * _barGap);
      canvas.drawLine(
        Offset(x, _margin),
        Offset(x, _margin + drawAreaHeight),
        paint
          ..strokeWidth = i == 0 ? firstFrameStroke : barStroke
          ..color = barColor,
      );
    }

    int firstBarNumber = 99;
    for (String i in _stringsList) {
      if (i == '-1' || i == '0') continue;
      firstBarNumber = min<int>(firstBarNumber, int.parse(i));
    }

    // バーラベル
    for (int i = 0; i < bar; i++) {
      int barNumber = baseFret + i;
      final x = _margin + (i * _barGap) + _barGap / 2;

      TextPainter barLabelText = TextPainter(
        text: TextSpan(
          text: barNumber.toString(),
          style: TextStyle(
            color: labelColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      barLabelText.layout(maxWidth: 16, minWidth: 4);
      barLabelText.paint(
          canvas, Offset(x - fontSize / 4, _margin - (fontSize + 20)));
    }

    // ミュート弦ラベル
    double muteLabelFontSize = canvasSize * 0.07; // ミュート弦ラベルのフォントサイズ
    for (int i = 0; i < totalString; i++) {
      if (_stringsList[i] != '-1') continue;

      final y = _margin + ((totalString - 1 - i) * _stringGap); // 上から順に描画

      TextPainter(
        text: TextSpan(
          text: 'X',
          style: TextStyle(
            color: labelColor,
            fontSize: muteLabelFontSize, // スケーリングされたフォントサイズ
            fontWeight: FontWeight.bold,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
        textDirection: TextDirection.ltr,
      )
        ..layout(maxWidth: 4, minWidth: 4)
        ..paint(
          canvas,
          Offset(_margin - muteLabelFontSize - 4,
              y - muteLabelFontSize / 1.5), // ラベルを左側に配置
        );
    }

    // コード名の位置調整: キャンバスサイズに応じて文字サイズを調整
    TextPainter chordNameText = TextPainter(
      text: TextSpan(
        text: chordName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize, // 動的に設定した文字サイズを使用
          color: labelColor,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    chordNameText.layout(maxWidth: drawAreaWidth, minWidth: 4);
    chordNameText.paint(
        canvas,
        Offset(_margin + drawAreaWidth / 2 - chordNameText.width / 2,
            _margin + drawAreaHeight + fontSize));

    _renderChordInformation(canvas, paint, fingerSize, size, firstBarNumber);
  }

  void _renderChordInformation(
    Canvas canvas,
    Paint paint,
    double fingerSize,
    Size size,
    int firstBarNumber,
  ) {
    Set<String> rendered = {};

    // キャンバスのサイズに基づいて、指番号や黒丸のサイズをスケーリング
    double canvasSize = min(size.width, size.height);

    double fingerLabelFontSize = canvasSize * 0.05; // 数字（指番号）のフォントサイズ

    // スケーリングされたラインの太さ
    double scaledLineWidth = canvasSize * 0.1; // キャンバスサイズに応じたラインの太さ

    for (int i = 0; i < totalString; i++) {
      int from = i, to = i;
      String currentFinger = _fingeringList[i];

      if (currentFinger == '0' || rendered.contains(currentFinger)) continue;

      rendered.add(currentFinger);

      for (int i0 = i + 1; i0 < totalString; i0++) {
        if (currentFinger == _fingeringList[i0]) {
          to = i0;
        }
      }

      int fretNumber = int.parse(_stringsList[i]);

      // 黒丸（指番号の位置）を描画
      Offset notePosition = _getPointOfNote(fretNumber, from);
      canvas.drawLine(
        _getPointOfNote(fretNumber, from),
        _getPointOfNote(fretNumber, to),
        paint
          ..strokeWidth = scaledLineWidth // ここでスケーリングされたラインの太さを使用
          ..color = tabBackgroundColor
          ..strokeCap = StrokeCap.round,
      );

      // 指番号（数字）の位置を黒丸の中央に配置
      Offset textPosition = notePosition -
          Offset(fingerLabelFontSize / 3.5, fingerLabelFontSize / 1.6);

      TextPainter(
        text: TextSpan(
          text: currentFinger,
          style: TextStyle(
            color: tabForegroundColor,
            fontSize: fingerLabelFontSize, // フォントサイズもスケーリング
            fontWeight: FontWeight.bold,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
        textDirection: TextDirection.ltr,
      )
        ..layout(maxWidth: 4, minWidth: 4)
        ..paint(
          canvas,
          textPosition,
        );
    }
  }

  Offset _getPointOfNote(int barPosition, int stringPosition) {
    barPosition -= 1;

    final y = _margin + ((totalString - 1 - stringPosition) * _stringGap);
    final x = _margin + (barPosition * _barGap) + _barGap / 2;

    return Offset(x, y);
  }

  @override
  bool shouldRepaint(covariant ChordPainter old) {
    return old.fingerSize != fingerSize ||
        old.totalString != totalString ||
        old.bar != bar ||
        old.stringStroke != stringStroke ||
        old.barStroke != barStroke ||
        old.firstFrameStroke != firstFrameStroke ||
        old.baseFret != baseFret ||
        old.frets != frets ||
        old.fingers != fingers ||
        old.stringColor != stringColor ||
        old.barColor != barColor ||
        old.tabBackgroundColor != tabBackgroundColor ||
        old.tabForegroundColor != tabForegroundColor ||
        old.labelColor != labelColor;
  }
}

class FlutterGuitarChord extends StatelessWidget {
  final String frets;
  final String fingers;
  final int baseFret;
  final String chordName;
  final double fingerSize;
  final int totalString;
  final int barCount;
  final double stringStroke;
  final double barStroke;
  final double firstFrameStroke;
  final Color stringColor;
  final Color barColor;
  final Color tabBackgroundColor;
  final Color tabForegroundColor;
  final Color labelColor;
  final bool showLabel;

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
    this.showLabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: ChordPainter(
        baseFret: baseFret,
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
      ),
    );
  }
}
