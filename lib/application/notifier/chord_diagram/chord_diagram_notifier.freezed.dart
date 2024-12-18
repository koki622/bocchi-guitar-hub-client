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

MainChordInfo _$MainChordInfoFromJson(Map<String, dynamic> json) {
  return _MainChordInfo.fromJson(json);
}

/// @nodoc
mixin _$MainChordInfo {
  @JsonKey(name: 'frets')
  List<String>? get positions => throw _privateConstructorUsedError;
  @JsonKey(name: 'fingers')
  List<List<String>>? get fingerings => throw _privateConstructorUsedError;

  /// Serializes this MainChordInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MainChordInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainChordInfoCopyWith<MainChordInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainChordInfoCopyWith<$Res> {
  factory $MainChordInfoCopyWith(
          MainChordInfo value, $Res Function(MainChordInfo) then) =
      _$MainChordInfoCopyWithImpl<$Res, MainChordInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'frets') List<String>? positions,
      @JsonKey(name: 'fingers') List<List<String>>? fingerings});
}

/// @nodoc
class _$MainChordInfoCopyWithImpl<$Res, $Val extends MainChordInfo>
    implements $MainChordInfoCopyWith<$Res> {
  _$MainChordInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainChordInfo
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
abstract class _$$MainChordInfoImplCopyWith<$Res>
    implements $MainChordInfoCopyWith<$Res> {
  factory _$$MainChordInfoImplCopyWith(
          _$MainChordInfoImpl value, $Res Function(_$MainChordInfoImpl) then) =
      __$$MainChordInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'frets') List<String>? positions,
      @JsonKey(name: 'fingers') List<List<String>>? fingerings});
}

