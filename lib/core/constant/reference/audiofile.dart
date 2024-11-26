class AudioDirectoryName {
  static const separatedDirectoryName = 'separated';
  static const clickSoundDirectoryName = 'click';
  static const chordSoundDirectoryName = 'chord';
}

class AudioFormat {
  static const separatedFormat = 'ogg';
  static const clickSoundFormat = 'ogg';
  static const chordSoundFormat = 'ogg';
}

class AudioFilename {
  // パート別音源のファイル名.
  static const vocals = 'vocals.${AudioFormat.separatedFormat}';
  static const drums = 'drums.${AudioFormat.separatedFormat}';
  static const bass = 'bass.${AudioFormat.separatedFormat}';
  static const guitar = 'guitar.${AudioFormat.separatedFormat}';
  static const piano = 'piano.${AudioFormat.separatedFormat}';
  static const other = 'other_6s.${AudioFormat.separatedFormat}';

  // クリック音のファイル名
  static const clickSoundNormal =
      'clicks_normal.${AudioFormat.clickSoundFormat}';
  static const clickSound2x = 'clicks_2x.${AudioFormat.clickSoundFormat}';
  static const clickSoundHalf = 'clicks_half.${AudioFormat.clickSoundFormat}';

  // コード音声のファイル名
  static const chordSound = 'chord_midi.${AudioFormat.chordSoundFormat}';
}
