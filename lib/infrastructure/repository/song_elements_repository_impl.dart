import 'dart:io';
import 'package:bocchi_guitar_hub_client/core/constant/reference/separated_audio_filename.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/section/section.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/separated_audio/separated_audio.dart';
import 'package:bocchi_guitar_hub_client/domain/exception.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/separated_audio/separated_audio.dart';
import 'package:path/path.dart' as p;

import 'package:bocchi_guitar_hub_client/core/enum/download_json.dart';
import 'package:bocchi_guitar_hub_client/core/enum/download_zip_file.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/repository/song_elements_repository.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/beat_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/chord_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/lyric_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/section_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/separated_audio_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/webapi/song_webapi.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/analysis_result/chord/chord.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/analysis_result/lyric/lyric.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/analysis_result/structure/structure.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/beat/beat.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/chord/chord.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/lyric/lyric.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/section/section.dart';

class SongElementsRepositoryImpl implements SongElementsRepository {
  final SeparatedAudioHive _separatedAudioHive;
  final ChordsHive _chordsHive;
  final BeatsHive _beatsHive;
  final SectionsHive _sectionsHive;
  final LyricsHive _lyricsHive;
  final SongWebapi _songWebapi;

  SongElementsRepositoryImpl(this._separatedAudioHive, this._chordsHive,
      this._beatsHive, this._sectionsHive, this._lyricsHive, this._songWebapi);

  @override
  Future<void> downloadAndSaveJsonType(
      {required Song song, required DownloadJsonType downloadJsonType}) async {
    var response = await _songWebapi.downloadJson(
        '${downloadJsonType.endpoint}/${song.audioFileId}',
        downloadJsonType.queryParams);

    switch (downloadJsonType) {
      // コードの解析結果の取得と永続化
      case DownloadJsonType.downloadChordAnalysisResult:
        ChordsResponse chordResponse = ChordsResponse.fromJson(response);
        ChordsData chordsData = ChordsData.fromChordsResponse(chordResponse);
        await _chordsHive.create(chordsData, song.songId);
        break;

      // 音楽構造の解析結果の取得と永続化
      case DownloadJsonType.downloadStructureAnalysisResult:
        StructureResponse structureResponse =
            StructureResponse.fromJson(response);
        BeatsData beatsData =
            BeatsData.fromStructureResponse(structureResponse);
        SectionsData sectionsData =
            SectionsData.fromStructureResponse(structureResponse);
        await _beatsHive.create(beatsData, song.songId);
        await _sectionsHive.create(sectionsData, song.songId);
        break;

      // 歌詞の解析結果の取得と永続化
      case DownloadJsonType.downloadLyricAnalysisResult:
        LyricsResponse lyricResponse = LyricsResponse.fromJson(response);
        LyricsData lyricsData = LyricsData.fromLyricsResponse(lyricResponse);
        await _lyricsHive.create(lyricsData, song.songId);
        break;
    }
  }

  @override
  Future<void> downloadAndSaveZipFileType(
      {required Song song,
      required DownloadZipFileType downloadZipFileType}) async {
    switch (downloadZipFileType) {
      case DownloadZipFileType.downloadSeparationResult:
        // 分離された音源を格納するディレクトリを用意
        final separatedAudioDirectory =
            Directory(p.join(song.directoryPath, 'separated'));
        try {
          await separatedAudioDirectory.create();
        } catch (e) {
          throw Exception('ディレクトリの作成処理でエラー発生: $e');
        }
        await _songWebapi.downloadZipFile(
            '${downloadZipFileType.endpoint}/${song.audioFileId}',
            separatedAudioDirectory.path);
        SeparatedAudioData separatedAudioData = SeparatedAudioData(
            vocalsPath: p.join(
                separatedAudioDirectory.path, SeparatedAudioFilename.vocals),
            drumsPath: p.join(
                separatedAudioDirectory.path, SeparatedAudioFilename.drums),
            bassPath: p.join(
                separatedAudioDirectory.path, SeparatedAudioFilename.bass),
            guitarPath: p.join(
                separatedAudioDirectory.path, SeparatedAudioFilename.guitar),
            pianoPath: p.join(
                separatedAudioDirectory.path, SeparatedAudioFilename.piano),
            otherPath: p.join(
                separatedAudioDirectory.path, SeparatedAudioFilename.other));

        // 全ファイルが揃っているか確認
        if (!await separatedAudioData.allFilesExist()) {
          throw Exception('分離ファイルが揃っていません');
        }

        await _separatedAudioHive.create(separatedAudioData, song.songId);
    }
  }

  @override
  Future<void> deleteSongElements({required Song song}) async {
    await _separatedAudioHive.delete(song.songId);
    await _chordsHive.delete(song.songId);
    await _beatsHive.delete(song.songId);
    await _sectionsHive.delete(song.songId);
    await _lyricsHive.delete(song.songId);
  }

  @override
  SeparatedAudio fetchSeparatedAudio({required Song song}) {
    final separatedAudio = _separatedAudioHive.readSeparatedAudio(song.songId);
    if (separatedAudio == null) {
      throw Exception('分離された音声ファイルパスが取得できません');
    }
    return separatedAudio.toEntity();
  }

  @override
  List<Chord> fetchChordList({required Song song}) {
    final chordsData = _chordsHive.readChords(song.songId);
    if (chordsData == null) {
      throw ChordNotFoundException(song.songId);
    }
    return chordsData.toEntityList();
  }

  @override
  List<Beat> fetchBeatList({required Song song}) {
    final beatsData = _beatsHive.readBeats(song.songId);
    if (beatsData == null) {
      throw BeatNotFoundException(song.songId);
    }
    return beatsData.toEntityList();
  }

  @override
  List<Section> fetchSectionList({required Song song}) {
    final sectionsData = _sectionsHive.readSections(song.songId);
    if (sectionsData == null) {
      throw SectionNotFoundException(song.songId);
    }
    return sectionsData.toEntityList();
  }

  @override
  List<Lyric> fetchLyricList({required Song song}) {
    final lyricsData = _lyricsHive.readLyrics(song.songId);
    if (lyricsData == null) {
      throw LyricNotFoundException(song.songId);
    }
    return lyricsData.toEntityList();
  }
}
