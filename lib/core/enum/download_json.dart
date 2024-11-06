import 'package:bocchi_guitar_hub_client/core/constant/reference/webapi.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';

enum DownloadJsonType {
  downloadChordAnalysisResult(
      processType: ProcessType.downloadChordAnalysisResult,
      endpoint: WebapiEndpointConstant.downloadChordAnalysisResult,
      queryParams: WebapiQueryParametersConstant.downloadChordAnalysisResult),

  downloadStructureAnalysisResult(
      processType: ProcessType.downloadStructureAnalysisResult,
      endpoint: WebapiEndpointConstant.downloadStructureAnalysisResult,
      queryParams:
          WebapiQueryParametersConstant.downloadStructureAnalysisResult),

  downloadLyricAnalysisResult(
      processType: ProcessType.downloadLyricAnalysisResult,
      endpoint: WebapiEndpointConstant.downloadLyricAnalysisResult,
      queryParams: null);

  const DownloadJsonType(
      {required this.processType, required this.endpoint, this.queryParams});

  final ProcessType processType;
  final String endpoint;
  final Map<String, String>? queryParams;

  // ProcessTypeから対応するDownloadJsonTypeを返す
  static DownloadJsonType fromProcessType(ProcessType processType) {
    return DownloadJsonType.values.firstWhere(
      (downloadJsonType) => downloadJsonType.processType == processType,
      orElse: () => throw ArgumentError(
          'No matching RemoteJobType for ProcessType: $processType'),
    );
  }
}
