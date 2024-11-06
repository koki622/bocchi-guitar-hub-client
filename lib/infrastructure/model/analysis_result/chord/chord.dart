import 'package:freezed_annotation/freezed_annotation.dart';

part 'chord.freezed.dart';
part 'chord.g.dart';

@freezed
class ChordsResponse with _$ChordsResponse {
  const factory ChordsResponse({
    required List<ChordResponse> chords,
  }) = _ChordsResponse;

  factory ChordsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChordsResponseFromJson(json);
}

@freezed
class ChordResponse with _$ChordResponse {
  const factory ChordResponse({
    required double time,
    required double duration,
    required String value,
  }) = _ChordResponse;

  factory ChordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChordResponseFromJson(json);
}
