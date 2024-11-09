import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';

class ProcessTypeStrings {
  static const Map<ProcessType, String> displayNames = {
    ProcessType.init: '初期処理',
    ProcessType.uploading: 'アップロード',
    ProcessType.separating: '音源分離処理',
    ProcessType.compression: '分離音源を圧縮',
    ProcessType.chordAnalysis: 'コード解析',
    ProcessType.extractingSpectrograms: 'スペクトログラム抽出',
    ProcessType.structureAnalysis: '音楽構造解析',
    ProcessType.lyricAnalysis: '歌詞解析',
    ProcessType.downloadSeparationResult: '分離音源のダウンロード',
    ProcessType.downloadChordAnalysisResult: 'コード解析結果のダウンロード',
    ProcessType.downloadStructureAnalysisResult: '音楽構造解析結果のダウンロード',
    ProcessType.downloadLyricAnalysisResult: '歌詞解析結果のダウンロード',
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
