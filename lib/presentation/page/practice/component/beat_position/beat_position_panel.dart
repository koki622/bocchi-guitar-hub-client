import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/beat_position/beat_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/song_elements/song_elements_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/beat_position_usecase.dart';
import 'package:bocchi_guitar_hub_client/core/constant/size.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord.dart';
import 'package:bocchi_guitar_hub_client/presentation/notifier/current_beat_notifier.dart';
import 'package:bocchi_guitar_hub_client/presentation/notifier/current_beat_segment_notifier.dart';
import 'package:bocchi_guitar_hub_client/presentation/router/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BeatPositionPanel extends ConsumerWidget {
  final Song song;

  const BeatPositionPanel({super.key, required this.song});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beatPositionUsecase = ref.watch(BeatPositionUsecaseProvider(song));
    final chordState = ref.watch(ChordNotifierProvider(song, 0));
    return BeatBoxCarousel(
      beatPositionUsecase: beatPositionUsecase,
      chords: chordState.chords,
    );
  }
}

class BeatBoxCarousel extends ConsumerStatefulWidget {
  final BeatPositionUsecase beatPositionUsecase;
  final List<Chord> chords;
  const BeatBoxCarousel(
      {super.key, required this.beatPositionUsecase, required this.chords});

  @override
  ConsumerState<BeatBoxCarousel> createState() {
    return _BeatBoxCarouselState(
        beatPositionUsecase: beatPositionUsecase, chords: chords);
  }
}

class _BeatBoxCarouselState extends ConsumerState<BeatBoxCarousel> {
  final BeatPositionUsecase beatPositionUsecase;
  final List<Chord> chords;
  late final List<Beat> _beats;
  late final List<List<String>> _beatOfChords;
  late final PageController _pageController;
  late int _currentIndex;
  _BeatBoxCarouselState(
      {required this.beatPositionUsecase, required this.chords});

  @override
  void initState() {
    super.initState();
    _beats = beatPositionUsecase.getBeats;
    _beatOfChords = beatPositionUsecase.calculateBeatOfChord(chords);
    _currentIndex = ref.read(beatPositionNotifierProvider(_beats));
    _pageController =
        PageController(initialPage: _currentIndex, viewportFraction: 0.2);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(currentBeatSegmentNotifierProvider(_beats),
        (previous, next) {
      _pageController.animateToPage(next,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });

    return PageView(
      padEnds: false,
      controller: _pageController,
      children: _buildBeatBoxes(_beats),
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }

  List<Widget> _buildBeatBoxes(List<Beat> beats) {
    List<Widget> beatBoxes = [];
    for (var (beatIndex, value) in beats.indexed) {
      beatBoxes.add(BeatBox(
        index: beatIndex,
        beatPosition: value.beatPosition,
        beats: beats,
        chordNames: _beatOfChords[beatIndex],
      ));
    }
    return beatBoxes;
  }
}

class BeatBox extends ConsumerWidget {
  final int index;
  final double beatPosition;
  final List<Beat> beats;
  final List<String?> chordNames;

  const BeatBox(
      {super.key,
      required this.index,
      required this.beatPosition,
      required this.beats,
      required this.chordNames});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCurrentBeat = ref.watch(
      currentBeatNotifierProvider(beats).select((state) => state[index]),
    );
    final containerBorder = beatPosition == 1.0
        ? Border(left: BorderSide(color: Colors.black, width: 5))
        : null;
    final chordText = chordNames.isEmpty
        ? [const Text('')]
        : [
            for (String? chordName in chordNames)
              Text(
                chordName!,
                style: TextStyle(fontSize: Sizes.fontLarge(context)),
                overflow: TextOverflow.ellipsis,
              )
          ];
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      duration: const Duration(milliseconds: 0),
      decoration: BoxDecoration(
        color: isCurrentBeat ? Colors.yellow : Colors.grey,
        border: containerBorder,
        //border:
        //    Border.all(color: isCurrentBeat ? Colors.yellow : Colors.black)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: chordText,
      ),
    );
  }
}
