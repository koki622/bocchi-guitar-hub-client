import 'package:bocchi_guitar_hub_client/core/constant/reference/audiofile.dart';

class WebapiEndpointConstant {
  // オーディオファイルアップロード
  static const uploadAudioFile = '/audiofile/';

  // 全ての音楽要素を解析
  static const analyzeAll = '/async-job/process-audio/';

  // 音声分離
  static const separating = '/demucs/separated-audio/';

  // 音声分離結果の圧縮
  static const compression = '/demucs/separated-audio/compression/';

  // コード解析
  static const chordAnalysis = '/crema/chord/';

  // スペクトログラム抽出
  static const extractingSpectrograms = '/allin1/spectrograms/';

  // 音楽構造解析
  static const structureAnalysis = '/allin1/structure/';

  // 歌詞解析
  static const lyricAnalysis = '/whisper/lyric/';

  // 音声分離結果のステム単体ダウンロード
  static const downloadStem = '${separating}stem/';

  // 音声分離結果Zipファイルのダウンロード
  static const downloadSeparationResult = separating;

  // クリック音のダウンロード
  static const downloadClickSound = '${structureAnalysis}click-sound/';

  // コード解析結果のダウンロード
  static const downloadChordAnalysisResult = chordAnalysis;

  // コード解析結果音声のダウンロード
  static const downloadChordSound = chordAnalysis;

  // 音楽構造解析結果のダウンロード
  static const downloadStructureAnalysisResult = structureAnalysis;

  // 歌詞解析結果のダウンロード
  static const downloadLyricAnalysisResult = lyricAnalysis;

  // オーディオファイルの削除
  static const deleteAudioFile = '/audiofile/';

  // リモートジョブに再接続
  static const reconnectRemoteJob = '/async-job/status';

  // サーバーステータスを確認
  static const checkServerStatus = '/util/server-status';
}

class WebapiQueryParametersConstant {
  static const downloadVocalsStem = {
    'stem': 'vocals',
    'format': AudioFormat.separatedFormat,
  };

  static const downloadDrumsStem = {
    'stem': 'drums',
    'format': AudioFormat.separatedFormat,
  };

  static const downloadBassStem = {
    'stem': 'bass',
    'format': AudioFormat.separatedFormat,
  };

  static const downloadGuitarStem = {
    'stem': 'guitar',
    'format': AudioFormat.separatedFormat,
  };

  static const downloadPianoStem = {
    'stem': 'piano',
    'format': AudioFormat.separatedFormat,
  };

  static const downloadOtherStem = {
    'stem': 'other',
    'format': AudioFormat.separatedFormat,
  };

  static const downloadClickSoundNormal = {
    'click-sound-type': 'normal',
    'format': AudioFormat.clickSoundFormat,
  };

  static const downloadClickSound2x = {
    'click-sound-type': '2x',
    'format': AudioFormat.clickSoundFormat,
  };

  static const downloadClickSoundHalf = {
    'click-sound-type': 'half',
    'format': AudioFormat.clickSoundFormat,
  };

  static const downloadChordSound = {
    'apply-adjust-chord': 'true',
    'eighth-beat': 'false',
    'download-file-format': AudioFormat.chordSoundFormat,
    'gm-program-no': '25',
  };

  static const downloadChordAnalysisResult = {
    'apply-adjust-chord': 'true',
    'eighth-beat': 'false',
    'download-file-format': 'json'
  };
  static const downloadStructureAnalysisResult = {
    'download-file-format': 'json',
    'eighth-beat': 'false'
  };
}
