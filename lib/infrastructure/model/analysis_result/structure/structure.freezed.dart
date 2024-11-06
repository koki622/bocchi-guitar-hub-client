// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'structure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StructureResponse _$StructureResponseFromJson(Map<String, dynamic> json) {
  return _StructureResponse.fromJson(json);
}

/// @nodoc
mixin _$StructureResponse {
  @JsonKey(name: 'beats')
  List<double> get beats => throw _privateConstructorUsedError;
  @JsonKey(name: 'beat_positions')
  List<double> get beatPositions => throw _privateConstructorUsedError;
  @JsonKey(name: 'segments')
  List<SegmentResponse> get segments => throw _privateConstructorUsedError;

  /// Serializes this StructureResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StructureResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StructureResponseCopyWith<StructureResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructureResponseCopyWith<$Res> {
  factory $StructureResponseCopyWith(
          StructureResponse value, $Res Function(StructureResponse) then) =
      _$StructureResponseCopyWithImpl<$Res, StructureResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'beats') List<double> beats,
      @JsonKey(name: 'beat_positions') List<double> beatPositions,
      @JsonKey(name: 'segments') List<SegmentResponse> segments});
}

/// @nodoc
class _$StructureResponseCopyWithImpl<$Res, $Val extends StructureResponse>
    implements $StructureResponseCopyWith<$Res> {
  _$StructureResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StructureResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beats = null,
    Object? beatPositions = null,
    Object? segments = null,
  }) {
    return _then(_value.copyWith(
      beats: null == beats
          ? _value.beats
          : beats // ignore: cast_nullable_to_non_nullable
              as List<double>,
      beatPositions: null == beatPositions
          ? _value.beatPositions
          : beatPositions // ignore: cast_nullable_to_non_nullable
              as List<double>,
      segments: null == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<SegmentResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StructureResponseImplCopyWith<$Res>
    implements $StructureResponseCopyWith<$Res> {
  factory _$$StructureResponseImplCopyWith(_$StructureResponseImpl value,
          $Res Function(_$StructureResponseImpl) then) =
      __$$StructureResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'beats') List<double> beats,
      @JsonKey(name: 'beat_positions') List<double> beatPositions,
      @JsonKey(name: 'segments') List<SegmentResponse> segments});
}

/// @nodoc
class __$$StructureResponseImplCopyWithImpl<$Res>
    extends _$StructureResponseCopyWithImpl<$Res, _$StructureResponseImpl>
    implements _$$StructureResponseImplCopyWith<$Res> {
  __$$StructureResponseImplCopyWithImpl(_$StructureResponseImpl _value,
      $Res Function(_$StructureResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of StructureResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beats = null,
    Object? beatPositions = null,
    Object? segments = null,
  }) {
    return _then(_$StructureResponseImpl(
      beats: null == beats
          ? _value._beats
          : beats // ignore: cast_nullable_to_non_nullable
              as List<double>,
      beatPositions: null == beatPositions
          ? _value._beatPositions
          : beatPositions // ignore: cast_nullable_to_non_nullable
              as List<double>,
      segments: null == segments
          ? _value._segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<SegmentResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StructureResponseImpl implements _StructureResponse {
  const _$StructureResponseImpl(
      {@JsonKey(name: 'beats') required final List<double> beats,
      @JsonKey(name: 'beat_positions')
      required final List<double> beatPositions,
      @JsonKey(name: 'segments') required final List<SegmentResponse> segments})
      : _beats = beats,
        _beatPositions = beatPositions,
        _segments = segments;

  factory _$StructureResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StructureResponseImplFromJson(json);

  final List<double> _beats;
  @override
  @JsonKey(name: 'beats')
  List<double> get beats {
    if (_beats is EqualUnmodifiableListView) return _beats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beats);
  }

  final List<double> _beatPositions;
  @override
  @JsonKey(name: 'beat_positions')
  List<double> get beatPositions {
    if (_beatPositions is EqualUnmodifiableListView) return _beatPositions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beatPositions);
  }

  final List<SegmentResponse> _segments;
  @override
  @JsonKey(name: 'segments')
  List<SegmentResponse> get segments {
    if (_segments is EqualUnmodifiableListView) return _segments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_segments);
  }

  @override
  String toString() {
    return 'StructureResponse(beats: $beats, beatPositions: $beatPositions, segments: $segments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StructureResponseImpl &&
            const DeepCollectionEquality().equals(other._beats, _beats) &&
            const DeepCollectionEquality()
                .equals(other._beatPositions, _beatPositions) &&
            const DeepCollectionEquality().equals(other._segments, _segments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_beats),
      const DeepCollectionEquality().hash(_beatPositions),
      const DeepCollectionEquality().hash(_segments));

  /// Create a copy of StructureResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StructureResponseImplCopyWith<_$StructureResponseImpl> get copyWith =>
      __$$StructureResponseImplCopyWithImpl<_$StructureResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StructureResponseImplToJson(
      this,
    );
  }
}

