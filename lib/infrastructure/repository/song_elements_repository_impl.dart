import 'dart:io';
import 'package:bocchi_guitar_hub_client/core/constant/reference/audiofile.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/click_sound.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord_sound.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/lyric/lyric.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/section/section.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/separated_audio/separated_audio.dart';
import 'package:bocchi_guitar_hub_client/domain/exception.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/database/click_sound_datasource.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/beat/click_sound.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/separated_audio/separated_audio.dart';
import 'package:path/path.dart' as p;
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
  final ClickSoundHive _clickSoundHive;
  final SongWebapi _songWebapi;

  SongElementsRepositoryImpl(
      this._separatedAudioHive,
      this._chordsHive,
      this._beatsHive,
      this._sectionsHive,
      this._lyricsHive,
      this._clickSoundHive,
      this._songWebapi);

  @override
  Future<void> downloadAndSaveJsonType(
      {required Song song, required DownloadJsonType downloadJsonType}) async {
    final baseUrl = song.destApiServerType.getBaseUrl();
    if (baseUrl == null) throw Exception('NullなbaseUrlが渡されました');
    var response = await _songWebapi.downloadJson(
        baseUrl: baseUrl,
        endpoint: '${downloadJsonType.endpoint}/${song.audioFileId}',
        queryParams: downloadJsonType.queryParams);

    switch (downloadJsonType) {
      // コードの解析結果の取得と永続化
      case DownloadJsonType.downloadChordAnalysisResult:
        ChordsResponse chordResponse = ChordsResponse.fromJson(response);

        // 現在のコードをDBから取得
        ChordsData chordsData =
            _chordsHive.readChords(song.songId) ?? const ChordsData();

        // 現在のデータに追加して保存
        final newChordsData = chordsData.copyWith(
            chords: ChordsData.fromChordsResponse(chordResponse).chords);
        await _chordsHive.create(newChordsData, song.songId);
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
  Future<void> downloadAudioFileType(
      {required Song song,
      required DownloadAudioFileType downloadAudioFileType}) async {
    final baseUrl = song.destApiServerType.getBaseUrl();
    if (baseUrl == null) throw Exception('NullなbaseUrlが渡されました');
    String saveDirectory =
        p.join(song.directoryPath, downloadAudioFileType.saveDirectoryName);
    if (!await Directory(saveDirectory).exists()) {
      // ディレクトリが存在しなければ作成
      try {
        await Directory(saveDirectory).create();
      } catch (e) {
        throw Exception('ディレクトリの作成処理でエラー発生: $e');
      }
    }
    String savedFilePath = await _songWebapi.downloadAudioFile(
        baseUrl: baseUrl,
        endpoint: '${downloadAudioFileType.endpoint}/${song.audioFileId}',
        destinationDir: saveDirectory,
        queryParams: downloadAudioFileType.queryParams,
        saveFileName: downloadAudioFileType.saveFileName);
    if (!await File(savedFilePath).exists()) {
      throw Exception('$savedFilePath が見つかりません.');
    }

    // データベースにファイル情報を書き込む
    await _updateDownloadAudioFilePathToDatabase(
        downloadAudioFileType, savedFilePath, song);
  }

  Future<void> _updateDownloadAudioFilePathToDatabase(
      DownloadAudioFileType downloadAudioFileType,
      String filePath,
      Song song) async {
    switch (downloadAudioFileType.category) {
      case DownloadAudioFileCategory.separatedAudio:
        // 現在のデータを読み込む
        SeparatedAudioData separatedAudioData =
            _separatedAudioHive.readSeparatedAudio(song.songId) ??
                const SeparatedAudioData();
        SeparatedAudioData newSeparatedAudioData;

        if (DownloadAudioFileType.downloadVocalsStem == downloadAudioFileType) {
          newSeparatedAudioData =
              separatedAudioData.copyWith(vocalsPath: filePath);
        } else if (DownloadAudioFileType.downloadDrumsStem ==
            downloadAudioFileType) {
          newSeparatedAudioData =
              separatedAudioData.copyWith(drumsPath: filePath);
        } else if (DownloadAudioFileType.downloadBassStem ==
            downloadAudioFileType) {
          newSeparatedAudioData =
              separatedAudioData.copyWith(bassPath: filePath);
        } else if (DownloadAudioFileType.downloadGuitarStem ==
            downloadAudioFileType) {
          newSeparatedAudioData =
              separatedAudioData.copyWith(guitarPath: filePath);
        } else if (DownloadAudioFileType.downloadPianoStem ==
            downloadAudioFileType) {
          newSeparatedAudioData =
              separatedAudioData.copyWith(pianoPath: filePath);
        } else if (DownloadAudioFileType.downloadOtherStem ==
            downloadAudioFileType) {
          newSeparatedAudioData =
              separatedAudioData.copyWith(otherPath: filePath);
        } else {
          throw Exception('$downloadAudioFileTypeの使用はここで想定されていません.');
        }
        // 更新
        await _separatedAudioHive.create(newSeparatedAudioData, song.songId);

      case DownloadAudioFileCategory.clickSound:
        // 現在のデータを読み込む
        ClickSoundData clickSoundData =
            _clickSoundHive.readClickSound(song.songId) ??
                const ClickSoundData();
        ClickSoundData newClickSoundData;

        if (DownloadAudioFileType.downloadClickSoundNormal ==
            downloadAudioFileType) {
          newClickSoundData =
              clickSoundData.copyWith(normalClickPath: filePath);
        } else if (DownloadAudioFileType.downloadClickSound2x ==
            downloadAudioFileType) {
          newClickSoundData = clickSoundData.copyWith(x2Path: filePath);
        } else if (DownloadAudioFileType.downloadClickSoundHalf ==
            downloadAudioFileType) {
          newClickSoundData = clickSoundData.copyWith(halfPath: filePath);
        } else {
          throw Exception('$downloadAudioFileTypeの使用はここで想定されていません.');
        }
        // 更新
        await _clickSoundHive.create(newClickSoundData, song.songId);

      case DownloadAudioFileCategory.chordSound:
        ChordsData chordsData =
            _chordsHive.readChords(song.songId) ?? const ChordsData();

        final newChordsData = chordsData.copyWith(soundFilePath: filePath);
        await _chordsHive.create(newChordsData, song.songId);
    }
  }

  @override
  Future<void> downloadAndSaveZipFileType(
      {required Song song,
      required DownloadZipFileType downloadZipFileType}) async {
    final baseUrl = song.destApiServerType.getBaseUrl();
    if (baseUrl == null) throw Exception('NullなbaseUrlが渡されました');
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
            baseUrl: baseUrl,
            endpoint: '${downloadZipFileType.endpoint}/${song.audioFileId}',
            destinationDir: separatedAudioDirectory.path);
        SeparatedAudioData separatedAudioData = SeparatedAudioData(
            vocalsPath:
                p.join(separatedAudioDirectory.path, AudioFilename.vocals),
            drumsPath:
                p.join(separatedAudioDirectory.path, AudioFilename.drums),
            bassPath: p.join(separatedAudioDirectory.path, AudioFilename.bass),
            guitarPath:
                p.join(separatedAudioDirectory.path, AudioFilename.guitar),
            pianoPath:
                p.join(separatedAudioDirectory.path, AudioFilename.piano),
            otherPath:
                p.join(separatedAudioDirectory.path, AudioFilename.other));

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
    await _clickSoundHive.delete(song.songId);
  }

  @override
  Future<SeparatedAudio> fetchSeparatedAudio({required Song song}) async {
    final separatedAudio = _separatedAudioHive.readSeparatedAudio(song.songId);
    if (separatedAudio == null) {
      throw Exception('分離された音声ファイルパスが取得できません');
    }
    return await separatedAudio.toEntity();
  }

  @override
  Future<ClickSound> fetchClickSound({required Song song}) async {
    final clickSound = _clickSoundHive.readClickSound(song.songId);
    if (clickSound == null) {
      throw Exception('クリック音が取得できません');
    }
    return await clickSound.toEntity();
  }

  @override
  List<Chord> fetchChordList({required Song song}) {
    final chordsData = _chordsHive.readChords(song.songId);
    if (chordsData == null) {
      throw ChordNotFoundException(song.songId);
    }
    return chordsData.toChordEntityList();
  }

  @override
  Future<ChordSound> fetchChordSound({required Song song}) async {
    final chordSound = _chordsHive.readChords(song.songId);
    if (chordSound == null) {
      throw Exception('コード音声が取得できません');
    }
    return await chordSound.toChordSoundEntity();
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
