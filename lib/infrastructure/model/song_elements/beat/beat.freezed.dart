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
mixin _$BeatsData {
  @HiveField(0)
  List<BeatData> get beats => throw _privateConstructorUsedError;

  /// Create a copy of BeatsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BeatsDataCopyWith<BeatsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeatsDataCopyWith<$Res> {
  factory $BeatsDataCopyWith(BeatsData value, $Res Function(BeatsData) then) =
      _$BeatsDataCopyWithImpl<$Res, BeatsData>;
  @useResult
  $Res call({@HiveField(0) List<BeatData> beats});
}

/// @nodoc
class _$BeatsDataCopyWithImpl<$Res, $Val extends BeatsData>
    implements $BeatsDataCopyWith<$Res> {
  _$BeatsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BeatsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beats = null,
  }) {
    return _then(_value.copyWith(
      beats: null == beats
          ? _value.beats
          : beats // ignore: cast_nullable_to_non_nullable
              as List<BeatData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeatsDataImplCopyWith<$Res>
    implements $BeatsDataCopyWith<$Res> {
  factory _$$BeatsDataImplCopyWith(
          _$BeatsDataImpl value, $Res Function(_$BeatsDataImpl) then) =
      __$$BeatsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) List<BeatData> beats});
}

/// @nodoc
class __$$BeatsDataImplCopyWithImpl<$Res>
    extends _$BeatsDataCopyWithImpl<$Res, _$BeatsDataImpl>
    implements _$$BeatsDataImplCopyWith<$Res> {
  __$$BeatsDataImplCopyWithImpl(
      _$BeatsDataImpl _value, $Res Function(_$BeatsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of BeatsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beats = null,
  }) {
    return _then(_$BeatsDataImpl(
      beats: null == beats
          ? _value._beats
          : beats // ignore: cast_nullable_to_non_nullable
              as List<BeatData>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: HiveBoxConstant.beatsBoxTypeId)
class _$BeatsDataImpl implements _BeatsData {
  const _$BeatsDataImpl({@HiveField(0) required final List<BeatData> beats})
      : _beats = beats;

  final List<BeatData> _beats;
  @override
  @HiveField(0)
  List<BeatData> get beats {
    if (_beats is EqualUnmodifiableListView) return _beats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beats);
  }

  @override
  String toString() {
    return 'BeatsData(beats: $beats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeatsDataImpl &&
            const DeepCollectionEquality().equals(other._beats, _beats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_beats));

  /// Create a copy of BeatsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BeatsDataImplCopyWith<_$BeatsDataImpl> get copyWith =>
      __$$BeatsDataImplCopyWithImpl<_$BeatsDataImpl>(this, _$identity);
}

abstract class _BeatsData implements BeatsData {
  const factory _BeatsData(
      {@HiveField(0) required final List<BeatData> beats}) = _$BeatsDataImpl;

  @override
  @HiveField(0)
  List<BeatData> get beats;

  /// Create a copy of BeatsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BeatsDataImplCopyWith<_$BeatsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
