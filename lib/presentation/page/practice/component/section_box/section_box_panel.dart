import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_loop_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/song_elements/song_elements_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/audio_player_usecase.dart';
import 'package:bocchi_guitar_hub_client/core/constant/text/section_name.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/section/section.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/selected_section/selected_section_notifier.dart';
import 'package:bocchi_guitar_hub_client/presentation/router/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SectionBoxPanel extends ConsumerWidget {
  final Song song;
  final AudioPlayerUsecase audioPlayerUsecase;
  const SectionBoxPanel(
      {super.key, required this.song, required this.audioPlayerUsecase});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sections = ref.watch(sectionNotifierProvider(song));
    final isLoopOn = ref.watch(
        playbackLoopNotifierProvider(audioPlayerUsecase.getTotalDuration())
            .select((selector) => selector.isLooping));
    final selectedSections =
        isLoopOn ? ref.watch(selectedSectionNotifierProvider(song)) : [];
    return ScrollConfiguration(
      behavior: MyCustomScrollBehavior(),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (final (index, section) in sections.indexed)
            AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: 100,
                duration: const Duration(seconds: 2),
                child: Material(
                  color: selectedSections.contains(index)
                      ? Colors.yellow
                      : Colors.blue,
                  child: InkWell(
                      onTap: () {
                        if (isLoopOn) {
                          audioPlayerUsecase.setSelectedSection(index);
                        } else {
                          audioPlayerUsecase.resetLoopPoint();
                          audioPlayerUsecase.seek(Duration(
                              milliseconds: (section.start * 1000).round()));
                        }
                      },
                      child: Center(
                          child: Text(
                              SectionNameText.sectionName[section.section]!))),
                ))
        ],
      ),
    );
  }
}
