import 'package:bocchi_guitar_hub_client/core/constant/reference/audiofile.dart';
import 'package:bocchi_guitar_hub_client/core/constant/reference/webapi.dart';

abstract interface class ProcessInterface {}

enum InitType implements ProcessInterface { init }

enum UploadType implements ProcessInterface {
  upload(endpoint: WebapiEndpointConstant.uploadAudioFile);

  const UploadType({required this.endpoint});

  final String endpoint;
}

enum DownloadJsonType implements ProcessInterface {
  downloadChordAnalysisResult(
      endpoint: WebapiEndpointConstant.downloadChordAnalysisResult,
      queryParams: WebapiQueryParametersConstant.downloadChordAnalysisResult),

  downloadStructureAnalysisResult(
      endpoint: WebapiEndpointConstant.downloadStructureAnalysisResult,
      queryParams:
          WebapiQueryParametersConstant.downloadStructureAnalysisResult),

  downloadLyricAnalysisResult(
      endpoint: WebapiEndpointConstant.downloadLyricAnalysisResult,
      queryParams: null);

  const DownloadJsonType({required this.endpoint, this.queryParams});

  final String endpoint;
  final Map<String, String>? queryParams;
}

enum DownloadAudioFileCategory {
  separatedAudio,
  clickSound,
  chordSound,
}

enum DownloadAudioFileType implements ProcessInterface {
  // パート別音源
  downloadVocalsStem(
      endpoint: WebapiEndpointConstant.downloadStem,
      queryParams: WebapiQueryParametersConstant.downloadVocalsStem,
      saveFileName: AudioFilename.vocals,
      saveDirectoryName: AudioDirectoryName.separatedDirectoryName,
      category: DownloadAudioFileCategory.separatedAudio),
  downloadDrumsStem(
      endpoint: WebapiEndpointConstant.downloadStem,
      queryParams: WebapiQueryParametersConstant.downloadDrumsStem,
      saveFileName: AudioFilename.drums,
      saveDirectoryName: AudioDirectoryName.separatedDirectoryName,
      category: DownloadAudioFileCategory.separatedAudio),
  downloadBassStem(
      endpoint: WebapiEndpointConstant.downloadStem,
      queryParams: WebapiQueryParametersConstant.downloadBassStem,
      saveFileName: AudioFilename.bass,
      saveDirectoryName: AudioDirectoryName.separatedDirectoryName,
      category: DownloadAudioFileCategory.separatedAudio),
  downloadGuitarStem(
      endpoint: WebapiEndpointConstant.downloadStem,
      queryParams: WebapiQueryParametersConstant.downloadGuitarStem,
      saveFileName: AudioFilename.guitar,
      saveDirectoryName: AudioDirectoryName.separatedDirectoryName,
      category: DownloadAudioFileCategory.separatedAudio),
  downloadPianoStem(
      endpoint: WebapiEndpointConstant.downloadStem,
      queryParams: WebapiQueryParametersConstant.downloadPianoStem,
      saveFileName: AudioFilename.piano,
      saveDirectoryName: AudioDirectoryName.separatedDirectoryName,
      category: DownloadAudioFileCategory.separatedAudio),
  downloadOtherStem(
      endpoint: WebapiEndpointConstant.downloadStem,
      queryParams: WebapiQueryParametersConstant.downloadOtherStem,
      saveFileName: AudioFilename.other,
      saveDirectoryName: AudioDirectoryName.separatedDirectoryName,
      category: DownloadAudioFileCategory.separatedAudio),

