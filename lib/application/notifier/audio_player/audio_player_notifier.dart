import 'dart:async';

import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/playback_volume_notifier.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/click_sound.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/chord/chord_sound.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/separated_audio/separated_audio.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/infrastructure_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_player_notifier.g.dart';

class AudioPlayerState {
  final Duration totalDuration;
  final SoLoud soloud;
  final SoundState soundState;

  AudioPlayerState({
    required this.totalDuration,
    required this.soloud,
    required this.soundState,
  });
}

@riverpod
Future<AudioPlayerState> audioPlayer(
    Ref ref, Song song, Map<SoundType, PlaybackVolumeState> initVolumes) async {
  final soloud = SoLoud.instance;

  await soloud.init(bufferSize: 512);
  final separatedAudio = await ref
      .watch(songElementsRepositoryProvider)
      .fetchSeparatedAudio(song: song);
  final clickSound = await ref
      .watch(songElementsRepositoryProvider)
      .fetchClickSound(song: song);
  final chordSound = await ref
      .watch(songElementsRepositoryProvider)
      .fetchChordSound(song: song);

  // 音声のロード処理
  final soundState = SoundState();
  await soundState.initialize(
      separatedAudio, clickSound, chordSound, soloud, initVolumes);

  // 音声の長さを取得
  final totalDuration =
      soloud.getLength(soundState.audioSources[SoundType.vocals]!);

  // dispose処理
  ref.onDispose(() {
    soloud.disposeAllSources();
  });

  return AudioPlayerState(
      totalDuration: totalDuration, soloud: soloud, soundState: soundState);
}

enum SoundType {
  vocals,
  drums,
  bass,
  guitar,
  piano,
  other,
  click,
  chord,
}

class SoundState {
  // オーディオソース
  late final Map<SoundType, AudioSource> audioSources;

  // ハンドル
  Map<SoundType, SoundHandle> soundHandles = {};

  // 全てを取りまとめるハンドル
  late SoundHandle groupHandle;

  // まとめて音源ハンドルを初期化する静的メソッド
  Future<void> initialize(
    SeparatedAudio separatedAudio,
    ClickSound clickSound,
    ChordSound chordSound,
    SoLoud soloudInstance,
    Map<SoundType, PlaybackVolumeState> initVolumes,
  ) async {
    // 全ての音声をロード
    audioSources = {
      SoundType.vocals: await soloudInstance.loadFile(separatedAudio.vocalsPath,
          mode: LoadMode.disk),
      SoundType.drums: await soloudInstance.loadFile(separatedAudio.drumsPath,
          mode: LoadMode.disk),
      SoundType.bass: await soloudInstance.loadFile(separatedAudio.bassPath,
          mode: LoadMode.disk),
      SoundType.guitar: await soloudInstance.loadFile(separatedAudio.guitarPath,
          mode: LoadMode.disk),
      SoundType.piano: await soloudInstance.loadFile(separatedAudio.pianoPath,
          mode: LoadMode.disk),
      SoundType.other: await soloudInstance.loadFile(separatedAudio.otherPath,
          mode: LoadMode.disk),
      SoundType.click: await soloudInstance.loadFile(clickSound.normalClickPath,
          mode: LoadMode.disk),
      SoundType.chord: await soloudInstance.loadFile(chordSound.filePath,
          mode: LoadMode.disk),
    };

    await _preparePlay(
        soloudInstance: soloudInstance, initVolumes: initVolumes);
  }

  Future<void> _preparePlay(
      {required SoLoud soloudInstance,
      required Map<SoundType, PlaybackVolumeState> initVolumes,
      bool paused = true}) async {
    for (var entry in audioSources.entries) {
      final soundType = entry.key;
      final audioSource = entry.value;
      final playbackVolumeState = initVolumes[soundType]!;
      soundHandles[soundType] = await soloudInstance.play(audioSource,
          volume:
              playbackVolumeState.isSoundOn ? playbackVolumeState.volume : 0.0,
          paused: paused);
    }

    // ボイスグループを作成
    groupHandle = soloudInstance.createVoiceGroup();
    soloudInstance.addVoicesToGroup(groupHandle, soundHandles.values.toList());
  }

  Future<void> resetPlayer(
      {required SoLoud soloudInstance,
      required Map<SoundType, PlaybackVolumeState> initVolumes,
      bool paused = true}) async {
    soloudInstance.destroyVoiceGroup(groupHandle);
    await _preparePlay(
        soloudInstance: soloudInstance,
        initVolumes: initVolumes,
        paused: paused);
  }

  StreamSubscription setupSoundEventsListener({
    required void Function(StreamSoundEvent eventResult) onEvent,
  }) {
    return audioSources[SoundType.vocals]!.soundEvents.listen((eventResult) {
      onEvent(eventResult);
    });
  }
}
