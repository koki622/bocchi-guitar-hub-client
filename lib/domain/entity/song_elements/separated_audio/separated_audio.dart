import 'package:freezed_annotation/freezed_annotation.dart';

part 'separated_audio.freezed.dart';

@freezed
class SeparatedAudio with _$SeparatedAudio {
  factory SeparatedAudio({
    required String vocalsPath,
    required String drumsPath,
    required String bassPath,
    required String guitarPath,
    required String pianoPath,
    required String otherPath,
  }) = _SeparatedAudio;
}
