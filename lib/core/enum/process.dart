// 処理タイプの分類
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';

enum ProcessCategory {
  init,
  upload,
  remoteJob,
  downloadJson,
  downloadZip,
}

// 解析処理の進捗
enum ProcessType implements Comparable<ProcessType> {
  // 初期
  init(ProcessCategory.init),
  // アップロード
  uploading(ProcessCategory.upload),

  // 分離処理
  separating(ProcessCategory.remoteJob),

  // 分離処理結果のzip圧縮処理
  compression(ProcessCategory.remoteJob),

  // コード分析
  chordAnalysis(ProcessCategory.remoteJob),

  // スペクトログラム抽出
  extractingSpectrograms(ProcessCategory.remoteJob),

  // 音楽構造分析
  structureAnalysis(ProcessCategory.remoteJob),

  // 歌詞分析
  lyricAnalysis(ProcessCategory.remoteJob),

  // 結果のダウンロード
  downloadSeparationResult(ProcessCategory.downloadZip),
  downloadChordAnalysisResult(ProcessCategory.downloadJson),
  downloadStructureAnalysisResult(ProcessCategory.downloadJson),
  downloadLyricAnalysisResult(ProcessCategory.downloadJson);

  final ProcessCategory category;

  const ProcessType(this.category);

  @override
  int compareTo(ProcessType other) => name.compareTo(other.name);

  ProcessType? nextProcess(ProcessStatusType status) {
    // Enumのリストを取得
    const values = ProcessType.values;

    // 現在のインデックスを取得
    final currentIndex = values.indexOf(this);

    switch (status) {
      case ProcessStatusType.completed:
        if (currentIndex + 1 < values.length) {
          return values[currentIndex + 1]; // 次のプロセスを返す
        } else {
          return null; // 最後のプロセスの場合はnullを返す
        }
      case ProcessStatusType.failed:
        return this; // 同じプロセスを返す
      case ProcessStatusType.interrupted:
        return this;
      case ProcessStatusType.processing:
        throw Exception('プロセスは実行中です');
    }
  }
}
