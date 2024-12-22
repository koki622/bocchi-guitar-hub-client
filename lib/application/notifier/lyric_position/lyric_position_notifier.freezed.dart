// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyric_position_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WordLyricPosition {
  int get index => throw _privateConstructorUsedError;
  bool get isStarted => throw _privateConstructorUsedError;
  bool get isFinished => throw _privateConstructorUsedError;

  /// Create a copy of WordLyricPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordLyricPositionCopyWith<WordLyricPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordLyricPositionCopyWith<$Res> {
  factory $WordLyricPositionCopyWith(
          WordLyricPosition value, $Res Function(WordLyricPosition) then) =
      _$WordLyricPositionCopyWithImpl<$Res, WordLyricPosition>;
  @useResult
  $Res call({int index, bool isStarted, bool isFinished});
}

/// @nodoc
class _$WordLyricPositionCopyWithImpl<$Res, $Val extends WordLyricPosition>
    implements $WordLyricPositionCopyWith<$Res> {
  _$WordLyricPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordLyricPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? isStarted = null,
    Object? isFinished = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isStarted: null == isStarted
          ? _value.isStarted
          : isStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordLyricPositionImplCopyWith<$Res>
    implements $WordLyricPositionCopyWith<$Res> {
  factory _$$WordLyricPositionImplCopyWith(_$WordLyricPositionImpl value,
          $Res Function(_$WordLyricPositionImpl) then) =
      __$$WordLyricPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, bool isStarted, bool isFinished});
}

/// @nodoc
class __$$WordLyricPositionImplCopyWithImpl<$Res>
    extends _$WordLyricPositionCopyWithImpl<$Res, _$WordLyricPositionImpl>
    implements _$$WordLyricPositionImplCopyWith<$Res> {
  __$$WordLyricPositionImplCopyWithImpl(_$WordLyricPositionImpl _value,
      $Res Function(_$WordLyricPositionImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordLyricPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? isStarted = null,
    Object? isFinished = null,
  }) {
    return _then(_$WordLyricPositionImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isStarted: null == isStarted
          ? _value.isStarted
          : isStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WordLyricPositionImpl implements _WordLyricPosition {
  _$WordLyricPositionImpl(
      {required this.index, required this.isStarted, required this.isFinished});

  @override
  final int index;
  @override
  final bool isStarted;
  @override
  final bool isFinished;

  @override
  String toString() {
    return 'WordLyricPosition(index: $index, isStarted: $isStarted, isFinished: $isFinished)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordLyricPositionImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.isStarted, isStarted) ||
                other.isStarted == isStarted) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, isStarted, isFinished);

  /// Create a copy of WordLyricPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordLyricPositionImplCopyWith<_$WordLyricPositionImpl> get copyWith =>
      __$$WordLyricPositionImplCopyWithImpl<_$WordLyricPositionImpl>(
          this, _$identity);
}

abstract class _WordLyricPosition implements WordLyricPosition {
  factory _WordLyricPosition(
      {required final int index,
      required final bool isStarted,
      required final bool isFinished}) = _$WordLyricPositionImpl;

  @override
  int get index;
  @override
  bool get isStarted;
  @override
  bool get isFinished;

  /// Create a copy of WordLyricPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordLyricPositionImplCopyWith<_$WordLyricPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
