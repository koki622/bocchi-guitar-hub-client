import 'package:bocchi_guitar_hub_client/core/constant/reference/webapi.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';

enum RemoteJobType implements Comparable<RemoteJobType> {
  // 楽曲分離処理
  separating(
      processType: ProcessType.separating,
      endpoint: WebapiEndpointConstant.separating),

  // 楽曲分離結果の圧縮
  compression(
      processType: ProcessType.compression,
      endpoint: WebapiEndpointConstant.compression),

  // コード進行解析処理
  chordAnalysis(
      processType: ProcessType.chordAnalysis,
      endpoint: WebapiEndpointConstant.chordAnalysis),

  // スペクトログラム抽出処理
  extractingSpectrograms(
      processType: ProcessType.extractingSpectrograms,
      endpoint: WebapiEndpointConstant.extractingSpectrograms),

  // 音楽構造解析処理
  structureAnalysis(
      processType: ProcessType.structureAnalysis,
      endpoint: WebapiEndpointConstant.structureAnalysis),

  // 歌詞解析処理
  lyricAnalysis(
      processType: ProcessType.lyricAnalysis,
      endpoint: WebapiEndpointConstant.lyricAnalysis);

  const RemoteJobType({required this.processType, required this.endpoint});

  final ProcessType processType;
  final String endpoint;

  @override
  int compareTo(RemoteJobType other) => name.compareTo(other.name);

  // processType から endpoint を取得するメソッド
  static String? getEndpointByProcessType(ProcessType processType) {
    for (var job in RemoteJobType.values) {
      if (job.processType == processType) {
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

  // ProcessTypeから対応するRemoteJobTypeを返すメソッド
  static RemoteJobType fromProcessType(ProcessType processType) {
    return RemoteJobType.values.firstWhere(
      (jobType) => jobType.processType == processType,
      orElse: () => throw ArgumentError(
          'No matching RemoteJobType for ProcessType: $processType'),
    );
  }
}
