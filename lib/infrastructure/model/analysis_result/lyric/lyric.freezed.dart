// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LyricsResponse _$LyricsResponseFromJson(Map<String, dynamic> json) {
  return _LyricsResponse.fromJson(json);
}

/// @nodoc
mixin _$LyricsResponse {
  List<LyricResponse> get segments => throw _privateConstructorUsedError;
  List<LyricResponse> get word => throw _privateConstructorUsedError;

  /// Serializes this LyricsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LyricsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LyricsResponseCopyWith<LyricsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricsResponseCopyWith<$Res> {
  factory $LyricsResponseCopyWith(
          LyricsResponse value, $Res Function(LyricsResponse) then) =
      _$LyricsResponseCopyWithImpl<$Res, LyricsResponse>;
  @useResult
  $Res call({List<LyricResponse> segments, List<LyricResponse> word});
}

/// @nodoc
class _$LyricsResponseCopyWithImpl<$Res, $Val extends LyricsResponse>
    implements $LyricsResponseCopyWith<$Res> {
  _$LyricsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LyricsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segments = null,
    Object? word = null,
  }) {
    return _then(_value.copyWith(
      segments: null == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<LyricResponse>,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as List<LyricResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LyricsResponseImplCopyWith<$Res>
    implements $LyricsResponseCopyWith<$Res> {
  factory _$$LyricsResponseImplCopyWith(_$LyricsResponseImpl value,
          $Res Function(_$LyricsResponseImpl) then) =
      __$$LyricsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LyricResponse> segments, List<LyricResponse> word});
}

/// @nodoc
class __$$LyricsResponseImplCopyWithImpl<$Res>
    extends _$LyricsResponseCopyWithImpl<$Res, _$LyricsResponseImpl>
    implements _$$LyricsResponseImplCopyWith<$Res> {
  __$$LyricsResponseImplCopyWithImpl(
      _$LyricsResponseImpl _value, $Res Function(_$LyricsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LyricsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segments = null,
    Object? word = null,
  }) {
    return _then(_$LyricsResponseImpl(
      segments: null == segments
          ? _value._segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<LyricResponse>,
      word: null == word
          ? _value._word
          : word // ignore: cast_nullable_to_non_nullable
              as List<LyricResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LyricsResponseImpl implements _LyricsResponse {
  const _$LyricsResponseImpl(
      {required final List<LyricResponse> segments,
      required final List<LyricResponse> word})
      : _segments = segments,
        _word = word;

  factory _$LyricsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LyricsResponseImplFromJson(json);

  final List<LyricResponse> _segments;
  @override
  List<LyricResponse> get segments {
    if (_segments is EqualUnmodifiableListView) return _segments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_segments);
  }

  final List<LyricResponse> _word;
  @override
  List<LyricResponse> get word {
    if (_word is EqualUnmodifiableListView) return _word;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_word);
  }

  @override
  String toString() {
    return 'LyricsResponse(segments: $segments, word: $word)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricsResponseImpl &&
            const DeepCollectionEquality().equals(other._segments, _segments) &&
            const DeepCollectionEquality().equals(other._word, _word));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_segments),
      const DeepCollectionEquality().hash(_word));

  /// Create a copy of LyricsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricsResponseImplCopyWith<_$LyricsResponseImpl> get copyWith =>
      __$$LyricsResponseImplCopyWithImpl<_$LyricsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LyricsResponseImplToJson(
      this,
    );
  }
}

abstract class _LyricsResponse implements LyricsResponse {
  const factory _LyricsResponse(
      {required final List<LyricResponse> segments,
      required final List<LyricResponse> word}) = _$LyricsResponseImpl;

  factory _LyricsResponse.fromJson(Map<String, dynamic> json) =
      _$LyricsResponseImpl.fromJson;

  @override
  List<LyricResponse> get segments;
  @override
  List<LyricResponse> get word;

  /// Create a copy of LyricsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LyricsResponseImplCopyWith<_$LyricsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LyricResponse _$LyricResponseFromJson(Map<String, dynamic> json) {
  return _LyricResponse.fromJson(json);
}

/// @nodoc
mixin _$LyricResponse {
  double get start => throw _privateConstructorUsedError;
  double get end => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this LyricResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LyricResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LyricResponseCopyWith<LyricResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricResponseCopyWith<$Res> {
  factory $LyricResponseCopyWith(
          LyricResponse value, $Res Function(LyricResponse) then) =
      _$LyricResponseCopyWithImpl<$Res, LyricResponse>;
  @useResult
  $Res call({double start, double end, String text});
}

/// @nodoc
class _$LyricResponseCopyWithImpl<$Res, $Val extends LyricResponse>
    implements $LyricResponseCopyWith<$Res> {
  _$LyricResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LyricResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? text = null,
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
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LyricResponseImplCopyWith<$Res>
    implements $LyricResponseCopyWith<$Res> {
  factory _$$LyricResponseImplCopyWith(
          _$LyricResponseImpl value, $Res Function(_$LyricResponseImpl) then) =
      __$$LyricResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double start, double end, String text});
}

/// @nodoc
class __$$LyricResponseImplCopyWithImpl<$Res>
    extends _$LyricResponseCopyWithImpl<$Res, _$LyricResponseImpl>
    implements _$$LyricResponseImplCopyWith<$Res> {
  __$$LyricResponseImplCopyWithImpl(
      _$LyricResponseImpl _value, $Res Function(_$LyricResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LyricResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? text = null,
  }) {
    return _then(_$LyricResponseImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LyricResponseImpl implements _LyricResponse {
  const _$LyricResponseImpl(
      {required this.start, required this.end, required this.text});

  factory _$LyricResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LyricResponseImplFromJson(json);

  @override
  final double start;
  @override
  final double end;
  @override
  final String text;

  @override
  String toString() {
    return 'LyricResponse(start: $start, end: $end, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricResponseImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end, text);

  /// Create a copy of LyricResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricResponseImplCopyWith<_$LyricResponseImpl> get copyWith =>
      __$$LyricResponseImplCopyWithImpl<_$LyricResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LyricResponseImplToJson(
      this,
    );
  }
}

abstract class _LyricResponse implements LyricResponse {
  const factory _LyricResponse(
      {required final double start,
      required final double end,
      required final String text}) = _$LyricResponseImpl;

  factory _LyricResponse.fromJson(Map<String, dynamic> json) =
      _$LyricResponseImpl.fromJson;

  @override
  double get start;
  @override
  double get end;
  @override
  String get text;

  /// Create a copy of LyricResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LyricResponseImplCopyWith<_$LyricResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
