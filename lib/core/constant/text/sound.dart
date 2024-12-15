import 'package:bocchi_guitar_hub_client/application/notifier/audio_player/audio_player_notifier.dart';

class SoundNameText {
  static const Map<SoundType, String> soundName = {
    SoundType.vocals: 'ボーカル',
    SoundType.drums: 'ドラム',
    SoundType.bass: 'ベース',
    SoundType.guitar: 'ギター',
    SoundType.piano: 'ピアノ',
    SoundType.other: 'その他',
    SoundType.click: 'クリック音',
    SoundType.chord: 'コード音声',
  };
}
