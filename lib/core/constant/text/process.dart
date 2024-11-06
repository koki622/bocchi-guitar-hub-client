import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';

class ProcessTypeStrings {
  static const Map<ProcessType, String> displayNames = {
    ProcessType.init: '初期処理',
    ProcessType.uploading: 'アップロード',
    ProcessType.separating: '分離処理',
    ProcessType.compression: '分離処理結果のzip圧縮処理',
    ProcessType.chordAnalysis: 'コード分析',
    ProcessType.extractingSpectrograms: 'スペクトログラム抽出',
    ProcessType.structureAnalysis: '音楽構造分析',
    ProcessType.lyricAnalysis: '歌詞分析',
    ProcessType.downloadSeparationResult: '結果のダウンロード（分離結果）',
    ProcessType.downloadChordAnalysisResult: '結果のダウンロード（コード分析）',
    ProcessType.downloadStructureAnalysisResult: '結果のダウンロード（音楽構造分析）',
    ProcessType.downloadLyricAnalysisResult: '結果のダウンロード（歌詞分析）',
  };
}

class ProcessStatusTypeStrings {
  static const Map<ProcessStatusType, String> displayNames = {
    ProcessStatusType.processing: '中',
    ProcessStatusType.failed: '失敗',
    ProcessStatusType.completed: '完了',
    ProcessStatusType.interrupted: '中断',
  };
}
