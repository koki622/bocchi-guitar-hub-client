import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/lyric_position/lyric_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/lyric_position_usecase.dart';
import 'package:bocchi_guitar_hub_client/core/constant/size.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric_word.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LyricPanel extends ConsumerWidget {
  final Song song;

  const LyricPanel({super.key, required this.song});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lyricPositionUsecase = ref.watch(lyricPositionUsecaseProvider(song));
    return LyricCarousel(lyricPositionUsecase: lyricPositionUsecase);
  }
}

class LyricCarousel extends ConsumerStatefulWidget {
  final LyricPositionUsecase lyricPositionUsecase;
  const LyricCarousel({super.key, required this.lyricPositionUsecase});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LyricCarouselState(lyricPositionUsecase: lyricPositionUsecase);
  }
}

class _LyricCarouselState extends ConsumerState<LyricCarousel> {
  final LyricPositionUsecase lyricPositionUsecase;
  late final List<Lyric> _lyrics;
  late final PageController _pageController;
  late int _currentIndex;

  _LyricCarouselState({required this.lyricPositionUsecase});

  @override
  void initState() {
    super.initState();
    _lyrics = lyricPositionUsecase.getLyrics;
    _currentIndex = ref.read(segmentedLyricPositionNotifierProvider(_lyrics));
    _pageController =
        PageController(initialPage: _currentIndex, viewportFraction: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(segmentedLyricPositionNotifierProvider(_lyrics),
        (previous, next) {
      _pageController.animateToPage(next,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
    return PageView(
      scrollDirection: Axis.vertical,
      padEnds: false,
      controller: _pageController,
      children: _buildLyricTexts(),
    );
  }

  List<Widget> _buildLyricTexts() {
    return _lyrics
        .asMap()
        .entries
        .map((entry) => _buildLyricLine(entry.key, entry.value))
        .toList();
  }

  Widget _buildLyricLine(int segmentedLyricIndex, Lyric lyric) {
    final currentWordLyricPosition =
        ref.watch(wordLyricPositionNotifierProvider(
      _lyrics,
      segmentedLyricIndex,
    ));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: lyric.words.asMap().entries.map((entry) {
              final index = entry.key;
              final word = entry.value;
              final duration =
                  Duration(milliseconds: (word.end * 1000).round()) -
                      Duration(milliseconds: (word.start * 1000).round());
              Widget? text;
              if (currentWordLyricPosition == null) {
                text = Text(
                  word.word + " ",
                  style: TextStyle(
                    fontSize: Sizes.fontLarge(context),
                    color: Colors.grey,
                  ),
                );
              } else if (currentWordLyricPosition.index == index) {
                if (currentWordLyricPosition.isStarted) {
                  text = AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      ColorizeAnimatedText(word.word + " ",
                          speed: duration,
                          textStyle:
                              TextStyle(fontSize: Sizes.fontLarge(context)),
                          colors: [Colors.red, Colors.grey])
                    ],
                  );
                } else if (currentWordLyricPosition.isFinished) {
                  text = Text(word.word + " ",
                      style: TextStyle(
                        fontSize: Sizes.fontLarge(context),
                        color: Colors.red,
                      ));
                }
              } else if (currentWordLyricPosition.index < index) {
                text = Text(
                  word.word + " ",
                  style: TextStyle(
                    fontSize: Sizes.fontLarge(context),
                    color: Colors.grey,
                  ),
                );
              } else if (currentWordLyricPosition.index > index) {
                text = Text(
                  word.word + " ",
                  style: TextStyle(
                    fontSize: Sizes.fontLarge(context),
                    color: Colors.red,
                  ),
                );
              }
              return WidgetSpan(child: text ?? const Text(''));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
