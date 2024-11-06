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

/// @nodoc
mixin _$SongData {
  @HiveField(0)
  String? get audioFileId => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String get processType => throw _privateConstructorUsedError;
  @HiveField(3)
  String get processStatusType => throw _privateConstructorUsedError;
  @HiveField(4)
  String get filePath => throw _privateConstructorUsedError;
  @HiveField(5)
  String get directoryPath => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of SongData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SongDataCopyWith<SongData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongDataCopyWith<$Res> {
  factory $SongDataCopyWith(SongData value, $Res Function(SongData) then) =
      _$SongDataCopyWithImpl<$Res, SongData>;
  @useResult
  $Res call(
      {@HiveField(0) String? audioFileId,
      @HiveField(1) String title,
      @HiveField(2) String processType,
      @HiveField(3) String processStatusType,
      @HiveField(4) String filePath,
      @HiveField(5) String directoryPath,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) DateTime? updatedAt});
}

/// @nodoc
class _$SongDataCopyWithImpl<$Res, $Val extends SongData>
    implements $SongDataCopyWith<$Res> {
  _$SongDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SongData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioFileId = freezed,
    Object? title = null,
    Object? processType = null,
    Object? processStatusType = null,
    Object? filePath = null,
    Object? directoryPath = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      audioFileId: freezed == audioFileId
          ? _value.audioFileId
          : audioFileId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      processType: null == processType
          ? _value.processType
          : processType // ignore: cast_nullable_to_non_nullable
              as String,
      processStatusType: null == processStatusType
          ? _value.processStatusType
          : processStatusType // ignore: cast_nullable_to_non_nullable
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
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongDataImplCopyWith<$Res>
    implements $SongDataCopyWith<$Res> {
  factory _$$SongDataImplCopyWith(
          _$SongDataImpl value, $Res Function(_$SongDataImpl) then) =
      __$$SongDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? audioFileId,
      @HiveField(1) String title,
      @HiveField(2) String processType,
      @HiveField(3) String processStatusType,
      @HiveField(4) String filePath,
      @HiveField(5) String directoryPath,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) DateTime? updatedAt});
}

/// @nodoc
class __$$SongDataImplCopyWithImpl<$Res>
    extends _$SongDataCopyWithImpl<$Res, _$SongDataImpl>
    implements _$$SongDataImplCopyWith<$Res> {
  __$$SongDataImplCopyWithImpl(
      _$SongDataImpl _value, $Res Function(_$SongDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SongData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioFileId = freezed,
    Object? title = null,
    Object? processType = null,
    Object? processStatusType = null,
    Object? filePath = null,
    Object? directoryPath = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SongDataImpl(
      audioFileId: freezed == audioFileId
          ? _value.audioFileId
          : audioFileId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      processType: null == processType
          ? _value.processType
          : processType // ignore: cast_nullable_to_non_nullable
              as String,
      processStatusType: null == processStatusType
          ? _value.processStatusType
          : processStatusType // ignore: cast_nullable_to_non_nullable
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
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: HiveBoxConstant.songBoxTypeId)
class _$SongDataImpl implements _SongData {
  const _$SongDataImpl(
      {@HiveField(0) this.audioFileId,
      @HiveField(1) required this.title,
      @HiveField(2) required this.processType,
      @HiveField(3) required this.processStatusType,
      @HiveField(4) required this.filePath,
      @HiveField(5) required this.directoryPath,
      @HiveField(6) required this.createdAt,
      @HiveField(7) this.updatedAt});

  @override
  @HiveField(0)
  final String? audioFileId;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String processType;
  @override
  @HiveField(3)
  final String processStatusType;
  @override
  @HiveField(4)
  final String filePath;
  @override
  @HiveField(5)
  final String directoryPath;
  @override
  @HiveField(6)
  final DateTime createdAt;
  @override
  @HiveField(7)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'SongData(audioFileId: $audioFileId, title: $title, processType: $processType, processStatusType: $processStatusType, filePath: $filePath, directoryPath: $directoryPath, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongDataImpl &&
            (identical(other.audioFileId, audioFileId) ||
                other.audioFileId == audioFileId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.processType, processType) ||
                other.processType == processType) &&
            (identical(other.processStatusType, processStatusType) ||
                other.processStatusType == processStatusType) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioFileId, title, processType,
      processStatusType, filePath, directoryPath, createdAt, updatedAt);

  /// Create a copy of SongData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SongDataImplCopyWith<_$SongDataImpl> get copyWith =>
      __$$SongDataImplCopyWithImpl<_$SongDataImpl>(this, _$identity);
}

abstract class _SongData implements SongData {
  const factory _SongData(
      {@HiveField(0) final String? audioFileId,
      @HiveField(1) required final String title,
      @HiveField(2) required final String processType,
      @HiveField(3) required final String processStatusType,
      @HiveField(4) required final String filePath,
      @HiveField(5) required final String directoryPath,
      @HiveField(6) required final DateTime createdAt,
      @HiveField(7) final DateTime? updatedAt}) = _$SongDataImpl;

  @override
  @HiveField(0)
  String? get audioFileId;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  String get processType;
  @override
  @HiveField(3)
  String get processStatusType;
  @override
  @HiveField(4)
  String get filePath;
  @override
  @HiveField(5)
  String get directoryPath;
  @override
  @HiveField(6)
  DateTime get createdAt;
  @override
  @HiveField(7)
  DateTime? get updatedAt;

  /// Create a copy of SongData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SongDataImplCopyWith<_$SongDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
