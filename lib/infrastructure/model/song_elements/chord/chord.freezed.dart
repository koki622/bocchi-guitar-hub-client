// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chord.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChordsData {
  @HiveField(0)
  List<ChordData>? get chords => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get soundFilePath => throw _privateConstructorUsedError;

  /// Create a copy of ChordsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChordsDataCopyWith<ChordsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChordsDataCopyWith<$Res> {
  factory $ChordsDataCopyWith(
          ChordsData value, $Res Function(ChordsData) then) =
      _$ChordsDataCopyWithImpl<$Res, ChordsData>;
  @useResult
  $Res call(
      {@HiveField(0) List<ChordData>? chords,
      @HiveField(1) String? soundFilePath});
}

/// @nodoc
class _$ChordsDataCopyWithImpl<$Res, $Val extends ChordsData>
    implements $ChordsDataCopyWith<$Res> {
  _$ChordsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChordsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chords = freezed,
    Object? soundFilePath = freezed,
  }) {
    return _then(_value.copyWith(
      chords: freezed == chords
          ? _value.chords
          : chords // ignore: cast_nullable_to_non_nullable
              as List<ChordData>?,
      soundFilePath: freezed == soundFilePath
          ? _value.soundFilePath
          : soundFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChordsDataImplCopyWith<$Res>
    implements $ChordsDataCopyWith<$Res> {
  factory _$$ChordsDataImplCopyWith(
          _$ChordsDataImpl value, $Res Function(_$ChordsDataImpl) then) =
      __$$ChordsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) List<ChordData>? chords,
      @HiveField(1) String? soundFilePath});
}

/// @nodoc
class __$$ChordsDataImplCopyWithImpl<$Res>
    extends _$ChordsDataCopyWithImpl<$Res, _$ChordsDataImpl>
    implements _$$ChordsDataImplCopyWith<$Res> {
  __$$ChordsDataImplCopyWithImpl(
      _$ChordsDataImpl _value, $Res Function(_$ChordsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChordsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chords = freezed,
    Object? soundFilePath = freezed,
  }) {
    return _then(_$ChordsDataImpl(
      chords: freezed == chords
          ? _value._chords
          : chords // ignore: cast_nullable_to_non_nullable
              as List<ChordData>?,
      soundFilePath: freezed == soundFilePath
          ? _value.soundFilePath
          : soundFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: HiveBoxConstant.chordsBoxTypeId)
class _$ChordsDataImpl implements _ChordsData {
  const _$ChordsDataImpl(
      {@HiveField(0) final List<ChordData>? chords,
      @HiveField(1) this.soundFilePath})
      : _chords = chords;

  final List<ChordData>? _chords;
  @override
  @HiveField(0)
  List<ChordData>? get chords {
    final value = _chords;
    if (value == null) return null;
    if (_chords is EqualUnmodifiableListView) return _chords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(1)
  final String? soundFilePath;

  @override
  String toString() {
    return 'ChordsData(chords: $chords, soundFilePath: $soundFilePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChordsDataImpl &&
            const DeepCollectionEquality().equals(other._chords, _chords) &&
            (identical(other.soundFilePath, soundFilePath) ||
                other.soundFilePath == soundFilePath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_chords), soundFilePath);

  /// Create a copy of ChordsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChordsDataImplCopyWith<_$ChordsDataImpl> get copyWith =>
      __$$ChordsDataImplCopyWithImpl<_$ChordsDataImpl>(this, _$identity);
}

abstract class _ChordsData implements ChordsData {
  const factory _ChordsData(
      {@HiveField(0) final List<ChordData>? chords,
      @HiveField(1) final String? soundFilePath}) = _$ChordsDataImpl;

  @override
  @HiveField(0)
  List<ChordData>? get chords;
  @override
  @HiveField(1)
  String? get soundFilePath;

  /// Create a copy of ChordsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChordsDataImplCopyWith<_$ChordsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
