// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_elements_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChordState {
  List<Chord> get chords => throw _privateConstructorUsedError;
  int get capo => throw _privateConstructorUsedError;

  /// Create a copy of ChordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChordStateCopyWith<ChordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChordStateCopyWith<$Res> {
  factory $ChordStateCopyWith(
          ChordState value, $Res Function(ChordState) then) =
      _$ChordStateCopyWithImpl<$Res, ChordState>;
  @useResult
  $Res call({List<Chord> chords, int capo});
}

/// @nodoc
class _$ChordStateCopyWithImpl<$Res, $Val extends ChordState>
    implements $ChordStateCopyWith<$Res> {
  _$ChordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chords = null,
    Object? capo = null,
  }) {
    return _then(_value.copyWith(
      chords: null == chords
          ? _value.chords
          : chords // ignore: cast_nullable_to_non_nullable
              as List<Chord>,
      capo: null == capo
          ? _value.capo
          : capo // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChordStateImplCopyWith<$Res>
    implements $ChordStateCopyWith<$Res> {
  factory _$$ChordStateImplCopyWith(
          _$ChordStateImpl value, $Res Function(_$ChordStateImpl) then) =
      __$$ChordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Chord> chords, int capo});
}

/// @nodoc
class __$$ChordStateImplCopyWithImpl<$Res>
    extends _$ChordStateCopyWithImpl<$Res, _$ChordStateImpl>
    implements _$$ChordStateImplCopyWith<$Res> {
  __$$ChordStateImplCopyWithImpl(
      _$ChordStateImpl _value, $Res Function(_$ChordStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chords = null,
    Object? capo = null,
  }) {
    return _then(_$ChordStateImpl(
      chords: null == chords
          ? _value._chords
          : chords // ignore: cast_nullable_to_non_nullable
              as List<Chord>,
      capo: null == capo
          ? _value.capo
          : capo // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChordStateImpl implements _ChordState {
  _$ChordStateImpl({required final List<Chord> chords, required this.capo})
      : _chords = chords;

  final List<Chord> _chords;
  @override
  List<Chord> get chords {
    if (_chords is EqualUnmodifiableListView) return _chords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chords);
  }

  @override
  final int capo;

  @override
  String toString() {
    return 'ChordState(chords: $chords, capo: $capo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChordStateImpl &&
            const DeepCollectionEquality().equals(other._chords, _chords) &&
            (identical(other.capo, capo) || other.capo == capo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_chords), capo);

  /// Create a copy of ChordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChordStateImplCopyWith<_$ChordStateImpl> get copyWith =>
      __$$ChordStateImplCopyWithImpl<_$ChordStateImpl>(this, _$identity);
}

abstract class _ChordState implements ChordState {
  factory _ChordState(
      {required final List<Chord> chords,
      required final int capo}) = _$ChordStateImpl;

  @override
  List<Chord> get chords;
  @override
  int get capo;

  /// Create a copy of ChordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChordStateImplCopyWith<_$ChordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
