import 'package:freezed_annotation/freezed_annotation.dart';

part 'click_sound.freezed.dart';

@freezed
class ClickSound with _$ClickSound {
  factory ClickSound({
    required String normalClickPath,
    required String x2Path,
    required String halfPath,
  }) = _ClickSound;
}
