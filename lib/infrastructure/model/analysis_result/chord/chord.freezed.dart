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

ChordsResponse _$ChordsResponseFromJson(Map<String, dynamic> json) {
  return _ChordsResponse.fromJson(json);
}

/// @nodoc
mixin _$ChordsResponse {
  List<ChordResponse> get chords => throw _privateConstructorUsedError;

  /// Serializes this ChordsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChordsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChordsResponseCopyWith<ChordsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChordsResponseCopyWith<$Res> {
  factory $ChordsResponseCopyWith(
          ChordsResponse value, $Res Function(ChordsResponse) then) =
      _$ChordsResponseCopyWithImpl<$Res, ChordsResponse>;
  @useResult
  $Res call({List<ChordResponse> chords});
}

/// @nodoc
class _$ChordsResponseCopyWithImpl<$Res, $Val extends ChordsResponse>
    implements $ChordsResponseCopyWith<$Res> {
  _$ChordsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChordsResponse
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
              as List<ChordResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChordsResponseImplCopyWith<$Res>
    implements $ChordsResponseCopyWith<$Res> {
  factory _$$ChordsResponseImplCopyWith(_$ChordsResponseImpl value,
          $Res Function(_$ChordsResponseImpl) then) =
      __$$ChordsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChordResponse> chords});
}

/// @nodoc
class __$$ChordsResponseImplCopyWithImpl<$Res>
    extends _$ChordsResponseCopyWithImpl<$Res, _$ChordsResponseImpl>
    implements _$$ChordsResponseImplCopyWith<$Res> {
  __$$ChordsResponseImplCopyWithImpl(
      _$ChordsResponseImpl _value, $Res Function(_$ChordsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChordsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chords = null,
  }) {
    return _then(_$ChordsResponseImpl(
      chords: null == chords
          ? _value._chords
          : chords // ignore: cast_nullable_to_non_nullable
              as List<ChordResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChordsResponseImpl implements _ChordsResponse {
  const _$ChordsResponseImpl({required final List<ChordResponse> chords})
      : _chords = chords;

  factory _$ChordsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChordsResponseImplFromJson(json);

  final List<ChordResponse> _chords;
  @override
  List<ChordResponse> get chords {
    if (_chords is EqualUnmodifiableListView) return _chords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chords);
  }

  @override
  String toString() {
    return 'ChordsResponse(chords: $chords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChordsResponseImpl &&
            const DeepCollectionEquality().equals(other._chords, _chords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chords));

  /// Create a copy of ChordsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChordsResponseImplCopyWith<_$ChordsResponseImpl> get copyWith =>
      __$$ChordsResponseImplCopyWithImpl<_$ChordsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChordsResponseImplToJson(
      this,
    );
  }
}

abstract class _ChordsResponse implements ChordsResponse {
  const factory _ChordsResponse({required final List<ChordResponse> chords}) =
      _$ChordsResponseImpl;

  factory _ChordsResponse.fromJson(Map<String, dynamic> json) =
      _$ChordsResponseImpl.fromJson;

  @override
  List<ChordResponse> get chords;

  /// Create a copy of ChordsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChordsResponseImplCopyWith<_$ChordsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChordResponse _$ChordResponseFromJson(Map<String, dynamic> json) {
  return _ChordResponse.fromJson(json);
}

/// @nodoc
mixin _$ChordResponse {
  double get time => throw _privateConstructorUsedError;
  double get duration => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Serializes this ChordResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChordResponseCopyWith<ChordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChordResponseCopyWith<$Res> {
  factory $ChordResponseCopyWith(
          ChordResponse value, $Res Function(ChordResponse) then) =
      _$ChordResponseCopyWithImpl<$Res, ChordResponse>;
  @useResult
  $Res call({double time, double duration, String value});
}

/// @nodoc
class _$ChordResponseCopyWithImpl<$Res, $Val extends ChordResponse>
    implements $ChordResponseCopyWith<$Res> {
  _$ChordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? duration = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChordResponseImplCopyWith<$Res>
    implements $ChordResponseCopyWith<$Res> {
  factory _$$ChordResponseImplCopyWith(
          _$ChordResponseImpl value, $Res Function(_$ChordResponseImpl) then) =
      __$$ChordResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double time, double duration, String value});
}

/// @nodoc
class __$$ChordResponseImplCopyWithImpl<$Res>
    extends _$ChordResponseCopyWithImpl<$Res, _$ChordResponseImpl>
    implements _$$ChordResponseImplCopyWith<$Res> {
  __$$ChordResponseImplCopyWithImpl(
      _$ChordResponseImpl _value, $Res Function(_$ChordResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? duration = null,
    Object? value = null,
  }) {
    return _then(_$ChordResponseImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChordResponseImpl implements _ChordResponse {
  const _$ChordResponseImpl(
      {required this.time, required this.duration, required this.value});

  factory _$ChordResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChordResponseImplFromJson(json);

  @override
  final double time;
  @override
  final double duration;
  @override
  final String value;

  @override
  String toString() {
    return 'ChordResponse(time: $time, duration: $duration, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChordResponseImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, duration, value);

  /// Create a copy of ChordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChordResponseImplCopyWith<_$ChordResponseImpl> get copyWith =>
      __$$ChordResponseImplCopyWithImpl<_$ChordResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChordResponseImplToJson(
      this,
    );
  }
}

abstract class _ChordResponse implements ChordResponse {
  const factory _ChordResponse(
      {required final double time,
      required final double duration,
      required final String value}) = _$ChordResponseImpl;

  factory _ChordResponse.fromJson(Map<String, dynamic> json) =
      _$ChordResponseImpl.fromJson;

  @override
  double get time;
  @override
  double get duration;
  @override
  String get value;

  /// Create a copy of ChordResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChordResponseImplCopyWith<_$ChordResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
