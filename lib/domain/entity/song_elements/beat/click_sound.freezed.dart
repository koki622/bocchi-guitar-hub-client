// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'click_sound.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClickSound {
  String get normalClickPath => throw _privateConstructorUsedError;
  String get x2Path => throw _privateConstructorUsedError;
  String get halfPath => throw _privateConstructorUsedError;

  /// Create a copy of ClickSound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClickSoundCopyWith<ClickSound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClickSoundCopyWith<$Res> {
  factory $ClickSoundCopyWith(
          ClickSound value, $Res Function(ClickSound) then) =
      _$ClickSoundCopyWithImpl<$Res, ClickSound>;
  @useResult
  $Res call({String normalClickPath, String x2Path, String halfPath});
}

/// @nodoc
class _$ClickSoundCopyWithImpl<$Res, $Val extends ClickSound>
    implements $ClickSoundCopyWith<$Res> {
  _$ClickSoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClickSound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? normalClickPath = null,
    Object? x2Path = null,
    Object? halfPath = null,
  }) {
    return _then(_value.copyWith(
      normalClickPath: null == normalClickPath
          ? _value.normalClickPath
          : normalClickPath // ignore: cast_nullable_to_non_nullable
              as String,
      x2Path: null == x2Path
          ? _value.x2Path
          : x2Path // ignore: cast_nullable_to_non_nullable
              as String,
      halfPath: null == halfPath
          ? _value.halfPath
          : halfPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClickSoundImplCopyWith<$Res>
    implements $ClickSoundCopyWith<$Res> {
  factory _$$ClickSoundImplCopyWith(
          _$ClickSoundImpl value, $Res Function(_$ClickSoundImpl) then) =
      __$$ClickSoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String normalClickPath, String x2Path, String halfPath});
}

/// @nodoc
class __$$ClickSoundImplCopyWithImpl<$Res>
    extends _$ClickSoundCopyWithImpl<$Res, _$ClickSoundImpl>
    implements _$$ClickSoundImplCopyWith<$Res> {
  __$$ClickSoundImplCopyWithImpl(
      _$ClickSoundImpl _value, $Res Function(_$ClickSoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClickSound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? normalClickPath = null,
    Object? x2Path = null,
    Object? halfPath = null,
  }) {
    return _then(_$ClickSoundImpl(
      normalClickPath: null == normalClickPath
          ? _value.normalClickPath
          : normalClickPath // ignore: cast_nullable_to_non_nullable
              as String,
      x2Path: null == x2Path
          ? _value.x2Path
          : x2Path // ignore: cast_nullable_to_non_nullable
              as String,
      halfPath: null == halfPath
          ? _value.halfPath
          : halfPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ClickSoundImpl implements _ClickSound {
  _$ClickSoundImpl(
      {required this.normalClickPath,
      required this.x2Path,
      required this.halfPath});

  @override
  final String normalClickPath;
  @override
  final String x2Path;
  @override
  final String halfPath;

  @override
  String toString() {
    return 'ClickSound(normalClickPath: $normalClickPath, x2Path: $x2Path, halfPath: $halfPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClickSoundImpl &&
            (identical(other.normalClickPath, normalClickPath) ||
                other.normalClickPath == normalClickPath) &&
            (identical(other.x2Path, x2Path) || other.x2Path == x2Path) &&
            (identical(other.halfPath, halfPath) ||
                other.halfPath == halfPath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, normalClickPath, x2Path, halfPath);

  /// Create a copy of ClickSound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClickSoundImplCopyWith<_$ClickSoundImpl> get copyWith =>
      __$$ClickSoundImplCopyWithImpl<_$ClickSoundImpl>(this, _$identity);
}

abstract class _ClickSound implements ClickSound {
  factory _ClickSound(
      {required final String normalClickPath,
      required final String x2Path,
      required final String halfPath}) = _$ClickSoundImpl;

  @override
  String get normalClickPath;
  @override
  String get x2Path;
  @override
  String get halfPath;

  /// Create a copy of ClickSound
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClickSoundImplCopyWith<_$ClickSoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
