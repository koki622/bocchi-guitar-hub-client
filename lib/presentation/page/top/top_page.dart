import 'package:bocchi_guitar_hub_client/application/notifier/songs/songs_notifier.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/top/component/add_song_button.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/top/component/song_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<int, Song>? songs = ref.watch(songsNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Song List')),
      body: (songs == null)
          ? const Center(
              child: Text(
                '曲がありません',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [Expanded(child: SongList(songs: songs, ref: ref))],
            ),
      floatingActionButton: const AddSongButton(),
    );
  }
}
