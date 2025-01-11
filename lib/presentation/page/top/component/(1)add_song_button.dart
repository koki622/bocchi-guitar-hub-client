import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/song_usecase.dart';
import 'package:bocchi_guitar_hub_client/core/constant/reference/file_extensions.dart';
import 'package:bocchi_guitar_hub_client/core/constant/size.dart';
import 'package:bocchi_guitar_hub_client/core/enum/language_code.dart';
import 'package:bocchi_guitar_hub_client/presentation/error_handler_mixin.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddSongButton extends ConsumerWidget {
  const AddSongButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songUsecase = ref.read(songUsecaseProvider);

    return FloatingActionButton(
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.audio,
          allowedExtensions: FileExtensions.allowFileExtensions.keys
              .map((key) => key.substring(1))
              .toList(),
          allowMultiple: false,
        );
        if (result != null) {
          showDialog<String>(
              context: context,
              builder: (context) => AddSongDialog(
                    filePickerResult: result,
                    songUsecase: songUsecase,
                  ));
        }
      },
      child: const Icon(Icons.add),
    );
  }
}

class AddSongDialog extends StatefulWidget {
  final FilePickerResult filePickerResult;
  final SongUsecase songUsecase;

  const AddSongDialog(
      {super.key, required this.filePickerResult, required this.songUsecase});

  @override
  State<StatefulWidget> createState() => _AddSongDialog(
      filePickerResult: filePickerResult, songUsecase: songUsecase);
}

class _AddSongDialog extends State<AddSongDialog> with ErrorHandlerMixin {
  bool _isAnalyzeLyric = true;
  late String _inputTitle;
  late final String title;
  late final String filePath;
  final FilePickerResult filePickerResult;
  final SongUsecase songUsecase;
  late final TextEditingController titleController;
  _AddSongDialog({required this.filePickerResult, required this.songUsecase});
  @override
  void initState() {
    super.initState();
    filePath = filePickerResult.files.single.path!;
    String fileName = filePickerResult.files.single.name;
    // ファイル名の最後の "." の位置を取得
    int lastDotIndex = fileName.lastIndexOf('.');
    title = lastDotIndex == -1 ? fileName : fileName.substring(0, lastDotIndex);

    titleController = TextEditingController(text: title);
    _inputTitle = title;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '練習曲追加',
        style: TextStyle(fontSize: Sizes.fontLarge(context)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: title, labelText: 'タイトルを入力'),
            autofocus: true,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text('歌詞解析をする',
                  style: TextStyle(
                    fontSize: Sizes.fontNormal(context),
                  )),
              Checkbox(
                value: _isAnalyzeLyric,
                onChanged: (value) {
                  setState(() {
                    _isAnalyzeLyric = _isAnalyzeLyric ? false : true;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          _isAnalyzeLyric
              ? DropdownMenu(
                  width: 300,
                  label: Text('歌詞の言語を選択'),
                  dropdownMenuEntries: [
                    for (Language lan in Language.values)
                      DropdownMenuEntry(value: lan, label: lan.japaneseName)
                  ],
                  onSelected: (value) => null,
                )
              : Text('')
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            if (_inputTitle.isNotEmpty) {
              final action = () =>
                  songUsecase.addSong(title: _inputTitle, filePath: filePath);
              await execute(context, action, successMessage: '練習曲が追加されました');
            }
            Navigator.pop(context, titleController.text);
          },
          child: const Text('決定'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('キャンセル'),
        ),
      ],
    );
  }
}
