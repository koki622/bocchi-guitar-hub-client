import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/presentation/page/top/component/song_list_title.dart';
import 'package:flutter/material.dart';

class SongList extends StatelessWidget {
  final Map<int, Song?> songs;

  const SongList({required this.songs, super.key});

  @override
  Widget build(BuildContext context) {
    final songList = songs.values.toList();
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return SongListTile(songId: songList[index]!.songId);
      },
    );
  }
}
