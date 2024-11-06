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
mixin _$Chord {
  String get chord => throw _privateConstructorUsedError;
  double get time => throw _privateConstructorUsedError;
  double get duration => throw _privateConstructorUsedError;

  /// Create a copy of Chord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChordCopyWith<Chord> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChordCopyWith<$Res> {
  factory $ChordCopyWith(Chord value, $Res Function(Chord) then) =
      _$ChordCopyWithImpl<$Res, Chord>;
  @useResult
  $Res call({String chord, double time, double duration});
}

/// @nodoc
class _$ChordCopyWithImpl<$Res, $Val extends Chord>
    implements $ChordCopyWith<$Res> {
  _$ChordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Chord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chord = null,
    Object? time = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      chord: null == chord
          ? _value.chord
          : chord // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChordImplCopyWith<$Res> implements $ChordCopyWith<$Res> {
  factory _$$ChordImplCopyWith(
          _$ChordImpl value, $Res Function(_$ChordImpl) then) =
      __$$ChordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String chord, double time, double duration});
}

/// @nodoc
class __$$ChordImplCopyWithImpl<$Res>
    extends _$ChordCopyWithImpl<$Res, _$ChordImpl>
    implements _$$ChordImplCopyWith<$Res> {
  __$$ChordImplCopyWithImpl(
      _$ChordImpl _value, $Res Function(_$ChordImpl) _then)
      : super(_value, _then);

  /// Create a copy of Chord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chord = null,
    Object? time = null,
    Object? duration = null,
  }) {
    return _then(_$ChordImpl(
      chord: null == chord
          ? _value.chord
          : chord // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ChordImpl implements _Chord {
  _$ChordImpl(
      {required this.chord, required this.time, required this.duration});

  @override
  final String chord;
  @override
  final double time;
  @override
  final double duration;

  @override
  String toString() {
    return 'Chord(chord: $chord, time: $time, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChordImpl &&
            (identical(other.chord, chord) || other.chord == chord) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chord, time, duration);

  /// Create a copy of Chord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChordImplCopyWith<_$ChordImpl> get copyWith =>
      __$$ChordImplCopyWithImpl<_$ChordImpl>(this, _$identity);
}

abstract class _Chord implements Chord {
  factory _Chord(
      {required final String chord,
      required final double time,
      required final double duration}) = _$ChordImpl;

  @override
  String get chord;
  @override
  double get time;
  @override
  double get duration;

  /// Create a copy of Chord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChordImplCopyWith<_$ChordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
