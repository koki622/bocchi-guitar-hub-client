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
  List<ChordData> get chords => throw _privateConstructorUsedError;

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
  $Res call({@HiveField(0) List<ChordData> chords});
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
    Object? chords = null,
  }) {
    return _then(_value.copyWith(
      chords: null == chords
          ? _value.chords
          : chords // ignore: cast_nullable_to_non_nullable
              as List<ChordData>,
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
  $Res call({@HiveField(0) List<ChordData> chords});
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
    Object? chords = null,
  }) {
    return _then(_$ChordsDataImpl(
      chords: null == chords
          ? _value._chords
          : chords // ignore: cast_nullable_to_non_nullable
              as List<ChordData>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: HiveBoxConstant.chordsBoxTypeId)
class _$ChordsDataImpl implements _ChordsData {
  const _$ChordsDataImpl({@HiveField(0) required final List<ChordData> chords})
      : _chords = chords;

  final List<ChordData> _chords;
  @override
  @HiveField(0)
  List<ChordData> get chords {
    if (_chords is EqualUnmodifiableListView) return _chords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chords);
  }

  @override
  String toString() {
    return 'ChordsData(chords: $chords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChordsDataImpl &&
            const DeepCollectionEquality().equals(other._chords, _chords));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chords));

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
      {@HiveField(0) required final List<ChordData> chords}) = _$ChordsDataImpl;

  @override
  @HiveField(0)
  List<ChordData> get chords;

  /// Create a copy of ChordsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChordsDataImplCopyWith<_$ChordsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
