// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Lyric {
  String get segmentedLyric => throw _privateConstructorUsedError;
  double get start => throw _privateConstructorUsedError;
  double get end => throw _privateConstructorUsedError;
  List<LyricWord> get words => throw _privateConstructorUsedError;

  /// Create a copy of Lyric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LyricCopyWith<Lyric> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricCopyWith<$Res> {
  factory $LyricCopyWith(Lyric value, $Res Function(Lyric) then) =
      _$LyricCopyWithImpl<$Res, Lyric>;
  @useResult
  $Res call(
      {String segmentedLyric, double start, double end, List<LyricWord> words});
}

/// @nodoc
class _$LyricCopyWithImpl<$Res, $Val extends Lyric>
    implements $LyricCopyWith<$Res> {
  _$LyricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lyric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segmentedLyric = null,
    Object? start = null,
    Object? end = null,
    Object? words = null,
  }) {
    return _then(_value.copyWith(
      segmentedLyric: null == segmentedLyric
          ? _value.segmentedLyric
          : segmentedLyric // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<LyricWord>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LyricImplCopyWith<$Res> implements $LyricCopyWith<$Res> {
  factory _$$LyricImplCopyWith(
          _$LyricImpl value, $Res Function(_$LyricImpl) then) =
      __$$LyricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String segmentedLyric, double start, double end, List<LyricWord> words});
}

/// @nodoc
class __$$LyricImplCopyWithImpl<$Res>
    extends _$LyricCopyWithImpl<$Res, _$LyricImpl>
    implements _$$LyricImplCopyWith<$Res> {
  __$$LyricImplCopyWithImpl(
      _$LyricImpl _value, $Res Function(_$LyricImpl) _then)
      : super(_value, _then);

  /// Create a copy of Lyric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segmentedLyric = null,
    Object? start = null,
    Object? end = null,
    Object? words = null,
  }) {
    return _then(_$LyricImpl(
      segmentedLyric: null == segmentedLyric
          ? _value.segmentedLyric
          : segmentedLyric // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<LyricWord>,
    ));
  }
}

/// @nodoc

class _$LyricImpl implements _Lyric {
  _$LyricImpl(
      {required this.segmentedLyric,
      required this.start,
      required this.end,
      required final List<LyricWord> words})
      : _words = words;

  @override
  final String segmentedLyric;
  @override
  final double start;
  @override
  final double end;
  final List<LyricWord> _words;
  @override
  List<LyricWord> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  String toString() {
    return 'Lyric(segmentedLyric: $segmentedLyric, start: $start, end: $end, words: $words)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricImpl &&
            (identical(other.segmentedLyric, segmentedLyric) ||
                other.segmentedLyric == segmentedLyric) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @override
  int get hashCode => Object.hash(runtimeType, segmentedLyric, start, end,
      const DeepCollectionEquality().hash(_words));

  /// Create a copy of Lyric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricImplCopyWith<_$LyricImpl> get copyWith =>
      __$$LyricImplCopyWithImpl<_$LyricImpl>(this, _$identity);
}

abstract class _Lyric implements Lyric {
  factory _Lyric(
      {required final String segmentedLyric,
      required final double start,
      required final double end,
      required final List<LyricWord> words}) = _$LyricImpl;

  @override
  String get segmentedLyric;
  @override
  double get start;
  @override
  double get end;
  @override
  List<LyricWord> get words;

  /// Create a copy of Lyric
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LyricImplCopyWith<_$LyricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
