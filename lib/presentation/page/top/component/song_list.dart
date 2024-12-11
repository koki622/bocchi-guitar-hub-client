import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/top/component/song_list_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SongList extends StatelessWidget {
  final Map<int, Song?> songs;
  final WidgetRef ref;

  const SongList({required this.songs, required this.ref, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final songId = songs.keys.elementAt(index);
        final song = songs[songId];
        return SongListTile(song: song, ref: ref);
      },
    );
  }
}
