import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/chord_diagram/current_chord_diagram_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/chord_diagram_usecase.dart';
import 'package:bocchi_guitar_hub_client/core/constant/size.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guitar_chord/flutter_guitar_chord.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChordPanel extends ConsumerWidget {
  final Song song;

  const ChordPanel({super.key, required this.song});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chordDiagramUsecaseAsync =
        ref.watch(chordDiagramUsecaseProvider(song));
    switch (chordDiagramUsecaseAsync) {
      case AsyncData(:final value):
        return ChordCarousel(
          chordDiagramUsecase: value,
          viewportFraction: Sizes.viewportFraction(context),
        );
      case AsyncError(:final error, :final stackTrace):
        return Center(
          child: Text('エラー: $error, $stackTrace'),
        );
      case AsyncLoading():
        return const CircularProgressIndicator();
      default:
        return const CircularProgressIndicator();
    }
  }
}

class ChordCarousel extends ConsumerStatefulWidget {
  final ChordDiagramUsecase chordDiagramUsecase;
  final double viewportFraction;
  const ChordCarousel(
      {super.key,
      required this.chordDiagramUsecase,
      required this.viewportFraction});

  @override
  ConsumerState<ChordCarousel> createState() => _ChordCarouselState(
      chordDiagramUsecase: chordDiagramUsecase,
      viewportFraction: viewportFraction);
}

class _ChordCarouselState extends ConsumerState<ChordCarousel> {
  final ChordDiagramUsecase chordDiagramUsecase;
  final double viewportFraction;
  late final PageController _pageController;
  late final int _initialPage;
  late int _currentIndex;

  _ChordCarouselState(
      {required this.chordDiagramUsecase, required this.viewportFraction});

  @override
  void initState() {
    super.initState();
    _initialPage = ref.read(currentChordDiagramNotifierProvider(
        chordDiagramUsecase.getChordChange));
    _currentIndex = _initialPage;
    _pageController = PageController(
        initialPage: _initialPage, viewportFraction: viewportFraction);
    // PageViewのスクロールを監視し、ページインデックスを更新
    _pageController.addListener(() {
      final int newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentIndex) {
        setState(() {
          _currentIndex = newPage;
        });
      }
    });
  }

  @override
  void dispose() {
    // PageController を破棄
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // コードダイアグラムのインデックスを監視
    ref.listen<int>(
        currentChordDiagramNotifierProvider(chordDiagramUsecase.getChordChange),
        (previous, next) {
      if (previous != next) {
        _currentIndex = next;
        _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
        );
      }
    });
    print('再ビルド');
    return Container(
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        padEnds: false,
        children: [
          for (var (index, flutterGuitarChord)
              in chordDiagramUsecase.getFlutterGuitarChords.indexed)
            _buildChordDiagram(flutterGuitarChord, index),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }

  Widget _buildChordDiagram(FlutterGuitarChord chordWidget, int index) {
    final bool isCurrentChord = index == _currentIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      margin: const EdgeInsets.only(left: 8.0),
      padding: EdgeInsets.all(isCurrentChord ? 8.0 : 0), // ハイライト時に余白追加
      decoration: BoxDecoration(
        border: Border.all(
          color: isCurrentChord ? Colors.amber : Colors.transparent,
          width: 9.0,
        ),
        boxShadow: isCurrentChord
            ? [
                BoxShadow(
                  color: Colors.amber.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 3,
                ),
              ]
            : [],
        borderRadius: BorderRadius.circular(10),
      ),
      child: chordWidget,
    );
  }
}
