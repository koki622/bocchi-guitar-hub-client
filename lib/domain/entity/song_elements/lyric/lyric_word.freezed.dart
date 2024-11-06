// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyric_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LyricWord {
  String get word => throw _privateConstructorUsedError;
  double get start => throw _privateConstructorUsedError;
  double get end => throw _privateConstructorUsedError;

  /// Create a copy of LyricWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LyricWordCopyWith<LyricWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricWordCopyWith<$Res> {
  factory $LyricWordCopyWith(LyricWord value, $Res Function(LyricWord) then) =
      _$LyricWordCopyWithImpl<$Res, LyricWord>;
  @useResult
  $Res call({String word, double start, double end});
}

/// @nodoc
class _$LyricWordCopyWithImpl<$Res, $Val extends LyricWord>
    implements $LyricWordCopyWith<$Res> {
  _$LyricWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LyricWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LyricWordImplCopyWith<$Res>
    implements $LyricWordCopyWith<$Res> {
  factory _$$LyricWordImplCopyWith(
          _$LyricWordImpl value, $Res Function(_$LyricWordImpl) then) =
      __$$LyricWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String word, double start, double end});
}

/// @nodoc
class __$$LyricWordImplCopyWithImpl<$Res>
    extends _$LyricWordCopyWithImpl<$Res, _$LyricWordImpl>
    implements _$$LyricWordImplCopyWith<$Res> {
  __$$LyricWordImplCopyWithImpl(
      _$LyricWordImpl _value, $Res Function(_$LyricWordImpl) _then)
      : super(_value, _then);

  /// Create a copy of LyricWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$LyricWordImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$LyricWordImpl implements _LyricWord {
  _$LyricWordImpl({required this.word, required this.start, required this.end});

  @override
  final String word;
  @override
  final double start;
  @override
  final double end;

  @override
  String toString() {
    return 'LyricWord(word: $word, start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricWordImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, word, start, end);

  /// Create a copy of LyricWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricWordImplCopyWith<_$LyricWordImpl> get copyWith =>
      __$$LyricWordImplCopyWithImpl<_$LyricWordImpl>(this, _$identity);
}

abstract class _LyricWord implements LyricWord {
  factory _LyricWord(
      {required final String word,
      required final double start,
      required final double end}) = _$LyricWordImpl;

  @override
  String get word;
  @override
  double get start;
  @override
  double get end;

  /// Create a copy of LyricWord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LyricWordImplCopyWith<_$LyricWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
