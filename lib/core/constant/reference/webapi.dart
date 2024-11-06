class WebapiEndpointConstant {
  static const uploadAudioFile = '/audiofile/';
  static const separating = '/demucs/separated-audio/';
  static const compression = '/demucs/separated-audio/compression/';
  static const chordAnalysis = '/crema/chord/';
  static const extractingSpectrograms = '/allin1/spectrograms/';
  static const structureAnalysis = '/allin1/structure/';
  static const lyricAnalysis = '/whisper/lyric/';
  static const downloadSeparationResult = separating;
  static const downloadChordAnalysisResult = chordAnalysis;
  static const downloadStructureAnalysisResult = structureAnalysis;
  static const downloadLyricAnalysisResult = lyricAnalysis;

  static const deleteAudioFile = '/audiofile/';
}

class WebapiQueryParametersConstant {
  static const downloadChordAnalysisResult = {
    'apply-adjust-chord': 'true',
    'eighth-beat': 'true',
    'download-file-format': 'json'
  };
  static const downloadStructureAnalysisResult = {
    'download-file-format': 'json',
    'eighth-beat': 'true'
  };
}
