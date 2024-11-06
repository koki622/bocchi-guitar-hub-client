// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SectionsData {
  @HiveField(0)
  List<SectionData> get sections => throw _privateConstructorUsedError;

  /// Create a copy of SectionsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SectionsDataCopyWith<SectionsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionsDataCopyWith<$Res> {
  factory $SectionsDataCopyWith(
          SectionsData value, $Res Function(SectionsData) then) =
      _$SectionsDataCopyWithImpl<$Res, SectionsData>;
  @useResult
  $Res call({@HiveField(0) List<SectionData> sections});
}

/// @nodoc
class _$SectionsDataCopyWithImpl<$Res, $Val extends SectionsData>
    implements $SectionsDataCopyWith<$Res> {
  _$SectionsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SectionsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sections = null,
  }) {
    return _then(_value.copyWith(
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<SectionData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SectionsDataImplCopyWith<$Res>
    implements $SectionsDataCopyWith<$Res> {
  factory _$$SectionsDataImplCopyWith(
          _$SectionsDataImpl value, $Res Function(_$SectionsDataImpl) then) =
      __$$SectionsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) List<SectionData> sections});
}

/// @nodoc
class __$$SectionsDataImplCopyWithImpl<$Res>
    extends _$SectionsDataCopyWithImpl<$Res, _$SectionsDataImpl>
    implements _$$SectionsDataImplCopyWith<$Res> {
  __$$SectionsDataImplCopyWithImpl(
      _$SectionsDataImpl _value, $Res Function(_$SectionsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SectionsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sections = null,
  }) {
    return _then(_$SectionsDataImpl(
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<SectionData>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: HiveBoxConstant.sectionsBoxTypeId)
class _$SectionsDataImpl implements _SectionsData {
  const _$SectionsDataImpl(
      {@HiveField(0) required final List<SectionData> sections})
      : _sections = sections;

  final List<SectionData> _sections;
  @override
  @HiveField(0)
  List<SectionData> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  String toString() {
    return 'SectionsData(sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionsDataImpl &&
            const DeepCollectionEquality().equals(other._sections, _sections));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sections));

  /// Create a copy of SectionsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionsDataImplCopyWith<_$SectionsDataImpl> get copyWith =>
      __$$SectionsDataImplCopyWithImpl<_$SectionsDataImpl>(this, _$identity);
}

abstract class _SectionsData implements SectionsData {
  const factory _SectionsData(
          {@HiveField(0) required final List<SectionData> sections}) =
      _$SectionsDataImpl;

  @override
  @HiveField(0)
  List<SectionData> get sections;

  /// Create a copy of SectionsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SectionsDataImplCopyWith<_$SectionsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
