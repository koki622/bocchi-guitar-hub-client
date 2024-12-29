import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/remote_job/remote_job_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/song_elements/song_elements_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/songs/songs_notifier.dart';
import 'package:bocchi_guitar_hub_client/core/constant/text/remote_job.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/remote_job/remote_job_status.dart';
import 'package:bocchi_guitar_hub_client/presentation/notifier/selected_song.dart';
import 'package:bocchi_guitar_hub_client/core/constant/text/process.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_step.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/top/component/song_options_button.dart';
import 'package:bocchi_guitar_hub_client/presentation/router/go_router.dart';
import 'package:bocchi_guitar_hub_client/presentation/router/page_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SongListTile extends ConsumerWidget {
  final int songId;

  const SongListTile({
    required this.songId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final song =
        ref.watch(songsNotifierProvider.select((songs) => songs![songId]));
    final remoteJobStatus = ref.watch(remoteJobNotifierProvider(song!.songId));
    final isProcessFinish = song.processType == ProcessStep.values.last &&
        song.processStatusType == ProcessStatusType.completed;
    return ListTile(
      title: Text(song.title),
      subtitle: isProcessFinish
          ? null
          : _buildProcessStatus(context, song, remoteJobStatus),
      enabled: isProcessFinish,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          song.processStatusType == ProcessStatusType.interrupted
              ? IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    ref.read(songUsecaseProvider).resumeProcess(song: song);
                  },
                )
              : const SizedBox.shrink(),
          song.processStatusType != ProcessStatusType.processing
              ? SongOptionsButton(
                  song: song,
                  ref: ref,
                )
              : const SizedBox.shrink(),
        ],
      ),
      onTap: () => _handleTap(context, song, ref),
    );
  }

  Widget _buildProcessStatus(
      BuildContext context, Song song, RemoteJobStatus? remoteJobStatus) {
    if (song.processType == ProcessStep.bulkRemoteJob) {
      return Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(RemoteJobStrings
                .displayNames[remoteJobStatus!.currentRemoteJobType]!),
          ),
          SizedBox(
            width: 90,
            child: Text(
              JobStatusStrings.displayNames[remoteJobStatus.jobStatus] ??
                  JobStatusStrings.displayQueue(
                      remoteJobStatus.queuePosition) ??
                  '',
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Text(ProcessStepStrings.displayNames[song.processType]!),
        ],
      );
    }
  }

  Future<void> _handleTap(
      BuildContext context, Song song, WidgetRef ref) async {
    try {
      if (context.mounted) {
        ref.watch(selectedSongProvider.notifier).set(song);
        context.pushNamed(PageId.practice.name);
      }
    } catch (error) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('オーディオのロードに失敗しました: $error')),
        );
      }
    }
  }
}
