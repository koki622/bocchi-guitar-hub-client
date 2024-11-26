import 'package:bocchi_guitar_hub_client/core/enum/process_step.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process_status.dart';

class ProcessStepStrings {
  static const Map<ProcessStep, String> displayNames = {
    ProcessStep.init: '初期処理',
    ProcessStep.uploading: 'アップロード',
    //ProcessStep.separating: '音源分離処理',
    //ProcessStep.compression: '分離音源を圧縮',
    //ProcessStep.chordAnalysis: 'コード解析',
    //ProcessStep.extractingSpectrograms: 'スペクトログラム抽出',
    //ProcessStep.structureAnalysis: '音楽構造解析',
    //ProcessStep.lyricAnalysis: '歌詞解析',
    //ProcessStep.downloadSeparationResult: '分離音源のダウンロード',
    ProcessStep.downloadVocalsStem: 'ボーカル音源のダウンロード',
    ProcessStep.downloadDrumsStem: 'ドラム音源のダウンロード',
    ProcessStep.downloadBassStem: 'ベース音源のダウンロード',
    ProcessStep.downloadGuitarStem: 'ギター音源のダウンロード',
    ProcessStep.downloadPianoStem: 'ピアノ音源のダウンロード',
    ProcessStep.downloadOtherStem: 'その他音源のダウンロード',
    ProcessStep.downloadClickSoundNormal: 'クリック音(normal)のダウンロード',
    ProcessStep.downloadClickSound2x: 'クリック音(2x)のダウンロード',
    ProcessStep.downloadClickSoundHalf: 'クリック音(half)のダウンロード',
    ProcessStep.downloadChordSound: 'コード音声のダウンロード',
    ProcessStep.downloadChordAnalysisResult: 'コード解析結果のダウンロード',
    ProcessStep.downloadStructureAnalysisResult: '音楽構造解析結果のダウンロード',
    ProcessStep.downloadLyricAnalysisResult: '歌詞解析結果のダウンロード',
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
