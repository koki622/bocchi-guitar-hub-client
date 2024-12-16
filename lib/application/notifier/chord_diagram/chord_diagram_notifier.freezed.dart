// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chord_diagram_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChordDiagramState {
  String get chordName => throw _privateConstructorUsedError;
  FlutterGuitarChord get flutterGuitarChord =>
      throw _privateConstructorUsedError;

  /// Create a copy of ChordDiagramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChordDiagramStateCopyWith<ChordDiagramState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChordDiagramStateCopyWith<$Res> {
  factory $ChordDiagramStateCopyWith(
          ChordDiagramState value, $Res Function(ChordDiagramState) then) =
      _$ChordDiagramStateCopyWithImpl<$Res, ChordDiagramState>;
  @useResult
  $Res call({String chordName, FlutterGuitarChord flutterGuitarChord});
}

/// @nodoc
class _$ChordDiagramStateCopyWithImpl<$Res, $Val extends ChordDiagramState>
    implements $ChordDiagramStateCopyWith<$Res> {
  _$ChordDiagramStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChordDiagramState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chordName = null,
    Object? flutterGuitarChord = null,
  }) {
    return _then(_value.copyWith(
      chordName: null == chordName
          ? _value.chordName
          : chordName // ignore: cast_nullable_to_non_nullable
              as String,
      flutterGuitarChord: null == flutterGuitarChord
          ? _value.flutterGuitarChord
          : flutterGuitarChord // ignore: cast_nullable_to_non_nullable
              as FlutterGuitarChord,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChordDiagramStateImplCopyWith<$Res>
    implements $ChordDiagramStateCopyWith<$Res> {
  factory _$$ChordDiagramStateImplCopyWith(_$ChordDiagramStateImpl value,
          $Res Function(_$ChordDiagramStateImpl) then) =
      __$$ChordDiagramStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String chordName, FlutterGuitarChord flutterGuitarChord});
}

/// @nodoc
class __$$ChordDiagramStateImplCopyWithImpl<$Res>
    extends _$ChordDiagramStateCopyWithImpl<$Res, _$ChordDiagramStateImpl>
    implements _$$ChordDiagramStateImplCopyWith<$Res> {
  __$$ChordDiagramStateImplCopyWithImpl(_$ChordDiagramStateImpl _value,
      $Res Function(_$ChordDiagramStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChordDiagramState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chordName = null,
    Object? flutterGuitarChord = null,
  }) {
    return _then(_$ChordDiagramStateImpl(
      chordName: null == chordName
          ? _value.chordName
          : chordName // ignore: cast_nullable_to_non_nullable
              as String,
      flutterGuitarChord: null == flutterGuitarChord
          ? _value.flutterGuitarChord
          : flutterGuitarChord // ignore: cast_nullable_to_non_nullable
              as FlutterGuitarChord,
    ));
  }
}

/// @nodoc

class _$ChordDiagramStateImpl implements _ChordDiagramState {
  _$ChordDiagramStateImpl(
      {required this.chordName, required this.flutterGuitarChord});

  @override
  final String chordName;
  @override
  final FlutterGuitarChord flutterGuitarChord;

  @override
  String toString() {
    return 'ChordDiagramState(chordName: $chordName, flutterGuitarChord: $flutterGuitarChord)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChordDiagramStateImpl &&
            (identical(other.chordName, chordName) ||
                other.chordName == chordName) &&
            (identical(other.flutterGuitarChord, flutterGuitarChord) ||
                other.flutterGuitarChord == flutterGuitarChord));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chordName, flutterGuitarChord);

  /// Create a copy of ChordDiagramState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChordDiagramStateImplCopyWith<_$ChordDiagramStateImpl> get copyWith =>
      __$$ChordDiagramStateImplCopyWithImpl<_$ChordDiagramStateImpl>(
          this, _$identity);
}

abstract class _ChordDiagramState implements ChordDiagramState {
  factory _ChordDiagramState(
          {required final String chordName,
          required final FlutterGuitarChord flutterGuitarChord}) =
      _$ChordDiagramStateImpl;

  @override
  String get chordName;
  @override
  FlutterGuitarChord get flutterGuitarChord;

  /// Create a copy of ChordDiagramState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChordDiagramStateImplCopyWith<_$ChordDiagramStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChordDiagramInfo _$ChordDiagramInfoFromJson(Map<String, dynamic> json) {
  return _ChordDiagramInfo.fromJson(json);
}

