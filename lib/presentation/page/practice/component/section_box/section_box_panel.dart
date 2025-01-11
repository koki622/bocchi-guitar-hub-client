import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/song_elements/song_elements_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/audio_player_usecase.dart';
import 'package:bocchi_guitar_hub_client/core/constant/text/section_name.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/section/section.dart';
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
    return ScrollConfiguration(
      behavior: MyCustomScrollBehavior(),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (Section section in sections)
            InkWell(
              onTap: () {
                /**
                audioPlayerUsecase.seek(
                    Duration(milliseconds: (section.start * 1000).round()));
               */
                audioPlayerUsecase.setLoopPoint(
                    loopingStartAt:
                        Duration(milliseconds: (section.start * 1000).round()),
                    loopingEndAt:
                        Duration(milliseconds: (section.end * 1000).round()));
              },
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: 100,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Center(
                      child:
                          Text(SectionNameText.sectionName[section.section]!))),
            )
        ],
      ),
    );
  }
}
