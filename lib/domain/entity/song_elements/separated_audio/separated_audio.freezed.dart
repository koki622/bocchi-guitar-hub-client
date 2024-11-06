// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'separated_audio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SeparatedAudio {
  String get vocalsPath => throw _privateConstructorUsedError;
  String get drumsPath => throw _privateConstructorUsedError;
  String get bassPath => throw _privateConstructorUsedError;
  String get guitarPath => throw _privateConstructorUsedError;
  String get pianoPath => throw _privateConstructorUsedError;
  String get otherPath => throw _privateConstructorUsedError;

  /// Create a copy of SeparatedAudio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeparatedAudioCopyWith<SeparatedAudio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeparatedAudioCopyWith<$Res> {
  factory $SeparatedAudioCopyWith(
          SeparatedAudio value, $Res Function(SeparatedAudio) then) =
      _$SeparatedAudioCopyWithImpl<$Res, SeparatedAudio>;
  @useResult
  $Res call(
      {String vocalsPath,
      String drumsPath,
      String bassPath,
      String guitarPath,
      String pianoPath,
      String otherPath});
}

/// @nodoc
class _$SeparatedAudioCopyWithImpl<$Res, $Val extends SeparatedAudio>
    implements $SeparatedAudioCopyWith<$Res> {
  _$SeparatedAudioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeparatedAudio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vocalsPath = null,
    Object? drumsPath = null,
    Object? bassPath = null,
    Object? guitarPath = null,
    Object? pianoPath = null,
    Object? otherPath = null,
  }) {
    return _then(_value.copyWith(
      vocalsPath: null == vocalsPath
          ? _value.vocalsPath
          : vocalsPath // ignore: cast_nullable_to_non_nullable
              as String,
      drumsPath: null == drumsPath
          ? _value.drumsPath
          : drumsPath // ignore: cast_nullable_to_non_nullable
              as String,
      bassPath: null == bassPath
          ? _value.bassPath
          : bassPath // ignore: cast_nullable_to_non_nullable
              as String,
      guitarPath: null == guitarPath
          ? _value.guitarPath
          : guitarPath // ignore: cast_nullable_to_non_nullable
              as String,
      pianoPath: null == pianoPath
          ? _value.pianoPath
          : pianoPath // ignore: cast_nullable_to_non_nullable
              as String,
      otherPath: null == otherPath
          ? _value.otherPath
          : otherPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeparatedAudioImplCopyWith<$Res>
    implements $SeparatedAudioCopyWith<$Res> {
  factory _$$SeparatedAudioImplCopyWith(_$SeparatedAudioImpl value,
          $Res Function(_$SeparatedAudioImpl) then) =
      __$$SeparatedAudioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String vocalsPath,
      String drumsPath,
      String bassPath,
      String guitarPath,
      String pianoPath,
      String otherPath});
}

/// @nodoc
class __$$SeparatedAudioImplCopyWithImpl<$Res>
    extends _$SeparatedAudioCopyWithImpl<$Res, _$SeparatedAudioImpl>
    implements _$$SeparatedAudioImplCopyWith<$Res> {
  __$$SeparatedAudioImplCopyWithImpl(
      _$SeparatedAudioImpl _value, $Res Function(_$SeparatedAudioImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeparatedAudio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vocalsPath = null,
    Object? drumsPath = null,
    Object? bassPath = null,
    Object? guitarPath = null,
    Object? pianoPath = null,
    Object? otherPath = null,
  }) {
    return _then(_$SeparatedAudioImpl(
      vocalsPath: null == vocalsPath
          ? _value.vocalsPath
          : vocalsPath // ignore: cast_nullable_to_non_nullable
              as String,
      drumsPath: null == drumsPath
          ? _value.drumsPath
          : drumsPath // ignore: cast_nullable_to_non_nullable
              as String,
      bassPath: null == bassPath
          ? _value.bassPath
          : bassPath // ignore: cast_nullable_to_non_nullable
              as String,
      guitarPath: null == guitarPath
          ? _value.guitarPath
          : guitarPath // ignore: cast_nullable_to_non_nullable
              as String,
      pianoPath: null == pianoPath
          ? _value.pianoPath
          : pianoPath // ignore: cast_nullable_to_non_nullable
              as String,
      otherPath: null == otherPath
          ? _value.otherPath
          : otherPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SeparatedAudioImpl implements _SeparatedAudio {
  _$SeparatedAudioImpl(
      {required this.vocalsPath,
      required this.drumsPath,
      required this.bassPath,
      required this.guitarPath,
      required this.pianoPath,
      required this.otherPath});

  @override
  final String vocalsPath;
  @override
  final String drumsPath;
  @override
  final String bassPath;
  @override
  final String guitarPath;
  @override
  final String pianoPath;
  @override
  final String otherPath;

  @override
  String toString() {
    return 'SeparatedAudio(vocalsPath: $vocalsPath, drumsPath: $drumsPath, bassPath: $bassPath, guitarPath: $guitarPath, pianoPath: $pianoPath, otherPath: $otherPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeparatedAudioImpl &&
            (identical(other.vocalsPath, vocalsPath) ||
                other.vocalsPath == vocalsPath) &&
            (identical(other.drumsPath, drumsPath) ||
                other.drumsPath == drumsPath) &&
            (identical(other.bassPath, bassPath) ||
                other.bassPath == bassPath) &&
            (identical(other.guitarPath, guitarPath) ||
                other.guitarPath == guitarPath) &&
            (identical(other.pianoPath, pianoPath) ||
                other.pianoPath == pianoPath) &&
            (identical(other.otherPath, otherPath) ||
                other.otherPath == otherPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vocalsPath, drumsPath, bassPath,
      guitarPath, pianoPath, otherPath);

  /// Create a copy of SeparatedAudio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeparatedAudioImplCopyWith<_$SeparatedAudioImpl> get copyWith =>
      __$$SeparatedAudioImplCopyWithImpl<_$SeparatedAudioImpl>(
          this, _$identity);
}

abstract class _SeparatedAudio implements SeparatedAudio {
  factory _SeparatedAudio(
      {required final String vocalsPath,
      required final String drumsPath,
      required final String bassPath,
      required final String guitarPath,
      required final String pianoPath,
      required final String otherPath}) = _$SeparatedAudioImpl;

  @override
  String get vocalsPath;
  @override
  String get drumsPath;
  @override
  String get bassPath;
  @override
  String get guitarPath;
  @override
  String get pianoPath;
  @override
  String get otherPath;

  /// Create a copy of SeparatedAudio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeparatedAudioImplCopyWith<_$SeparatedAudioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