  // クリック音
  downloadClickSoundNormal(
      endpoint: WebapiEndpointConstant.downloadClickSound,
      queryParams: WebapiQueryParametersConstant.downloadClickSoundNormal,
      saveFileName: AudioFilename.clickSoundNormal,
      saveDirectoryName: AudioDirectoryName.clickSoundDirectoryName,
      category: DownloadAudioFileCategory.clickSound),
  downloadClickSound2x(
      endpoint: WebapiEndpointConstant.downloadClickSound,
      queryParams: WebapiQueryParametersConstant.downloadClickSound2x,
      saveFileName: AudioFilename.clickSound2x,
      saveDirectoryName: AudioDirectoryName.clickSoundDirectoryName,
      category: DownloadAudioFileCategory.clickSound),
  downloadClickSoundHalf(
      endpoint: WebapiEndpointConstant.downloadClickSound,
      queryParams: WebapiQueryParametersConstant.downloadClickSoundHalf,
      saveFileName: AudioFilename.clickSoundHalf,
      saveDirectoryName: AudioDirectoryName.clickSoundDirectoryName,
      category: DownloadAudioFileCategory.clickSound),

  // コード音声
  downloadChordSound(
      endpoint: WebapiEndpointConstant.downloadChordSound,
      queryParams: WebapiQueryParametersConstant.downloadChordSound,
      saveFileName: AudioFilename.chordSound,
      saveDirectoryName: AudioDirectoryName.chordSoundDirectoryName,
      category: DownloadAudioFileCategory.chordSound);

  const DownloadAudioFileType(
      {required this.endpoint,
      this.queryParams,
      required this.saveFileName,
      required this.saveDirectoryName,
      required this.category});

  final String endpoint;
  final Map<String, String>? queryParams;
  final String saveFileName;
  final String saveDirectoryName;
  final DownloadAudioFileCategory category;
}

enum DownloadZipFileType implements ProcessInterface {
  downloadSeparationResult(
      endpoint: WebapiEndpointConstant.downloadSeparationResult,
      saveDirectoryName: AudioDirectoryName.separatedDirectoryName);

  const DownloadZipFileType(
      {required this.endpoint, required this.saveDirectoryName});

  final String endpoint;
  final String saveDirectoryName;
}

enum BulkRemoteJobType implements ProcessInterface {
  analyzeAll(endpoint: WebapiEndpointConstant.analyzeAll, remoteJobTypes: [
    RemoteJobType.chordAnalysis,
    RemoteJobType.separating,
    RemoteJobType.extractingSpectrograms,
    RemoteJobType.structureAnalysis,
    RemoteJobType.lyricAnalysis,
  ]);

  const BulkRemoteJobType(
      {required this.endpoint, required this.remoteJobTypes});

  final String endpoint;
  final List<RemoteJobType> remoteJobTypes;
}

enum RemoteJobType implements ProcessInterface {
  // 楽曲分離処理
  separating(jobName: 'demucs', endpoint: WebapiEndpointConstant.separating),

  // 楽曲分離結果の圧縮
  compression(
      jobName: 'compression', endpoint: WebapiEndpointConstant.compression),

  // コード進行解析処理
  chordAnalysis(
      jobName: 'crema', endpoint: WebapiEndpointConstant.chordAnalysis),

  // スペクトログラム抽出処理
  extractingSpectrograms(
      jobName: 'allin1_spectrograms',
      endpoint: WebapiEndpointConstant.extractingSpectrograms),

  // 音楽構造解析処理
  structureAnalysis(
      jobName: 'allin1_structure',
      endpoint: WebapiEndpointConstant.structureAnalysis),

  // 歌詞解析処理
  lyricAnalysis(
      jobName: 'whisper', endpoint: WebapiEndpointConstant.lyricAnalysis);

  const RemoteJobType({required this.jobName, required this.endpoint});

  final String jobName;
  final String endpoint;

  static RemoteJobType fromJobName(String jobName) {
    return RemoteJobType.values.firstWhere(
      (element) => element.jobName == jobName,
      orElse: () =>
          throw ArgumentError('どのRemoteJobTypeに合致しないjobNameが入力されました: $jobName'),
    );
  }

  static List<RemoteJobType> getJobsFromAndAfter(RemoteJobType startingJob) {
    // startingJob のインデックスを取得
    int startIndex = RemoteJobType.values.indexOf(startingJob);

    // startingJob から最後までのリストを返す
    return RemoteJobType.values.sublist(startIndex);
  }
}