/// @nodoc
class __$$MainChordInfoImplCopyWithImpl<$Res>
    extends _$MainChordInfoCopyWithImpl<$Res, _$MainChordInfoImpl>
    implements _$$MainChordInfoImplCopyWith<$Res> {
  __$$MainChordInfoImplCopyWithImpl(
      _$MainChordInfoImpl _value, $Res Function(_$MainChordInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainChordInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positions = freezed,
    Object? fingerings = freezed,
  }) {
    return _then(_$MainChordInfoImpl(
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
class _$MainChordInfoImpl implements _MainChordInfo {
  _$MainChordInfoImpl(
      {@JsonKey(name: 'frets') required final List<String>? positions,
      @JsonKey(name: 'fingers') required final List<List<String>>? fingerings})
      : _positions = positions,
        _fingerings = fingerings;

  factory _$MainChordInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainChordInfoImplFromJson(json);

  final List<String>? _positions;
  @override
  @JsonKey(name: 'frets')
  List<String>? get positions {
    final value = _positions;
    if (value == null) return null;
    if (_positions is EqualUnmodifiableListView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<List<String>>? _fingerings;
  @override
  @JsonKey(name: 'fingers')
  List<List<String>>? get fingerings {
    final value = _fingerings;
    if (value == null) return null;
    if (_fingerings is EqualUnmodifiableListView) return _fingerings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MainChordInfo(positions: $positions, fingerings: $fingerings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainChordInfoImpl &&
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

  /// Create a copy of MainChordInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainChordInfoImplCopyWith<_$MainChordInfoImpl> get copyWith =>
      __$$MainChordInfoImplCopyWithImpl<_$MainChordInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainChordInfoImplToJson(
      this,
    );
  }
}

abstract class _MainChordInfo implements MainChordInfo {
  factory _MainChordInfo(
      {@JsonKey(name: 'frets') required final List<String>? positions,
      @JsonKey(name: 'fingers')
      required final List<List<String>>? fingerings}) = _$MainChordInfoImpl;

  factory _MainChordInfo.fromJson(Map<String, dynamic> json) =
      _$MainChordInfoImpl.fromJson;

  @override
  @JsonKey(name: 'frets')
  List<String>? get positions;
  @override
  @JsonKey(name: 'fingers')
  List<List<String>>? get fingerings;

  /// Create a copy of MainChordInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainChordInfoImplCopyWith<_$MainChordInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubChordInfo _$SubChordInfoFromJson(Map<String, dynamic> json) {
  return _SubChordInfo.fromJson(json);
}

/// @nodoc
mixin _$SubChordInfo {
  @JsonKey(name: 'positions')
  List<String>? get positions => throw _privateConstructorUsedError;
  @JsonKey(name: 'fingerings')
  List<List<String>>? get fingerings => throw _privateConstructorUsedError;

  /// Serializes this SubChordInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubChordInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubChordInfoCopyWith<SubChordInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubChordInfoCopyWith<$Res> {
  factory $SubChordInfoCopyWith(
          SubChordInfo value, $Res Function(SubChordInfo) then) =
      _$SubChordInfoCopyWithImpl<$Res, SubChordInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'positions') List<String>? positions,
      @JsonKey(name: 'fingerings') List<List<String>>? fingerings});
}

/// @nodoc
class _$SubChordInfoCopyWithImpl<$Res, $Val extends SubChordInfo>
    implements $SubChordInfoCopyWith<$Res> {
  _$SubChordInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubChordInfo
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
abstract class _$$SubChordInfoImplCopyWith<$Res>
    implements $SubChordInfoCopyWith<$Res> {
  factory _$$SubChordInfoImplCopyWith(
          _$SubChordInfoImpl value, $Res Function(_$SubChordInfoImpl) then) =
      __$$SubChordInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'positions') List<String>? positions,
      @JsonKey(name: 'fingerings') List<List<String>>? fingerings});
}

/// @nodoc
class __$$SubChordInfoImplCopyWithImpl<$Res>
    extends _$SubChordInfoCopyWithImpl<$Res, _$SubChordInfoImpl>
    implements _$$SubChordInfoImplCopyWith<$Res> {
  __$$SubChordInfoImplCopyWithImpl(
      _$SubChordInfoImpl _value, $Res Function(_$SubChordInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubChordInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positions = freezed,
    Object? fingerings = freezed,
  }) {
    return _then(_$SubChordInfoImpl(
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
class _$SubChordInfoImpl implements _SubChordInfo {
  _$SubChordInfoImpl(
      {@JsonKey(name: 'positions') required final List<String>? positions,
      @JsonKey(name: 'fingerings')
      required final List<List<String>>? fingerings})
      : _positions = positions,
        _fingerings = fingerings;

  factory _$SubChordInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubChordInfoImplFromJson(json);

  final List<String>? _positions;
  @override
  @JsonKey(name: 'positions')
  List<String>? get positions {
    final value = _positions;
    if (value == null) return null;
    if (_positions is EqualUnmodifiableListView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<List<String>>? _fingerings;
  @override
  @JsonKey(name: 'fingerings')
  List<List<String>>? get fingerings {
    final value = _fingerings;
    if (value == null) return null;
    if (_fingerings is EqualUnmodifiableListView) return _fingerings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SubChordInfo(positions: $positions, fingerings: $fingerings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubChordInfoImpl &&
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

  /// Create a copy of SubChordInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubChordInfoImplCopyWith<_$SubChordInfoImpl> get copyWith =>
      __$$SubChordInfoImplCopyWithImpl<_$SubChordInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubChordInfoImplToJson(
      this,
    );
  }
}

abstract class _SubChordInfo implements SubChordInfo {
  factory _SubChordInfo(
      {@JsonKey(name: 'positions') required final List<String>? positions,
      @JsonKey(name: 'fingerings')
      required final List<List<String>>? fingerings}) = _$SubChordInfoImpl;

  factory _SubChordInfo.fromJson(Map<String, dynamic> json) =
      _$SubChordInfoImpl.fromJson;

  @override
  @JsonKey(name: 'positions')
  List<String>? get positions;
  @override
  @JsonKey(name: 'fingerings')
  List<List<String>>? get fingerings;

  /// Create a copy of SubChordInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubChordInfoImplCopyWith<_$SubChordInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChordDiagramInfoCollection {
  Map<String, List<ChordInfo>> get chordDiagramInfos =>
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
  $Res call({Map<String, List<ChordInfo>> chordDiagramInfos});
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
              as Map<String, List<ChordInfo>>,
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
  $Res call({Map<String, List<ChordInfo>> chordDiagramInfos});
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
              as Map<String, List<ChordInfo>>,
    ));
  }
}

/// @nodoc

class _$ChordDiagramInfoCollectionImpl implements _ChordDiagramInfoCollection {
  _$ChordDiagramInfoCollectionImpl(
      {required final Map<String, List<ChordInfo>> chordDiagramInfos})
      : _chordDiagramInfos = chordDiagramInfos;

  final Map<String, List<ChordInfo>> _chordDiagramInfos;
  @override
  Map<String, List<ChordInfo>> get chordDiagramInfos {
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
          {required final Map<String, List<ChordInfo>> chordDiagramInfos}) =
      _$ChordDiagramInfoCollectionImpl;

  @override
  Map<String, List<ChordInfo>> get chordDiagramInfos;

  /// Create a copy of ChordDiagramInfoCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChordDiagramInfoCollectionImplCopyWith<_$ChordDiagramInfoCollectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
