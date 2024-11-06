import 'package:freezed_annotation/freezed_annotation.dart';

part 'beat.freezed.dart';

@freezed
class Beat with _$Beat {
  factory Beat({
    required double beatPosition,
    required double beatTime,
  }) = _Beat;
}
