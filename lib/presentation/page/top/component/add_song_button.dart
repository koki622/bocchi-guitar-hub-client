import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/presentation/error_handler_mixin.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddSongButton extends ConsumerWidget with ErrorHandlerMixin {
  const AddSongButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songUsecase = ref.read(songUsecaseProvider);

    return FloatingActionButton(
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          String filePath = result.files.single.path!;
          String fileName = result.files.single.name;
          // ファイル名の最後の "." の位置を取得
          int lastDotIndex = fileName.lastIndexOf('.');
          String title = lastDotIndex == -1
              ? fileName
              : fileName.substring(0, lastDotIndex);

          TextEditingController titleController =
              TextEditingController(text: title);

          if (!context.mounted) return;

          String? inputTitle = await showDialog<String>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('曲のタイトルを入力'),
                content: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(hintText: 'タイトルを入力'),
                  autofocus: true,
                ),
                actions: [
                  TextButton(
                    onPressed: () =>
                        Navigator.pop(context, titleController.text),
                    child: const Text('決定'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('キャンセル'),
                  ),
                ],
              );
            },
          );

          if (inputTitle != null && inputTitle.isNotEmpty) {
            action() =>
                songUsecase.addSong(title: inputTitle, filePath: filePath);
            if (!context.mounted) return;
            await execute(context, action, successMessage: '曲の追加に成功しました');
          }
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
