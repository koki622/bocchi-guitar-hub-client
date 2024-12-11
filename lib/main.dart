import 'package:bocchi_guitar_hub_client/core/init/hive_initializer.dart';
import 'package:bocchi_guitar_hub_client/presentation/router/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.init();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}



    /**
    final chord = {
      'frets': [1, 3, 3, 2, 1, 1],
      'fingers': [1, 3, 4, 2, 1, 1],
      'barres': [1],
      'capo': false,
      'baseFret': 1,
    };
    final test_chord = {
      'chord_name': "Cmajb5/C#",
      "positions": ["x", "4", "4", "5", "5", "x"],
      "fingerings": [
        ["0", "1", "1", "2", "4", "0"]
      ]
    };

    final instrument = {
      'strings': 6,
      'fretsOnChord': 4,
      'name': 'Guitar',
      'keys': [],
      'tunings': {
        'standard': ['E', 'A', 'D', 'G', 'B', 'E']
      }
    };
     * 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ギターコード'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // FlutterGuitarChordのサイズを小さく表示するためにContainerでラップ
            Container(
              width: 250, // 幅を指定
              height: 250, // 高さを指定
              child: FlutterGuitarChord(
                baseFret: 1,
                chordName: 'C',
                fingers: '0 3 2 0 1 0',
                frets: '-1 3 2 0 1 0',
                totalString: 6,
                fingerSize: 32,
                barCount: 5,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 250,
              height: 250,
              child: FlutterGuitarChord(
                baseFret: 1,
                chordName: 'G Major',
                fingers: '3 2 0 0 0 4',
                frets: '3 2 0 0 0 3',
                totalString: 6,
                barCount: 5,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 250,
              height: 250,
              child: FlutterGuitarChord(
                baseFret: 4,
                chordName: 'B/D#',
                fingers: '-1 4 1 1 1 -1',
                frets: '-1 3 1 1 1 -1',
                totalString: 6,
                barCount: 5,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 250,
              height: 250,
              child: FlutterGuitarChord(
                baseFret: 1,
                chordName: 'F',
                fingers: '1 1 2 3 4 1',
                frets: '1 1 2 3 2 1',
                totalString: 6,
              ),
            ),
          ],
        ),
      ),
    );
     */



