import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/click_sound.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord_sound.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/section/section.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/separated_audio/separated_audio.dart';

abstract interface class SongElementsRepository {
  // Json形式をWeb APIからダウンロードして永続化
  Future<void> downloadAndSaveJsonType(
      {required Song song, required DownloadJsonType downloadJsonType});

  // 音声ファイルをダウンロードしてSongのディレクトリパスに保存
  Future<void> downloadAudioFileType(
      {required Song song,
      required DownloadAudioFileType downloadAudioFileType});

  // Zip形式をWeb APIからダウンロードしてSongのディレクトリパスに保存
  Future<void> downloadAndSaveZipFileType(
      {required Song song, required DownloadZipFileType downloadZipFileType});

  Future<void> deleteSongElements({required Song song});

  Future<SeparatedAudio> fetchSeparatedAudio({required Song song});

  Future<ClickSound> fetchClickSound({required Song song});

  Future<ChordSound> fetchChordSound({required Song song});

  List<Chord> fetchChordList({required Song song});

  List<Beat> fetchBeatList({required Song song});

  List<Section> fetchSectionList({required Song song});

  List<Lyric> fetchLyricList({required Song song});
}
