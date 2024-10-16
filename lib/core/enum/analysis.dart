// 解析処理の進捗
enum AnalysisType implements Comparable<AnalysisType> {
  // アップロード
  uploading,

  // 分離処理
  separating,

  // 分離処理結果のzip圧縮処理
  compression,

  // コード分析
  chordAnalysis,

  // スペクトログラム抽出
  extractingSpectrograms,

  // 音楽構造分析
  structureAnalysis,

  // 歌詞分析
  lyricAnalysis,

  // 結果のダウンロード
  downloadSeparationResult,
  downloadChordAnalysisResult,
  downloadStructureAnalysisResult,
  downloadLyricAnalysisResult;

  @override
  int compareTo(AnalysisType other) => name.compareTo(other.name);
}
