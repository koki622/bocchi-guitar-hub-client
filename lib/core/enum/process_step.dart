// 処理タイプの分類
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';

// 処理順番
enum ProcessStep {
  // 初期
  init(InitType.init),
  // アップロード
  uploading(UploadType.upload),

  // 一括楽曲解析
  bulkRemoteJob(BulkRemoteJobType.analyzeAll),
  /**
   * 
  // 分離処理
  separating(RemoteJobType.separating),

  // コード分析
  chordAnalysis(RemoteJobType.chordAnalysis),

  // スペクトログラム抽出
  extractingSpectrograms(RemoteJobType.extractingSpectrograms),

  // 音楽構造分析
  structureAnalysis(RemoteJobType.structureAnalysis),

  // 歌詞分析
  lyricAnalysis(RemoteJobType.lyricAnalysis),
   */

  // 結果のダウンロード
  //downloadSeparationResult(DownloadZipFileType.downloadSeparationResult),
  downloadVocalsStem(DownloadAudioFileType.downloadVocalsStem),
  downloadDrumsStem(DownloadAudioFileType.downloadDrumsStem),
  downloadBassStem(DownloadAudioFileType.downloadBassStem),
  downloadGuitarStem(DownloadAudioFileType.downloadGuitarStem),
  downloadPianoStem(DownloadAudioFileType.downloadPianoStem),
  downloadOtherStem(DownloadAudioFileType.downloadOtherStem),
  downloadClickSoundNormal(DownloadAudioFileType.downloadClickSoundNormal),
  downloadClickSound2x(DownloadAudioFileType.downloadClickSound2x),
  downloadClickSoundHalf(DownloadAudioFileType.downloadClickSoundHalf),
  downloadChordSound(DownloadAudioFileType.downloadChordSound),
  downloadChordAnalysisResult(DownloadJsonType.downloadChordAnalysisResult),
  downloadStructureAnalysisResult(
      DownloadJsonType.downloadStructureAnalysisResult),
  downloadLyricAnalysisResult(DownloadJsonType.downloadLyricAnalysisResult);

  final ProcessInterface process;

  const ProcessStep(this.process);

  ProcessStep? nextProcess(ProcessStatusType status) {
    // Enumのリストを取得
    const values = ProcessStep.values;

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
