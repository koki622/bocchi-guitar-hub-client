import 'package:bocchi_guitar_hub_client/application/notifier/song_elements/song_elements_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/songs/selected_song.dart';
import 'package:bocchi_guitar_hub_client/core/constant/text/process.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_step.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/top/component/song_options_button.dart';
import 'package:bocchi_guitar_hub_client/presentation/router/go_router.dart';
import 'package:bocchi_guitar_hub_client/presentation/router/page_path.dart';
import 'package:bocchi_guitar_hub_client/presentation/soloud_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SongListTile extends StatelessWidget {
  final Song? song;
  final WidgetRef ref;

  const SongListTile({
    required this.song,
    required this.ref,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (song == null) return const SizedBox.shrink();
    return ListTile(
      title: Text(
          '${song?.title} ${ProcessStepStrings.displayNames[song?.processType]}${ProcessStatusTypeStrings.displayNames[song?.processStatusType]}'),
      trailing: song!.processType == ProcessStep.values.last &&
              song!.processStatusType == ProcessStatusType.completed
          ? SongOptionsButton(
              song: song!,
              ref: ref,
            )
          : const SizedBox.shrink(),
      onTap: () => _handleTap(context, song!),
    );
  }

  Future<void> _handleTap(BuildContext context, Song song) async {
    if (song.processType == ProcessStep.values.last &&
        song.processStatusType == ProcessStatusType.completed) {
      try {
        if (context.mounted) {
          ref.watch(selectedSongProvider.notifier).set(song);
          context.pushNamed(PageId.practice.name);
        }
      } catch (error) {
        if (context.mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error loading audio: $error')),
          );
        }
      }
    }
  }
}
