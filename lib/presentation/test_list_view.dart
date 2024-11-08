import 'dart:convert';

import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/song_elements_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/songs_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/song_usecase.dart';
import 'package:bocchi_guitar_hub_client/core/constant/text/process.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';
import 'package:bocchi_guitar_hub_client/core/enum/remote_job.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/infrastructure_module.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestListView extends ConsumerWidget {
  const TestListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // SongRepository からストリームを取得
    final songsNotifier = ref.watch(songsNotifierProvider.notifier);
    final songUsecase = ref.read(songUsecaseProvider);
    final songs = ref.watch(songsNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Song List')),
      body: (songs == null)
          ? const Center(
              child: Text(
                '曲がありません',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (context, index) {
                        final songId = songs.keys.elementAt(index);
                        final song = songs[songId]; // 曲情報を取得
                        return ListTile(
                          title: Text(
                              '${song?.title} ${ProcessTypeStrings.displayNames[song?.processType]}${ProcessStatusTypeStrings.displayNames[song?.processStatusType]}'),
                          trailing: song != null &&
                                  song.processType ==
                                      ProcessType
                                          .values.last && // 最後のProcessTypeか
                                  song.processStatusType ==
                                      ProcessStatusType
                                          .completed // completedであるか
                              ? IconButton(
                                  icon:
                                      const Icon(Icons.more_vert), // 3点リーダーアイコン
                                  onPressed: () {
                                    // 3点リーダーがタップされたときのアクション
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // 削除ボタン
                                              ListTile(
                                                title: const Text('削除'),
                                                onTap: () {
                                                  // 削除処理
                                                  songUsecase.deleteSong(
                                                      song: song);
                                                  Navigator.of(context)
                                                      .pop(); // モーダルを閉じる
                                                },
                                              ),
                                              // タイトル変更ボタン
                                              ListTile(
                                                title: const Text('タイトル変更'),
                                                onTap: () async {
                                                  // タイトル変更ダイアログを表示
                                                  String? newTitle =
                                                      await showDialog<String>(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      TextEditingController
                                                          titleController =
                                                          TextEditingController(
                                                              text: song.title);
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'タイトルを変更'),
                                                        content: TextField(
                                                          controller:
                                                              titleController,
                                                          decoration:
                                                              const InputDecoration(
                                                                  hintText:
                                                                      '新しいタイトルを入力'),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // キャンセル
                                                            },
                                                            child: const Text(
                                                                'キャンセル'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(titleController
                                                                      .text); // 新しいタイトルを返す
                                                            },
                                                            child: const Text(
                                                                '決定'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );

                                                  if (newTitle != null &&
                                                      newTitle.isNotEmpty) {
                                                    // タイトルが変更された場合
                                                  }
                                                },
                                              ),
                                              // キャンセルボタン
                                              ListTile(
                                                title: const Text('キャンセル'),
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pop(); // モーダルを閉じる
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                )
                              : const SizedBox.shrink(), // 条件を満たさない場合、何も表示しない

                          onTap: () {
                            // ProcessTypeが最後のProcessTypeで、processStatusTypeがcompletedの場合のみタップ可能
                            if (song != null &&
                                song.processType ==
                                    ProcessType
                                        .values.last && // 最後のProcessTypeか
                                song.processStatusType ==
                                    ProcessStatusType.completed) {
                              // completedであるか
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Chord: ${ref.watch(chordNotifierProvider(song)).toString()}'),
                                          Text(
                                              'Beat: ${ref.watch(beatNotifierProvider(song)).toString()}'),
                                          Text(
                                              'Section: ${ref.watch(sectionNotifierProvider(song)).toString()}'),
                                          Text(
                                              'Separated Audio: ${ref.watch(separatedAudioNotifierProvider(song)).toString()}'),
                                          Text(
                                              'Lyric: ${utf8.decode(ref.watch(lyricNotifierProvider(song)).toString().codeUnits)}'),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('閉じる'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        );
                      }),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // ファイルピッカーを表示
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            // 選択されたファイルのパスを取得
            String filePath = result.files.single.path!;

            // ファイル名から拡張子を除いた部分を取得
            String fileName = result.files.single.name;
            String title = fileName.split('.').first; // 拡張子を除いたファイル名

            // TextEditingController を作成し、初期値を設定
            TextEditingController titleController =
                TextEditingController(text: title);

            // ダイアログ表示
            String? inputTitle = await showDialog<String>(
              context: context,
              builder: (context) {
                // ダイアログが表示された後にテキストを選択
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  // ダイアログ表示後にテキストを選択状態にする
                  titleController.selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: titleController.text.length,
                  );
                });

                return AlertDialog(
                  title: Text('曲のタイトルを入力'),
                  content: TextField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: 'タイトルを入力'),
                    autofocus: true, // ダイアログ表示時に最初にフォーカスを当てる
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(titleController.text);
                      },
                      child: Text('決定'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(null); // キャンセルした場合
                      },
                      child: Text('キャンセル'),
                    ),
                  ],
                );
              },
            );

            if (inputTitle != null && inputTitle.isNotEmpty) {
              // タイトルが入力された場合、SongUsecaseを呼び出す
              print('選択されたファイル: $filePath');
              print('入力されたタイトル: $inputTitle');

              await songUsecase.addSong(title: inputTitle, filePath: filePath);
              print('曲が追加されました');
            } else {
              // タイトルが空の場合の処理（例: エラーメッセージを表示など）
              print('タイトルが入力されませんでした');
            }
          } else {
            // ユーザーがファイル選択をキャンセルした場合
            print('ファイル選択がキャンセルされました');
          }
        },
        child: Icon(Icons.add), // ボタンのアイコン
      ),
    );
  }
}