abstract class _StructureResponse implements StructureResponse {
  const factory _StructureResponse(
      {@JsonKey(name: 'beats') required final List<double> beats,
      @JsonKey(name: 'beat_positions')
      required final List<double> beatPositions,
      @JsonKey(name: 'segments')
      required final List<SegmentResponse> segments}) = _$StructureResponseImpl;

  factory _StructureResponse.fromJson(Map<String, dynamic> json) =
      _$StructureResponseImpl.fromJson;

  @override
  @JsonKey(name: 'beats')
  List<double> get beats;
  @override
  @JsonKey(name: 'beat_positions')
  List<double> get beatPositions;
  @override
  @JsonKey(name: 'segments')
  List<SegmentResponse> get segments;

  /// Create a copy of StructureResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StructureResponseImplCopyWith<_$StructureResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SegmentResponse _$SegmentResponseFromJson(Map<String, dynamic> json) {
  return _SegmentResponse.fromJson(json);
}

/// @nodoc
mixin _$SegmentResponse {
  double get start => throw _privateConstructorUsedError;
  double get end => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Serializes this SegmentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SegmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SegmentResponseCopyWith<SegmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SegmentResponseCopyWith<$Res> {
  factory $SegmentResponseCopyWith(
          SegmentResponse value, $Res Function(SegmentResponse) then) =
      _$SegmentResponseCopyWithImpl<$Res, SegmentResponse>;
  @useResult
  $Res call({double start, double end, String label});
}

/// @nodoc
class _$SegmentResponseCopyWithImpl<$Res, $Val extends SegmentResponse>
    implements $SegmentResponseCopyWith<$Res> {
  _$SegmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SegmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SegmentResponseImplCopyWith<$Res>
    implements $SegmentResponseCopyWith<$Res> {
  factory _$$SegmentResponseImplCopyWith(_$SegmentResponseImpl value,
          $Res Function(_$SegmentResponseImpl) then) =
      __$$SegmentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double start, double end, String label});
}

/// @nodoc
class __$$SegmentResponseImplCopyWithImpl<$Res>
    extends _$SegmentResponseCopyWithImpl<$Res, _$SegmentResponseImpl>
    implements _$$SegmentResponseImplCopyWith<$Res> {
  __$$SegmentResponseImplCopyWithImpl(
      _$SegmentResponseImpl _value, $Res Function(_$SegmentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SegmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? label = null,
  }) {
    return _then(_$SegmentResponseImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SegmentResponseImpl implements _SegmentResponse {
  const _$SegmentResponseImpl(
      {required this.start, required this.end, required this.label});

  factory _$SegmentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SegmentResponseImplFromJson(json);

  @override
  final double start;
  @override
  final double end;
  @override
  final String label;

  @override
  String toString() {
    return 'SegmentResponse(start: $start, end: $end, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SegmentResponseImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end, label);

  /// Create a copy of SegmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SegmentResponseImplCopyWith<_$SegmentResponseImpl> get copyWith =>
      __$$SegmentResponseImplCopyWithImpl<_$SegmentResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SegmentResponseImplToJson(
      this,
    );
  }
}

abstract class _SegmentResponse implements SegmentResponse {
  const factory _SegmentResponse(
      {required final double start,
      required final double end,
      required final String label}) = _$SegmentResponseImpl;

  factory _SegmentResponse.fromJson(Map<String, dynamic> json) =
      _$SegmentResponseImpl.fromJson;

  @override
  double get start;
  @override
  double get end;
  @override
  String get label;

  /// Create a copy of SegmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SegmentResponseImplCopyWith<_$SegmentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
