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
mixin _$ClickSoundData {
  @HiveField(0)
  String? get normalClickPath => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get x2Path => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get halfPath => throw _privateConstructorUsedError;

  /// Create a copy of ClickSoundData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClickSoundDataCopyWith<ClickSoundData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClickSoundDataCopyWith<$Res> {
  factory $ClickSoundDataCopyWith(
          ClickSoundData value, $Res Function(ClickSoundData) then) =
      _$ClickSoundDataCopyWithImpl<$Res, ClickSoundData>;
  @useResult
  $Res call(
      {@HiveField(0) String? normalClickPath,
      @HiveField(1) String? x2Path,
      @HiveField(2) String? halfPath});
}

/// @nodoc
class _$ClickSoundDataCopyWithImpl<$Res, $Val extends ClickSoundData>
    implements $ClickSoundDataCopyWith<$Res> {
  _$ClickSoundDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClickSoundData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? normalClickPath = freezed,
    Object? x2Path = freezed,
    Object? halfPath = freezed,
  }) {
    return _then(_value.copyWith(
      normalClickPath: freezed == normalClickPath
          ? _value.normalClickPath
          : normalClickPath // ignore: cast_nullable_to_non_nullable
              as String?,
      x2Path: freezed == x2Path
          ? _value.x2Path
          : x2Path // ignore: cast_nullable_to_non_nullable
              as String?,
      halfPath: freezed == halfPath
          ? _value.halfPath
          : halfPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClicksoundDataImplCopyWith<$Res>
    implements $ClickSoundDataCopyWith<$Res> {
  factory _$$ClicksoundDataImplCopyWith(_$ClicksoundDataImpl value,
          $Res Function(_$ClicksoundDataImpl) then) =
      __$$ClicksoundDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? normalClickPath,
      @HiveField(1) String? x2Path,
      @HiveField(2) String? halfPath});
}

/// @nodoc
class __$$ClicksoundDataImplCopyWithImpl<$Res>
    extends _$ClickSoundDataCopyWithImpl<$Res, _$ClicksoundDataImpl>
    implements _$$ClicksoundDataImplCopyWith<$Res> {
  __$$ClicksoundDataImplCopyWithImpl(
      _$ClicksoundDataImpl _value, $Res Function(_$ClicksoundDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClickSoundData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? normalClickPath = freezed,
    Object? x2Path = freezed,
    Object? halfPath = freezed,
  }) {
    return _then(_$ClicksoundDataImpl(
      normalClickPath: freezed == normalClickPath
          ? _value.normalClickPath
          : normalClickPath // ignore: cast_nullable_to_non_nullable
              as String?,
      x2Path: freezed == x2Path
          ? _value.x2Path
          : x2Path // ignore: cast_nullable_to_non_nullable
              as String?,
      halfPath: freezed == halfPath
          ? _value.halfPath
          : halfPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: HiveBoxConstant.clickSoundBoxTypeId)
class _$ClicksoundDataImpl implements _ClicksoundData {
  const _$ClicksoundDataImpl(
      {@HiveField(0) this.normalClickPath,
      @HiveField(1) this.x2Path,
      @HiveField(2) this.halfPath});

  @override
  @HiveField(0)
  final String? normalClickPath;
  @override
  @HiveField(1)
  final String? x2Path;
  @override
  @HiveField(2)
  final String? halfPath;

  @override
  String toString() {
    return 'ClickSoundData(normalClickPath: $normalClickPath, x2Path: $x2Path, halfPath: $halfPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClicksoundDataImpl &&
            (identical(other.normalClickPath, normalClickPath) ||
                other.normalClickPath == normalClickPath) &&
            (identical(other.x2Path, x2Path) || other.x2Path == x2Path) &&
            (identical(other.halfPath, halfPath) ||
                other.halfPath == halfPath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, normalClickPath, x2Path, halfPath);

  /// Create a copy of ClickSoundData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClicksoundDataImplCopyWith<_$ClicksoundDataImpl> get copyWith =>
      __$$ClicksoundDataImplCopyWithImpl<_$ClicksoundDataImpl>(
          this, _$identity);
}

abstract class _ClicksoundData implements ClickSoundData {
  const factory _ClicksoundData(
      {@HiveField(0) final String? normalClickPath,
      @HiveField(1) final String? x2Path,
      @HiveField(2) final String? halfPath}) = _$ClicksoundDataImpl;

  @override
  @HiveField(0)
  String? get normalClickPath;
  @override
  @HiveField(1)
  String? get x2Path;
  @override
  @HiveField(2)
  String? get halfPath;

  /// Create a copy of ClickSoundData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClicksoundDataImplCopyWith<_$ClicksoundDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
