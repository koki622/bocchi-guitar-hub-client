// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Song _$SongFromJson(Map<String, dynamic> json) {
  return _Song.fromJson(json);
}

/// @nodoc
mixin _$Song {
  int get songId => throw _privateConstructorUsedError;
  String get audioFileId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  String get directoryPath => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  AnalysisType get analysisType => throw _privateConstructorUsedError;
  AnalysisStatusType get analysisStatusType =>
      throw _privateConstructorUsedError;

  /// Serializes this Song to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Song
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SongCopyWith<Song> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCopyWith<$Res> {
  factory $SongCopyWith(Song value, $Res Function(Song) then) =
      _$SongCopyWithImpl<$Res, Song>;
  @useResult
  $Res call(
      {int songId,
      String audioFileId,
      String title,
      String filePath,
      String directoryPath,
      DateTime createdAt,
      AnalysisType analysisType,
      AnalysisStatusType analysisStatusType});
}

/// @nodoc
class _$SongCopyWithImpl<$Res, $Val extends Song>
    implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Song
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = null,
    Object? audioFileId = null,
    Object? title = null,
    Object? filePath = null,
    Object? directoryPath = null,
    Object? createdAt = null,
    Object? analysisType = null,
    Object? analysisStatusType = null,
  }) {
    return _then(_value.copyWith(
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as int,
      audioFileId: null == audioFileId
          ? _value.audioFileId
          : audioFileId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      analysisType: null == analysisType
          ? _value.analysisType
          : analysisType // ignore: cast_nullable_to_non_nullable
              as AnalysisType,
      analysisStatusType: null == analysisStatusType
          ? _value.analysisStatusType
          : analysisStatusType // ignore: cast_nullable_to_non_nullable
              as AnalysisStatusType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongImplCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$$SongImplCopyWith(
          _$SongImpl value, $Res Function(_$SongImpl) then) =
      __$$SongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int songId,
      String audioFileId,
      String title,
      String filePath,
      String directoryPath,
      DateTime createdAt,
      AnalysisType analysisType,
      AnalysisStatusType analysisStatusType});
}

/// @nodoc
class __$$SongImplCopyWithImpl<$Res>
    extends _$SongCopyWithImpl<$Res, _$SongImpl>
    implements _$$SongImplCopyWith<$Res> {
  __$$SongImplCopyWithImpl(_$SongImpl _value, $Res Function(_$SongImpl) _then)
      : super(_value, _then);

  /// Create a copy of Song
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = null,
    Object? audioFileId = null,
    Object? title = null,
    Object? filePath = null,
    Object? directoryPath = null,
    Object? createdAt = null,
    Object? analysisType = null,
    Object? analysisStatusType = null,
  }) {
    return _then(_$SongImpl(
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as int,
      audioFileId: null == audioFileId
          ? _value.audioFileId
          : audioFileId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      analysisType: null == analysisType
          ? _value.analysisType
          : analysisType // ignore: cast_nullable_to_non_nullable
              as AnalysisType,
      analysisStatusType: null == analysisStatusType
          ? _value.analysisStatusType
          : analysisStatusType // ignore: cast_nullable_to_non_nullable
              as AnalysisStatusType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongImpl implements _Song {
  _$SongImpl(
      {required this.songId,
      required this.audioFileId,
      required this.title,
      required this.filePath,
      required this.directoryPath,
      required this.createdAt,
      required this.analysisType,
      required this.analysisStatusType});

  factory _$SongImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongImplFromJson(json);

  @override
  final int songId;
  @override
  final String audioFileId;
  @override
  final String title;
  @override
  final String filePath;
  @override
  final String directoryPath;
  @override
  final DateTime createdAt;
  @override
  final AnalysisType analysisType;
  @override
  final AnalysisStatusType analysisStatusType;

  @override
  String toString() {
    return 'Song(songId: $songId, audioFileId: $audioFileId, title: $title, filePath: $filePath, directoryPath: $directoryPath, createdAt: $createdAt, analysisType: $analysisType, analysisStatusType: $analysisStatusType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongImpl &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.audioFileId, audioFileId) ||
                other.audioFileId == audioFileId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.analysisType, analysisType) ||
                other.analysisType == analysisType) &&
            (identical(other.analysisStatusType, analysisStatusType) ||
                other.analysisStatusType == analysisStatusType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, songId, audioFileId, title,
      filePath, directoryPath, createdAt, analysisType, analysisStatusType);

  /// Create a copy of Song
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SongImplCopyWith<_$SongImpl> get copyWith =>
      __$$SongImplCopyWithImpl<_$SongImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongImplToJson(
      this,
    );
  }
}

abstract class _Song implements Song {
  factory _Song(
      {required final int songId,
      required final String audioFileId,
      required final String title,
      required final String filePath,
      required final String directoryPath,
      required final DateTime createdAt,
      required final AnalysisType analysisType,
      required final AnalysisStatusType analysisStatusType}) = _$SongImpl;

  factory _Song.fromJson(Map<String, dynamic> json) = _$SongImpl.fromJson;

  @override
  int get songId;
  @override
  String get audioFileId;
  @override
  String get title;
  @override
  String get filePath;
  @override
  String get directoryPath;
  @override
  DateTime get createdAt;
  @override
  AnalysisType get analysisType;
  @override
  AnalysisStatusType get analysisStatusType;

  /// Create a copy of Song
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SongImplCopyWith<_$SongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewSong {
  String get title => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;

  /// Create a copy of NewSong
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewSongCopyWith<NewSong> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewSongCopyWith<$Res> {
  factory $NewSongCopyWith(NewSong value, $Res Function(NewSong) then) =
      _$NewSongCopyWithImpl<$Res, NewSong>;
  @useResult
  $Res call({String title, String filePath});
}

/// @nodoc
class _$NewSongCopyWithImpl<$Res, $Val extends NewSong>
    implements $NewSongCopyWith<$Res> {
  _$NewSongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewSong
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? filePath = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewSongImplCopyWith<$Res> implements $NewSongCopyWith<$Res> {
  factory _$$NewSongImplCopyWith(
          _$NewSongImpl value, $Res Function(_$NewSongImpl) then) =
      __$$NewSongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String filePath});
}

/// @nodoc
class __$$NewSongImplCopyWithImpl<$Res>
    extends _$NewSongCopyWithImpl<$Res, _$NewSongImpl>
    implements _$$NewSongImplCopyWith<$Res> {
  __$$NewSongImplCopyWithImpl(
      _$NewSongImpl _value, $Res Function(_$NewSongImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewSong
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? filePath = null,
  }) {
    return _then(_$NewSongImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NewSongImpl implements _NewSong {
  _$NewSongImpl({required this.title, required this.filePath});

  @override
  final String title;
  @override
  final String filePath;

  @override
  String toString() {
    return 'NewSong(title: $title, filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewSongImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, filePath);

  /// Create a copy of NewSong
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewSongImplCopyWith<_$NewSongImpl> get copyWith =>
      __$$NewSongImplCopyWithImpl<_$NewSongImpl>(this, _$identity);
}

abstract class _NewSong implements NewSong {
  factory _NewSong(
      {required final String title,
      required final String filePath}) = _$NewSongImpl;

  @override
  String get title;
  @override
  String get filePath;

  /// Create a copy of NewSong
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewSongImplCopyWith<_$NewSongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
