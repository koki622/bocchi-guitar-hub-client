import 'dart:io';

import 'package:bocchi_guitar_hub_client/infrastructure/model/remote_job/job_status.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song/song.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/beat/beat.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/beat/click_sound.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/chord/chord.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/lyric/lyric.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/section/section.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/song_elements/separated_audio/separated_audio.dart';
import 'package:bocchi_guitar_hub_client/presentation/test_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'core/constant/reference/hive_box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appSupportDir = await getApplicationSupportDirectory();
  await Hive.initFlutter(appSupportDir.path);
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
  await Hive.openBox<SongData>(HiveBoxConstant.songBoxName);
  await Hive.openBox<JobStatusData>(HiveBoxConstant.jobStatusBoxName);
  await Hive.openBox<SeparatedAudioData>(HiveBoxConstant.separatedAudioBoxName);
  await Hive.openBox<ChordsData>(HiveBoxConstant.chordsBoxName);
  await Hive.openBox<BeatsData>(HiveBoxConstant.beatsBoxName);
  await Hive.openBox<SectionsData>(HiveBoxConstant.sectionsBoxName);
  await Hive.openBox<LyricsData>(HiveBoxConstant.lyricsBoxName);
  await Hive.openBox<ClickSoundData>(HiveBoxConstant.clickSoundBoxName);

  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ファイルピッカーサンプル',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: FilePickerScreen(), // ファイルピッカー画面を指定
      home: TestListView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
