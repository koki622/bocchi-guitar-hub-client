import 'package:freezed_annotation/freezed_annotation.dart';

part 'structure.freezed.dart';
part 'structure.g.dart';

@freezed
class StructureResponse with _$StructureResponse {
  const factory StructureResponse({
    @JsonKey(name: 'bpm') required int bpm,
    @JsonKey(name: 'beats') required List<double> beats,
    @JsonKey(name: 'beat_positions') required List<double> beatPositions,
    @JsonKey(name: 'segments') required List<SegmentResponse> segments,
  }) = _StructureResponse;

  factory StructureResponse.fromJson(Map<String, dynamic> json) =>
      _$StructureResponseFromJson(json);
}

@freezed
class SegmentResponse with _$SegmentResponse {
  const factory SegmentResponse({
    required double start,
    required double end,
    required String label,
  }) = _SegmentResponse;

  factory SegmentResponse.fromJson(Map<String, dynamic> json) =>
      _$SegmentResponseFromJson(json);
}
