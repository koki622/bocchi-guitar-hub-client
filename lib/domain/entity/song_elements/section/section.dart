import 'package:freezed_annotation/freezed_annotation.dart';

part 'section.freezed.dart';

@freezed
class Section with _$Section {
  factory Section({
    required String section,
    required double start,
    required double end,
  }) = _Section;
}
