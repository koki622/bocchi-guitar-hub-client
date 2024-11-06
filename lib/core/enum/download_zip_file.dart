import 'package:bocchi_guitar_hub_client/core/constant/reference/webapi.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';

enum DownloadZipFileType {
  downloadSeparationResult(
      processType: ProcessType.downloadSeparationResult,
      endpoint: WebapiEndpointConstant.downloadSeparationResult);

  const DownloadZipFileType(
      {required this.processType, required this.endpoint});

  final ProcessType processType;
  final String endpoint;

  // ProcessTypeから対応するDownloadZipFileTypeを返す
  static DownloadZipFileType fromProcessType(ProcessType processType) {
    return DownloadZipFileType.values.firstWhere(
      (downloadZipFileType) => downloadZipFileType.processType == processType,
      orElse: () => throw ArgumentError(
          'No matching RemoteJobType for ProcessType: $processType'),
    );
  }
}
