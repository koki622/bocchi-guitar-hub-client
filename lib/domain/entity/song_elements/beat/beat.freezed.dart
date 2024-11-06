// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Beat {
  double get beatPosition => throw _privateConstructorUsedError;
  double get beatTime => throw _privateConstructorUsedError;

  /// Create a copy of Beat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BeatCopyWith<Beat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeatCopyWith<$Res> {
  factory $BeatCopyWith(Beat value, $Res Function(Beat) then) =
      _$BeatCopyWithImpl<$Res, Beat>;
  @useResult
  $Res call({double beatPosition, double beatTime});
}

/// @nodoc
class _$BeatCopyWithImpl<$Res, $Val extends Beat>
    implements $BeatCopyWith<$Res> {
  _$BeatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Beat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beatPosition = null,
    Object? beatTime = null,
  }) {
    return _then(_value.copyWith(
      beatPosition: null == beatPosition
          ? _value.beatPosition
          : beatPosition // ignore: cast_nullable_to_non_nullable
              as double,
      beatTime: null == beatTime
          ? _value.beatTime
          : beatTime // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeatImplCopyWith<$Res> implements $BeatCopyWith<$Res> {
  factory _$$BeatImplCopyWith(
          _$BeatImpl value, $Res Function(_$BeatImpl) then) =
      __$$BeatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double beatPosition, double beatTime});
}

/// @nodoc
class __$$BeatImplCopyWithImpl<$Res>
    extends _$BeatCopyWithImpl<$Res, _$BeatImpl>
    implements _$$BeatImplCopyWith<$Res> {
  __$$BeatImplCopyWithImpl(_$BeatImpl _value, $Res Function(_$BeatImpl) _then)
      : super(_value, _then);

  /// Create a copy of Beat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beatPosition = null,
    Object? beatTime = null,
  }) {
    return _then(_$BeatImpl(
      beatPosition: null == beatPosition
          ? _value.beatPosition
          : beatPosition // ignore: cast_nullable_to_non_nullable
              as double,
      beatTime: null == beatTime
          ? _value.beatTime
          : beatTime // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$BeatImpl implements _Beat {
  _$BeatImpl({required this.beatPosition, required this.beatTime});

  @override
  final double beatPosition;
  @override
  final double beatTime;

  @override
  String toString() {
    return 'Beat(beatPosition: $beatPosition, beatTime: $beatTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeatImpl &&
            (identical(other.beatPosition, beatPosition) ||
                other.beatPosition == beatPosition) &&
            (identical(other.beatTime, beatTime) ||
                other.beatTime == beatTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beatPosition, beatTime);

  /// Create a copy of Beat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BeatImplCopyWith<_$BeatImpl> get copyWith =>
      __$$BeatImplCopyWithImpl<_$BeatImpl>(this, _$identity);
}

abstract class _Beat implements Beat {
  factory _Beat(
      {required final double beatPosition,
      required final double beatTime}) = _$BeatImpl;

  @override
  double get beatPosition;
  @override
  double get beatTime;

  /// Create a copy of Beat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BeatImplCopyWith<_$BeatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
