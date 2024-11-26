import 'package:freezed_annotation/freezed_annotation.dart';

part 'chord_sound.freezed.dart';

@freezed
class ChordSound with _$ChordSound {
  factory ChordSound({
    required String filePath,
  }) = _ChordSound;
}
