import 'package:freezed_annotation/freezed_annotation.dart';

part 'chord.freezed.dart';

@freezed
class Chord with _$Chord {
  factory Chord({
    required String chord,
    required double time,
    required double duration,
  }) = _Chord;
}
