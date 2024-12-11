import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SongOptionsButton extends StatelessWidget {
  final Song song;
  final WidgetRef ref;

  const SongOptionsButton({required this.song, required this.ref, super.key});

  @override
  Widget build(BuildContext context) {
    final songUsecase = ref.read(songUsecaseProvider);

    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('削除'),
                    onTap: () {
                      songUsecase.deleteSong(song: song);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('タイトル変更'),
                    onTap: () async {
                      Navigator.pop(context);
                      await _showEditTitleDialog(context, song);
                    },
                  ),
                  ListTile(
                    title: const Text('キャンセル'),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _showEditTitleDialog(BuildContext context, Song song) async {
    final titleController = TextEditingController(text: song.title);
    final newTitle = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('タイトルを変更'),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: '新しいタイトルを入力'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, titleController.text),
              child: const Text('決定'),
            ),
          ],
        );
      },
    );

    if (newTitle != null && newTitle.isNotEmpty) {
      // タイトル更新処理を呼び出し
    }
  }
}
