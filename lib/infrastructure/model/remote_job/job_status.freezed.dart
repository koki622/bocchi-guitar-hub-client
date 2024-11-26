// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobStatusData _$JobStatusDataFromJson(Map<String, dynamic> json) {
  return _JobStatusData.fromJson(json);
}

/// @nodoc
mixin _$JobStatusData {
  @JsonKey(name: 'job_name')
  @HiveField(0)
  String get jobName => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_id')
  @HiveField(1)
  String get jobId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_status')
  @HiveField(2)
  String get jobStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'queue_position', defaultValue: -1)
  @HiveField(3)
  int get queuePosition => throw _privateConstructorUsedError;

  /// Serializes this JobStatusData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobStatusDataCopyWith<JobStatusData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobStatusDataCopyWith<$Res> {
  factory $JobStatusDataCopyWith(
          JobStatusData value, $Res Function(JobStatusData) then) =
      _$JobStatusDataCopyWithImpl<$Res, JobStatusData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'job_name') @HiveField(0) String jobName,
      @JsonKey(name: 'job_id') @HiveField(1) String jobId,
      @JsonKey(name: 'job_status') @HiveField(2) String jobStatus,
      @JsonKey(name: 'queue_position', defaultValue: -1)
      @HiveField(3)
      int queuePosition});
}

/// @nodoc
class _$JobStatusDataCopyWithImpl<$Res, $Val extends JobStatusData>
    implements $JobStatusDataCopyWith<$Res> {
  _$JobStatusDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobName = null,
    Object? jobId = null,
    Object? jobStatus = null,
    Object? queuePosition = null,
  }) {
    return _then(_value.copyWith(
      jobName: null == jobName
          ? _value.jobName
          : jobName // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      jobStatus: null == jobStatus
          ? _value.jobStatus
          : jobStatus // ignore: cast_nullable_to_non_nullable
              as String,
      queuePosition: null == queuePosition
          ? _value.queuePosition
          : queuePosition // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobStatusDataImplCopyWith<$Res>
    implements $JobStatusDataCopyWith<$Res> {
  factory _$$JobStatusDataImplCopyWith(
          _$JobStatusDataImpl value, $Res Function(_$JobStatusDataImpl) then) =
      __$$JobStatusDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'job_name') @HiveField(0) String jobName,
      @JsonKey(name: 'job_id') @HiveField(1) String jobId,
      @JsonKey(name: 'job_status') @HiveField(2) String jobStatus,
      @JsonKey(name: 'queue_position', defaultValue: -1)
      @HiveField(3)
      int queuePosition});
}

/// @nodoc
class __$$JobStatusDataImplCopyWithImpl<$Res>
    extends _$JobStatusDataCopyWithImpl<$Res, _$JobStatusDataImpl>
    implements _$$JobStatusDataImplCopyWith<$Res> {
  __$$JobStatusDataImplCopyWithImpl(
      _$JobStatusDataImpl _value, $Res Function(_$JobStatusDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobStatusData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobName = null,
    Object? jobId = null,
    Object? jobStatus = null,
    Object? queuePosition = null,
  }) {
    return _then(_$JobStatusDataImpl(
      jobName: null == jobName
          ? _value.jobName
          : jobName // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      jobStatus: null == jobStatus
          ? _value.jobStatus
          : jobStatus // ignore: cast_nullable_to_non_nullable
              as String,
      queuePosition: null == queuePosition
          ? _value.queuePosition
          : queuePosition // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveBoxConstant.jobStatusBoxTypeId)
class _$JobStatusDataImpl implements _JobStatusData {
  const _$JobStatusDataImpl(
      {@JsonKey(name: 'job_name') @HiveField(0) required this.jobName,
      @JsonKey(name: 'job_id') @HiveField(1) required this.jobId,
      @JsonKey(name: 'job_status') @HiveField(2) required this.jobStatus,
      @JsonKey(name: 'queue_position', defaultValue: -1)
      @HiveField(3)
      required this.queuePosition});

  factory _$JobStatusDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobStatusDataImplFromJson(json);

  @override
  @JsonKey(name: 'job_name')
  @HiveField(0)
  final String jobName;
  @override
  @JsonKey(name: 'job_id')
  @HiveField(1)
  final String jobId;
  @override
  @JsonKey(name: 'job_status')
  @HiveField(2)
  final String jobStatus;
  @override
  @JsonKey(name: 'queue_position', defaultValue: -1)
  @HiveField(3)
  final int queuePosition;

  @override
  String toString() {
    return 'JobStatusData(jobName: $jobName, jobId: $jobId, jobStatus: $jobStatus, queuePosition: $queuePosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobStatusDataImpl &&
            (identical(other.jobName, jobName) || other.jobName == jobName) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.jobStatus, jobStatus) ||
                other.jobStatus == jobStatus) &&
            (identical(other.queuePosition, queuePosition) ||
                other.queuePosition == queuePosition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, jobName, jobId, jobStatus, queuePosition);

  /// Create a copy of JobStatusData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobStatusDataImplCopyWith<_$JobStatusDataImpl> get copyWith =>
      __$$JobStatusDataImplCopyWithImpl<_$JobStatusDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobStatusDataImplToJson(
      this,
    );
  }
}

abstract class _JobStatusData implements JobStatusData {
  const factory _JobStatusData(
      {@JsonKey(name: 'job_name') @HiveField(0) required final String jobName,
      @JsonKey(name: 'job_id') @HiveField(1) required final String jobId,
      @JsonKey(name: 'job_status')
      @HiveField(2)
      required final String jobStatus,
      @JsonKey(name: 'queue_position', defaultValue: -1)
      @HiveField(3)
      required final int queuePosition}) = _$JobStatusDataImpl;

  factory _JobStatusData.fromJson(Map<String, dynamic> json) =
      _$JobStatusDataImpl.fromJson;

  @override
  @JsonKey(name: 'job_name')
  @HiveField(0)
  String get jobName;
  @override
  @JsonKey(name: 'job_id')
  @HiveField(1)
  String get jobId;
  @override
  @JsonKey(name: 'job_status')
  @HiveField(2)
  String get jobStatus;
  @override
  @JsonKey(name: 'queue_position', defaultValue: -1)
  @HiveField(3)
  int get queuePosition;

  /// Create a copy of JobStatusData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobStatusDataImplCopyWith<_$JobStatusDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
