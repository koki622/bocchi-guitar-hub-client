import 'dart:math';

import 'package:flutter/material.dart';

/// Draw chords using CustomPainter
class ChordPainter extends CustomPainter {
  final String frets;
  final String fingers;
  final String chordName;
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
  final bool showFretLabel;
  final bool showChordLabel;
  static const fingeringsMap = {
    '1': '人',
    '2': '中',
    '3': '薬',
    '4': '小',
  };

  ChordPainter({
    required this.fingerSize,
    required this.totalString,
    required this.bar,
    required this.stringStroke,
    required this.barStroke,
    required this.firstFrameStroke,
    required this.frets,
    required this.fingers,
    required this.chordName,
    required this.stringColor,
    required this.barColor,
    required this.tabBackgroundColor,
    required this.tabForegroundColor,
    required this.labelColor,
    required this.showFretLabel,
    required this.showChordLabel,
  })  : _stringsList = frets.split(' '),
        _fingeringList = fingers.split(' ') {
    assert(_stringsList.length == totalString);
    assert(_fingeringList.length == totalString);
  }

  final double _margin = 30;
  late int _baseFret;
  late double _stringGap;
  late double _barGap;
  final List<String> _stringsList, _fingeringList;

  @override
  void paint(Canvas canvas, Size size) {
    // 先頭のフレットを求める
    _baseFret = _calculateBaseFret();

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
    _renderStrings(canvas, paint, drawAreaWidth);

    // フレットの描画（横方向）
    _renderFrets(canvas, paint, drawAreaHeight);

    int firstBarNumber = 99;
    for (String i in _stringsList) {
      if (i == '-1' || i == '0') continue;
      firstBarNumber = min<int>(firstBarNumber, int.parse(i));
    }

    // ミュート、開放弦、フレット番号などのラベルを描画
    _renderBarSideLabel(canvas, canvasSize);

    if (showChordLabel) {
      // コード名を描画
      _renderChordLabel(canvas, fontSize, drawAreaWidth, drawAreaHeight);
    }

    if (showFretLabel) {
      _renderFretLabel(canvas, fontSize);
    }

    // 押さえる位置を描画
    _renderChordInformation(canvas, paint, fingerSize, size, firstBarNumber);
  }

  // 基準となるフレットを計算
  int _calculateBaseFret() {
    bool isOverFret = false;
    List<int> frets = [];
    for (String fret in _stringsList) {
      if (!['0', '-1'].contains(fret)) {
        frets.add(int.parse(fret));
        if (bar < int.parse(fret)) isOverFret = true;
      }
    }
    return isOverFret ? frets.reduce(min) : 1;
  }

  void _renderStrings(Canvas canvas, Paint paint, double drawAreaWidth) {
    // 弦の描画（縦方向、1弦が上、6弦が下）
    for (int i = 0; i < totalString; i++) {
      final y = _margin + ((totalString - 1 - i) * _stringGap); // 上から順に描画
      canvas.drawLine(
        Offset(_margin, y),
        Offset(_margin + drawAreaWidth, y),
        paint..color = stringColor,
      );
    }
  }

  void _renderFrets(Canvas canvas, Paint paint, double drawAreaHeight) {
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
  }

  // ダイアグラム下に表示されるコード名を描画
  void _renderChordLabel(Canvas canvas, double fontSize, double drawAreaWidth,
      double drawAreaHeight) {
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
  }

  // ダイアグラム上に表示されるフレット番号を描画
  void _renderFretLabel(Canvas canvas, double fontSize) {
    for (int i = 0; i < bar; i++) {
      int barNumber = _baseFret + i;
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
  }

  // ダイアグラム左に表示されるミュート、開放弦などのラベル描画
  void _renderBarSideLabel(Canvas canvas, double canvasSize) {
    // フレット数を表示する必要があるか
    bool shouldFretNum = _baseFret > 1 ? true : false;

    // ラベルのフォントサイズ
    double labelFontSize = canvasSize * 0.07;

    for (int i = 0; i < totalString; i++) {
      String labelText;
      if (_stringsList[i] == '-1') {
        labelText = 'X';
      } else if (_stringsList[i] == '0') {
        labelText = '○';
      } else if (shouldFretNum) {
        labelText = _baseFret.toString();
        shouldFretNum = false;
      } else {
        continue;
      }
      final y = _margin + ((totalString - 1 - i) * _stringGap); // 上から順に描画

      TextPainter(
        text: TextSpan(
          text: labelText,
          style: TextStyle(
            color: labelColor,
            fontSize: labelFontSize, // スケーリングされたフォントサイズ
            fontWeight: FontWeight.bold,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
        textDirection: TextDirection.ltr,
      )
        ..layout(maxWidth: 4, minWidth: 4)
        ..paint(
          canvas,
          Offset(_margin - labelFontSize - 4,
              y - labelFontSize / 1.5), // ラベルを左側に配置
        );
    }
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
      if (_baseFret > 1 && !['-1', '0'].contains(_stringsList[i])) {
        fretNumber -= _baseFret - 1;
      }

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
          Offset(fingerLabelFontSize / 2, fingerLabelFontSize / 1.6);

      TextPainter(
        text: TextSpan(
          text: fingeringsMap[currentFinger],
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
        old.frets != frets ||
        old.fingers != fingers ||
        old.stringColor != stringColor ||
        old.barColor != barColor ||
        old.tabBackgroundColor != tabBackgroundColor ||
        old.tabForegroundColor != tabForegroundColor ||
        old.labelColor != labelColor;
  }
}
