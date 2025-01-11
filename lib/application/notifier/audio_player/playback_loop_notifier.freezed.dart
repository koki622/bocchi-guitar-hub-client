// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playback_loop_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlaybackLoopState {
  bool get isLooping => throw _privateConstructorUsedError;
  Duration get loopingStartAt => throw _privateConstructorUsedError;
  Duration get loopingEndAt => throw _privateConstructorUsedError;

  /// Create a copy of PlaybackLoopState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaybackLoopStateCopyWith<PlaybackLoopState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaybackLoopStateCopyWith<$Res> {
  factory $PlaybackLoopStateCopyWith(
          PlaybackLoopState value, $Res Function(PlaybackLoopState) then) =
      _$PlaybackLoopStateCopyWithImpl<$Res, PlaybackLoopState>;
  @useResult
  $Res call({bool isLooping, Duration loopingStartAt, Duration loopingEndAt});
}

/// @nodoc
class _$PlaybackLoopStateCopyWithImpl<$Res, $Val extends PlaybackLoopState>
    implements $PlaybackLoopStateCopyWith<$Res> {
  _$PlaybackLoopStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaybackLoopState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLooping = null,
    Object? loopingStartAt = null,
    Object? loopingEndAt = null,
  }) {
    return _then(_value.copyWith(
      isLooping: null == isLooping
          ? _value.isLooping
          : isLooping // ignore: cast_nullable_to_non_nullable
              as bool,
      loopingStartAt: null == loopingStartAt
          ? _value.loopingStartAt
          : loopingStartAt // ignore: cast_nullable_to_non_nullable
              as Duration,
      loopingEndAt: null == loopingEndAt
          ? _value.loopingEndAt
          : loopingEndAt // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaybackLoopStateImplCopyWith<$Res>
    implements $PlaybackLoopStateCopyWith<$Res> {
  factory _$$PlaybackLoopStateImplCopyWith(_$PlaybackLoopStateImpl value,
          $Res Function(_$PlaybackLoopStateImpl) then) =
      __$$PlaybackLoopStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLooping, Duration loopingStartAt, Duration loopingEndAt});
}

/// @nodoc
class __$$PlaybackLoopStateImplCopyWithImpl<$Res>
    extends _$PlaybackLoopStateCopyWithImpl<$Res, _$PlaybackLoopStateImpl>
    implements _$$PlaybackLoopStateImplCopyWith<$Res> {
  __$$PlaybackLoopStateImplCopyWithImpl(_$PlaybackLoopStateImpl _value,
      $Res Function(_$PlaybackLoopStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaybackLoopState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLooping = null,
    Object? loopingStartAt = null,
    Object? loopingEndAt = null,
  }) {
    return _then(_$PlaybackLoopStateImpl(
      isLooping: null == isLooping
          ? _value.isLooping
          : isLooping // ignore: cast_nullable_to_non_nullable
              as bool,
      loopingStartAt: null == loopingStartAt
          ? _value.loopingStartAt
          : loopingStartAt // ignore: cast_nullable_to_non_nullable
              as Duration,
      loopingEndAt: null == loopingEndAt
          ? _value.loopingEndAt
          : loopingEndAt // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$PlaybackLoopStateImpl implements _PlaybackLoopState {
  _$PlaybackLoopStateImpl(
      {required this.isLooping,
      required this.loopingStartAt,
      required this.loopingEndAt});

  @override
  final bool isLooping;
  @override
  final Duration loopingStartAt;
  @override
  final Duration loopingEndAt;

  @override
  String toString() {
    return 'PlaybackLoopState(isLooping: $isLooping, loopingStartAt: $loopingStartAt, loopingEndAt: $loopingEndAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaybackLoopStateImpl &&
            (identical(other.isLooping, isLooping) ||
                other.isLooping == isLooping) &&
            (identical(other.loopingStartAt, loopingStartAt) ||
                other.loopingStartAt == loopingStartAt) &&
            (identical(other.loopingEndAt, loopingEndAt) ||
                other.loopingEndAt == loopingEndAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLooping, loopingStartAt, loopingEndAt);

  /// Create a copy of PlaybackLoopState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaybackLoopStateImplCopyWith<_$PlaybackLoopStateImpl> get copyWith =>
      __$$PlaybackLoopStateImplCopyWithImpl<_$PlaybackLoopStateImpl>(
          this, _$identity);
}

abstract class _PlaybackLoopState implements PlaybackLoopState {
  factory _PlaybackLoopState(
      {required final bool isLooping,
      required final Duration loopingStartAt,
      required final Duration loopingEndAt}) = _$PlaybackLoopStateImpl;

  @override
  bool get isLooping;
  @override
  Duration get loopingStartAt;
  @override
  Duration get loopingEndAt;

  /// Create a copy of PlaybackLoopState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaybackLoopStateImplCopyWith<_$PlaybackLoopStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
