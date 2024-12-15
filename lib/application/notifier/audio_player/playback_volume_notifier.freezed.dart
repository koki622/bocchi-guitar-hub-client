// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playback_volume_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlaybackVolumeState {
  double get volume => throw _privateConstructorUsedError;
  bool get isSoundOn => throw _privateConstructorUsedError;

  /// Create a copy of PlaybackVolumeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaybackVolumeStateCopyWith<PlaybackVolumeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaybackVolumeStateCopyWith<$Res> {
  factory $PlaybackVolumeStateCopyWith(
          PlaybackVolumeState value, $Res Function(PlaybackVolumeState) then) =
      _$PlaybackVolumeStateCopyWithImpl<$Res, PlaybackVolumeState>;
  @useResult
  $Res call({double volume, bool isSoundOn});
}

/// @nodoc
class _$PlaybackVolumeStateCopyWithImpl<$Res, $Val extends PlaybackVolumeState>
    implements $PlaybackVolumeStateCopyWith<$Res> {
  _$PlaybackVolumeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaybackVolumeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? volume = null,
    Object? isSoundOn = null,
  }) {
    return _then(_value.copyWith(
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      isSoundOn: null == isSoundOn
          ? _value.isSoundOn
          : isSoundOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaybackVolumeStateImplCopyWith<$Res>
    implements $PlaybackVolumeStateCopyWith<$Res> {
  factory _$$PlaybackVolumeStateImplCopyWith(_$PlaybackVolumeStateImpl value,
          $Res Function(_$PlaybackVolumeStateImpl) then) =
      __$$PlaybackVolumeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double volume, bool isSoundOn});
}

/// @nodoc
class __$$PlaybackVolumeStateImplCopyWithImpl<$Res>
    extends _$PlaybackVolumeStateCopyWithImpl<$Res, _$PlaybackVolumeStateImpl>
    implements _$$PlaybackVolumeStateImplCopyWith<$Res> {
  __$$PlaybackVolumeStateImplCopyWithImpl(_$PlaybackVolumeStateImpl _value,
      $Res Function(_$PlaybackVolumeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaybackVolumeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? volume = null,
    Object? isSoundOn = null,
  }) {
    return _then(_$PlaybackVolumeStateImpl(
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      isSoundOn: null == isSoundOn
          ? _value.isSoundOn
          : isSoundOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlaybackVolumeStateImpl implements _PlaybackVolumeState {
  _$PlaybackVolumeStateImpl({required this.volume, required this.isSoundOn});

  @override
  final double volume;
  @override
  final bool isSoundOn;

  @override
  String toString() {
    return 'PlaybackVolumeState(volume: $volume, isSoundOn: $isSoundOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaybackVolumeStateImpl &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.isSoundOn, isSoundOn) ||
                other.isSoundOn == isSoundOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, volume, isSoundOn);

  /// Create a copy of PlaybackVolumeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaybackVolumeStateImplCopyWith<_$PlaybackVolumeStateImpl> get copyWith =>
      __$$PlaybackVolumeStateImplCopyWithImpl<_$PlaybackVolumeStateImpl>(
          this, _$identity);
}

abstract class _PlaybackVolumeState implements PlaybackVolumeState {
  factory _PlaybackVolumeState(
      {required final double volume,
      required final bool isSoundOn}) = _$PlaybackVolumeStateImpl;

  @override
  double get volume;
  @override
  bool get isSoundOn;

  /// Create a copy of PlaybackVolumeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaybackVolumeStateImplCopyWith<_$PlaybackVolumeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
