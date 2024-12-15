import 'package:bocchi_guitar_hub_client/application/notifier/chord_diagram/chord_diagram_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/song_elements/song_elements_notifier.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChordPanel extends ConsumerWidget {
  final Song song;

  const ChordPanel({super.key, required this.song});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chords = ref.watch(chordNotifierProvider(song));
    final flutterGuitarChords = ref.watch(chordDiagramNotifierProvider(chords));

    switch (flutterGuitarChords) {
      case AsyncData(:final value):
        return PageView(
          scrollDirection: Axis.horizontal,
          controller: PageController(viewportFraction: 0.8),
          children: [
            for (ChordDiagramState chordDiagramState in value)
              Container(child: chordDiagramState.flutterGuitarChord)
          ],
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
