// 解析処理の進捗
enum AnalysisType implements Comparable<AnalysisType> {
  // アップロード
  uploading('uploading'),

  // 分離処理
  separating('separating'),

  // 分離処理結果のzip圧縮処理
  compression('compression'),

  // コード分析
  chordAnalysis('chordAnalysis'),

  // スペクトログラム抽出
  extractingSpectrograms('extractingSpectrograms'),

  // 音楽構造分析
  structureAnalysis('structureAnalysis'),

  // 歌詞分析
  lyricAnalysis('lyricAnalysis'),

  // 結果のダウンロード
  downloadSeparationResult('downloadSeparationResult'),
  downloadChordAnalysisResult('downloadChordAnalysisResult'),
  downloadStructureAnalysisResult('downloadStructureAnalysisResult'),
  downloadLyricAnalysisResult('downloadLyricAnalysisResult');

  const AnalysisType(this.value);
  final String value;

  @override
  int compareTo(AnalysisType other) => name.compareTo(other.name);

  static AnalysisType fromString(String value) {
    return AnalysisType.values.firstWhere(
      (element) => element.value == value,
      orElse: () => throw ArgumentError('Invalid AnalysisType: $value'),
    );
  }
}
