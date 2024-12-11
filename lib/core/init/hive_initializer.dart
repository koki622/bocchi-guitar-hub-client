import 'package:bocchi_guitar_hub_client/core/constant/reference/hive_box.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/remote_job/job_status.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song/song.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/beat/beat.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/beat/click_sound.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/chord/chord.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/lyric/lyric.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/section/section.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/separated_audio/separated_audio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveInitializer {
  // Hiveの初期化
  static Future<void> init() async {
    // アプリケーションサポートディレクトリの取得とHiveの初期化
    final appSupportDir = await getApplicationSupportDirectory();
    await Hive.initFlutter(appSupportDir.path);

    // アダプターの登録
    _registerAdapters();

    // ボックスを開く
    await _openBoxes();
  }

  static void _registerAdapters() {
    Hive.registerAdapter(SongDataImplAdapter());
    Hive.registerAdapter(JobStatusDataImplAdapter());
    Hive.registerAdapter(SeparatedAudioDataImplAdapter());
    Hive.registerAdapter(ChordsDataImplAdapter());
    Hive.registerAdapter(ChordDataAdapter());
    Hive.registerAdapter(BeatsDataImplAdapter());
    Hive.registerAdapter(BeatDataAdapter());
    Hive.registerAdapter(SectionsDataImplAdapter());
    Hive.registerAdapter(SectionDataAdapter());
    Hive.registerAdapter(LyricsDataImplAdapter());
    Hive.registerAdapter(LyricDataAdapter());
    Hive.registerAdapter(LyricWordDataAdapter());
    Hive.registerAdapter(ClicksoundDataImplAdapter());
  }

  static Future<void> _openBoxes() async {
    await Hive.openBox<SongData>(HiveBoxConstant.songBoxName);
    await Hive.openBox<JobStatusData>(HiveBoxConstant.jobStatusBoxName);
    await Hive.openBox<SeparatedAudioData>(
        HiveBoxConstant.separatedAudioBoxName);
    await Hive.openBox<ChordsData>(HiveBoxConstant.chordsBoxName);
    await Hive.openBox<BeatsData>(HiveBoxConstant.beatsBoxName);
    await Hive.openBox<SectionsData>(HiveBoxConstant.sectionsBoxName);
    await Hive.openBox<LyricsData>(HiveBoxConstant.lyricsBoxName);
    await Hive.openBox<ClickSoundData>(HiveBoxConstant.clickSoundBoxName);
  }
}
