/**
 * 
import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/song_usecase.dart';
import 'package:bocchi_guitar_hub_client/core/enum/remote_job.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilePickerScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ファイル選択'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // ファイルピッカーを表示
            FilePickerResult? result = await FilePicker.platform.pickFiles();

            if (result != null) {
              // 選択されたファイルのパスを取得
              String filePath = result.files.single.path!;
              // ここでファイルパスを使って何か処理をする
              print('選択されたファイル: $filePath');
              SongUsecase songUsecase = ref.read(songUsecaseProvider);
              Song song =
                  await songUsecase.addSong(title: 'うんち', filePath: filePath);
              await songUsecase.analysis(
                  song: song, startRemoteJob: RemoteJobType.separating);
              print('ここまで実行されています');
            } else {
              // ユーザーがファイル選択をキャンセルした場合
              print('ファイル選択がキャンセルされました');
            }
          },
          child: Text('ファイルを選択'),
        ),
      ),
    );
  }
}

 */