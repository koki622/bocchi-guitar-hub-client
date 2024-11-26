/**
 * 
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/separated_audio/separated_audio.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PracticeSong extends StatefulWidget {
  final Song song;

  MultiTrackPlayer({required this.song});

  @override
  _MultiTrackPlayerState createState() => _MultiTrackPlayerState();
}

class _MultiTrackPlayerState extends State<MultiTrackPlayer> {
  late AudioPlayer vocalsPlayer;
  late AudioPlayer drumsPlayer;
  late AudioPlayer bassPlayer;
  late AudioPlayer guitarPlayer;
  late AudioPlayer pianoPlayer;
  late AudioPlayer otherPlayer;

  @override
  void initState() {
    super.initState();
    vocalsPlayer = AudioPlayer();
    drumsPlayer = AudioPlayer();
    bassPlayer = AudioPlayer();
    guitarPlayer = AudioPlayer();
    pianoPlayer = AudioPlayer();
    otherPlayer = AudioPlayer();

    // 各プレイヤーに音源パスをセット
    _initializePlayers();
  }

  Future<void> _initializePlayers() async {
    await vocalsPlayer.setFilePath(widget.separatedAudio.vocalsPath);
    await drumsPlayer.setFilePath(widget.separatedAudio.drumsPath);
    await bassPlayer.setFilePath(widget.separatedAudio.bassPath);
    await guitarPlayer.setFilePath(widget.separatedAudio.guitarPath);
    await pianoPlayer.setFilePath(widget.separatedAudio.pianoPath);
    await otherPlayer.setFilePath(widget.separatedAudio.otherPath);
  }

  Future<void> _playAll() async {
    await Future.wait([
      vocalsPlayer.play(),
      drumsPlayer.play(),
      bassPlayer.play(),
      guitarPlayer.play(),
      pianoPlayer.play(),
      otherPlayer.play(),
    ]);
  }

  Future<void> _pauseAll() async {
    await Future.wait([
      vocalsPlayer.pause(),
      drumsPlayer.pause(),
      bassPlayer.pause(),
      guitarPlayer.pause(),
      pianoPlayer.pause(),
      otherPlayer.pause(),
    ]);
  }

  Future<void> _stopAll() async {
    await Future.wait([
      vocalsPlayer.stop(),
      drumsPlayer.stop(),
      bassPlayer.stop(),
      guitarPlayer.stop(),
      pianoPlayer.stop(),
      otherPlayer.stop(),
    ]);
  }

  @override
  void dispose() {
    vocalsPlayer.dispose();
    drumsPlayer.dispose();
    bassPlayer.dispose();
    guitarPlayer.dispose();
    pianoPlayer.dispose();
    otherPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-track Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _playAll,
              child: Text('Play All'),
            ),
            ElevatedButton(
              onPressed: _pauseAll,
              child: Text('Pause All'),
            ),
            ElevatedButton(
              onPressed: _stopAll,
              child: Text('Stop All'),
            ),
            SizedBox(height: 20),
            _buildVolumeSlider('Vocals', vocalsPlayer),
            _buildVolumeSlider('Drums', drumsPlayer),
            _buildVolumeSlider('Bass', bassPlayer),
            _buildVolumeSlider('Guitar', guitarPlayer),
            _buildVolumeSlider('Piano', pianoPlayer),
            _buildVolumeSlider('Other', otherPlayer),
          ],
        ),
      ),
    );
  }

  Widget _buildVolumeSlider(String label, AudioPlayer player) {
    return Column(
      children: [
        Text(label),
        Slider(
          min: 0.0,
          max: 1.0,
          value: player.volume,
          onChanged: (value) {
            setState(() {
              player.setVolume(value);
            });
          },
          label: "$label Volume",
        ),
      ],
    );
  }
}

 */