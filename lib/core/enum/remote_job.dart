import 'package:bocchi_guitar_hub_client/core/constant/reference/webapi_endpoint.dart';
import 'package:bocchi_guitar_hub_client/core/enum/analysis.dart';

enum RemoteJobType implements Comparable<RemoteJobType> {
  // 楽曲分離処理
  separating(
      analysisType: AnalysisType.separating,
      endpoint: WebapiEndpointConstant.separating),

  // 楽曲分離結果の圧縮
  compression(
      analysisType: AnalysisType.compression,
      endpoint: WebapiEndpointConstant.compression),

  // コード進行解析処理
  chordAnalysis(
      analysisType: AnalysisType.chordAnalysis,
      endpoint: WebapiEndpointConstant.chordAnalysis),

  // スペクトログラム抽出処理
  extractingSpectrograms(
      analysisType: AnalysisType.extractingSpectrograms,
      endpoint: WebapiEndpointConstant.extractingSpectrograms),

  // 音楽構造解析処理
  structureAnalysis(
      analysisType: AnalysisType.structureAnalysis,
      endpoint: WebapiEndpointConstant.structureAnalysis),

  // 歌詞解析処理
  lyricAnalysis(
      analysisType: AnalysisType.lyricAnalysis,
      endpoint: WebapiEndpointConstant.lyricAnalysis);

  const RemoteJobType({required this.analysisType, required this.endpoint});

  final AnalysisType analysisType;
  final String endpoint;

  @override
  int compareTo(RemoteJobType other) => name.compareTo(other.name);

  // AnalysisType から endpoint を取得するメソッド
  static String? getEndpointByAnalysisType(AnalysisType analysisType) {
    for (var job in RemoteJobType.values) {
      if (job.analysisType == analysisType) {
        return job.endpoint;
      }
    }
    return null; // 該当するステータスが見つからない場合
  }

  static List<RemoteJobType> getJobsFromAndAfter(RemoteJobType startingJob) {
    // startingJob のインデックスを取得
    int startIndex = RemoteJobType.values.indexOf(startingJob);

    // startingJob から最後までのリストを返す
    return RemoteJobType.values.sublist(startIndex);
  }
}
