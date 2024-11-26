// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chord_sound.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChordSound {
  String get filePath => throw _privateConstructorUsedError;

  /// Create a copy of ChordSound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChordSoundCopyWith<ChordSound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChordSoundCopyWith<$Res> {
  factory $ChordSoundCopyWith(
          ChordSound value, $Res Function(ChordSound) then) =
      _$ChordSoundCopyWithImpl<$Res, ChordSound>;
  @useResult
  $Res call({String filePath});
}

/// @nodoc
class _$ChordSoundCopyWithImpl<$Res, $Val extends ChordSound>
    implements $ChordSoundCopyWith<$Res> {
  _$ChordSoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChordSound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_value.copyWith(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChordSoundImplCopyWith<$Res>
    implements $ChordSoundCopyWith<$Res> {
  factory _$$ChordSoundImplCopyWith(
          _$ChordSoundImpl value, $Res Function(_$ChordSoundImpl) then) =
      __$$ChordSoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String filePath});
}

/// @nodoc
class __$$ChordSoundImplCopyWithImpl<$Res>
    extends _$ChordSoundCopyWithImpl<$Res, _$ChordSoundImpl>
    implements _$$ChordSoundImplCopyWith<$Res> {
  __$$ChordSoundImplCopyWithImpl(
      _$ChordSoundImpl _value, $Res Function(_$ChordSoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChordSound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_$ChordSoundImpl(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChordSoundImpl implements _ChordSound {
  _$ChordSoundImpl({required this.filePath});

  @override
  final String filePath;

  @override
  String toString() {
    return 'ChordSound(filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChordSoundImpl &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath);

  /// Create a copy of ChordSound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChordSoundImplCopyWith<_$ChordSoundImpl> get copyWith =>
      __$$ChordSoundImplCopyWithImpl<_$ChordSoundImpl>(this, _$identity);
}

abstract class _ChordSound implements ChordSound {
  factory _ChordSound({required final String filePath}) = _$ChordSoundImpl;

  @override
  String get filePath;

  /// Create a copy of ChordSound
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChordSoundImplCopyWith<_$ChordSoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