/// @nodoc
mixin _$ChordDiagramInfo {
  List<String>? get positions => throw _privateConstructorUsedError;
  List<List<String>>? get fingerings => throw _privateConstructorUsedError;

  /// Serializes this ChordDiagramInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChordDiagramInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChordDiagramInfoCopyWith<ChordDiagramInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChordDiagramInfoCopyWith<$Res> {
  factory $ChordDiagramInfoCopyWith(
          ChordDiagramInfo value, $Res Function(ChordDiagramInfo) then) =
      _$ChordDiagramInfoCopyWithImpl<$Res, ChordDiagramInfo>;
  @useResult
  $Res call({List<String>? positions, List<List<String>>? fingerings});
}

/// @nodoc
class _$ChordDiagramInfoCopyWithImpl<$Res, $Val extends ChordDiagramInfo>
    implements $ChordDiagramInfoCopyWith<$Res> {
  _$ChordDiagramInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChordDiagramInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positions = freezed,
    Object? fingerings = freezed,
  }) {
    return _then(_value.copyWith(
      positions: freezed == positions
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      fingerings: freezed == fingerings
          ? _value.fingerings
          : fingerings // ignore: cast_nullable_to_non_nullable
              as List<List<String>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChordDiagramInfoImplCopyWith<$Res>
    implements $ChordDiagramInfoCopyWith<$Res> {
  factory _$$ChordDiagramInfoImplCopyWith(_$ChordDiagramInfoImpl value,
          $Res Function(_$ChordDiagramInfoImpl) then) =
      __$$ChordDiagramInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? positions, List<List<String>>? fingerings});
}

/// @nodoc
class __$$ChordDiagramInfoImplCopyWithImpl<$Res>
    extends _$ChordDiagramInfoCopyWithImpl<$Res, _$ChordDiagramInfoImpl>
    implements _$$ChordDiagramInfoImplCopyWith<$Res> {
  __$$ChordDiagramInfoImplCopyWithImpl(_$ChordDiagramInfoImpl _value,
      $Res Function(_$ChordDiagramInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChordDiagramInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positions = freezed,
    Object? fingerings = freezed,
  }) {
    return _then(_$ChordDiagramInfoImpl(
      positions: freezed == positions
          ? _value._positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      fingerings: freezed == fingerings
          ? _value._fingerings
          : fingerings // ignore: cast_nullable_to_non_nullable
              as List<List<String>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChordDiagramInfoImpl implements _ChordDiagramInfo {
  _$ChordDiagramInfoImpl(
      {required final List<String>? positions,
      required final List<List<String>>? fingerings})
      : _positions = positions,
        _fingerings = fingerings;

  factory _$ChordDiagramInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChordDiagramInfoImplFromJson(json);

  final List<String>? _positions;
  @override
  List<String>? get positions {
    final value = _positions;
    if (value == null) return null;
    if (_positions is EqualUnmodifiableListView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<List<String>>? _fingerings;
  @override
  List<List<String>>? get fingerings {
    final value = _fingerings;
    if (value == null) return null;
    if (_fingerings is EqualUnmodifiableListView) return _fingerings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChordDiagramInfo(positions: $positions, fingerings: $fingerings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChordDiagramInfoImpl &&
            const DeepCollectionEquality()
                .equals(other._positions, _positions) &&
            const DeepCollectionEquality()
                .equals(other._fingerings, _fingerings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_positions),
      const DeepCollectionEquality().hash(_fingerings));

  /// Create a copy of ChordDiagramInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChordDiagramInfoImplCopyWith<_$ChordDiagramInfoImpl> get copyWith =>
      __$$ChordDiagramInfoImplCopyWithImpl<_$ChordDiagramInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChordDiagramInfoImplToJson(
      this,
    );
  }
}

abstract class _ChordDiagramInfo implements ChordDiagramInfo {
  factory _ChordDiagramInfo(
      {required final List<String>? positions,
      required final List<List<String>>? fingerings}) = _$ChordDiagramInfoImpl;

  factory _ChordDiagramInfo.fromJson(Map<String, dynamic> json) =
      _$ChordDiagramInfoImpl.fromJson;

  @override
  List<String>? get positions;
  @override
  List<List<String>>? get fingerings;

  /// Create a copy of ChordDiagramInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChordDiagramInfoImplCopyWith<_$ChordDiagramInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChordDiagramInfoCollection {
  Map<String, List<ChordDiagramInfo>> get chordDiagramInfos =>
      throw _privateConstructorUsedError;

  /// Create a copy of ChordDiagramInfoCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChordDiagramInfoCollectionCopyWith<ChordDiagramInfoCollection>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChordDiagramInfoCollectionCopyWith<$Res> {
  factory $ChordDiagramInfoCollectionCopyWith(ChordDiagramInfoCollection value,
          $Res Function(ChordDiagramInfoCollection) then) =
      _$ChordDiagramInfoCollectionCopyWithImpl<$Res,
          ChordDiagramInfoCollection>;
  @useResult
  $Res call({Map<String, List<ChordDiagramInfo>> chordDiagramInfos});
}

/// @nodoc
class _$ChordDiagramInfoCollectionCopyWithImpl<$Res,
        $Val extends ChordDiagramInfoCollection>
    implements $ChordDiagramInfoCollectionCopyWith<$Res> {
  _$ChordDiagramInfoCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChordDiagramInfoCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chordDiagramInfos = null,
  }) {
    return _then(_value.copyWith(
      chordDiagramInfos: null == chordDiagramInfos
          ? _value.chordDiagramInfos
          : chordDiagramInfos // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ChordDiagramInfo>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChordDiagramInfoCollectionImplCopyWith<$Res>
    implements $ChordDiagramInfoCollectionCopyWith<$Res> {
  factory _$$ChordDiagramInfoCollectionImplCopyWith(
          _$ChordDiagramInfoCollectionImpl value,
          $Res Function(_$ChordDiagramInfoCollectionImpl) then) =
      __$$ChordDiagramInfoCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, List<ChordDiagramInfo>> chordDiagramInfos});
}

/// @nodoc
class __$$ChordDiagramInfoCollectionImplCopyWithImpl<$Res>
    extends _$ChordDiagramInfoCollectionCopyWithImpl<$Res,
        _$ChordDiagramInfoCollectionImpl>
    implements _$$ChordDiagramInfoCollectionImplCopyWith<$Res> {
  __$$ChordDiagramInfoCollectionImplCopyWithImpl(
      _$ChordDiagramInfoCollectionImpl _value,
      $Res Function(_$ChordDiagramInfoCollectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChordDiagramInfoCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chordDiagramInfos = null,
  }) {
    return _then(_$ChordDiagramInfoCollectionImpl(
      chordDiagramInfos: null == chordDiagramInfos
          ? _value._chordDiagramInfos
          : chordDiagramInfos // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ChordDiagramInfo>>,
    ));
  }
}

/// @nodoc

class _$ChordDiagramInfoCollectionImpl implements _ChordDiagramInfoCollection {
  _$ChordDiagramInfoCollectionImpl(
      {required final Map<String, List<ChordDiagramInfo>> chordDiagramInfos})
      : _chordDiagramInfos = chordDiagramInfos;

  final Map<String, List<ChordDiagramInfo>> _chordDiagramInfos;
  @override
  Map<String, List<ChordDiagramInfo>> get chordDiagramInfos {
    if (_chordDiagramInfos is EqualUnmodifiableMapView)
      return _chordDiagramInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_chordDiagramInfos);
  }

  @override
  String toString() {
    return 'ChordDiagramInfoCollection(chordDiagramInfos: $chordDiagramInfos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChordDiagramInfoCollectionImpl &&
            const DeepCollectionEquality()
                .equals(other._chordDiagramInfos, _chordDiagramInfos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_chordDiagramInfos));

  /// Create a copy of ChordDiagramInfoCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChordDiagramInfoCollectionImplCopyWith<_$ChordDiagramInfoCollectionImpl>
      get copyWith => __$$ChordDiagramInfoCollectionImplCopyWithImpl<
          _$ChordDiagramInfoCollectionImpl>(this, _$identity);
}

abstract class _ChordDiagramInfoCollection
    implements ChordDiagramInfoCollection {
  factory _ChordDiagramInfoCollection(
      {required final Map<String, List<ChordDiagramInfo>>
          chordDiagramInfos}) = _$ChordDiagramInfoCollectionImpl;

  @override
  Map<String, List<ChordDiagramInfo>> get chordDiagramInfos;

  /// Create a copy of ChordDiagramInfoCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChordDiagramInfoCollectionImplCopyWith<_$ChordDiagramInfoCollectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
