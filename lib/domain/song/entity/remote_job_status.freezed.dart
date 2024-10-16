// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_job_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteJobStatus _$RemoteJobStatusFromJson(Map<String, dynamic> json) {
  return _RemoteJobStatus.fromJson(json);
}

/// @nodoc
mixin _$RemoteJobStatus {
  AnalysisType get analysisType => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_id')
  String get jobId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_status')
  JobStatusType get jobStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'queue_position')
  int get queuePosition => throw _privateConstructorUsedError;

  /// Serializes this RemoteJobStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemoteJobStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoteJobStatusCopyWith<RemoteJobStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteJobStatusCopyWith<$Res> {
  factory $RemoteJobStatusCopyWith(
          RemoteJobStatus value, $Res Function(RemoteJobStatus) then) =
      _$RemoteJobStatusCopyWithImpl<$Res, RemoteJobStatus>;
  @useResult
  $Res call(
      {AnalysisType analysisType,
      @JsonKey(name: 'job_id') String jobId,
      @JsonKey(name: 'job_status') JobStatusType jobStatus,
      @JsonKey(name: 'queue_position') int queuePosition});
}

/// @nodoc
class _$RemoteJobStatusCopyWithImpl<$Res, $Val extends RemoteJobStatus>
    implements $RemoteJobStatusCopyWith<$Res> {
  _$RemoteJobStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteJobStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analysisType = null,
    Object? jobId = null,
    Object? jobStatus = null,
    Object? queuePosition = null,
  }) {
    return _then(_value.copyWith(
      analysisType: null == analysisType
          ? _value.analysisType
          : analysisType // ignore: cast_nullable_to_non_nullable
              as AnalysisType,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      jobStatus: null == jobStatus
          ? _value.jobStatus
          : jobStatus // ignore: cast_nullable_to_non_nullable
              as JobStatusType,
      queuePosition: null == queuePosition
          ? _value.queuePosition
          : queuePosition // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteJobStatusImplCopyWith<$Res>
    implements $RemoteJobStatusCopyWith<$Res> {
  factory _$$RemoteJobStatusImplCopyWith(_$RemoteJobStatusImpl value,
          $Res Function(_$RemoteJobStatusImpl) then) =
      __$$RemoteJobStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AnalysisType analysisType,
      @JsonKey(name: 'job_id') String jobId,
      @JsonKey(name: 'job_status') JobStatusType jobStatus,
      @JsonKey(name: 'queue_position') int queuePosition});
}

/// @nodoc
class __$$RemoteJobStatusImplCopyWithImpl<$Res>
    extends _$RemoteJobStatusCopyWithImpl<$Res, _$RemoteJobStatusImpl>
    implements _$$RemoteJobStatusImplCopyWith<$Res> {
  __$$RemoteJobStatusImplCopyWithImpl(
      _$RemoteJobStatusImpl _value, $Res Function(_$RemoteJobStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteJobStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analysisType = null,
    Object? jobId = null,
    Object? jobStatus = null,
    Object? queuePosition = null,
  }) {
    return _then(_$RemoteJobStatusImpl(
      analysisType: null == analysisType
          ? _value.analysisType
          : analysisType // ignore: cast_nullable_to_non_nullable
              as AnalysisType,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      jobStatus: null == jobStatus
          ? _value.jobStatus
          : jobStatus // ignore: cast_nullable_to_non_nullable
              as JobStatusType,
      queuePosition: null == queuePosition
          ? _value.queuePosition
          : queuePosition // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteJobStatusImpl implements _RemoteJobStatus {
  _$RemoteJobStatusImpl(
      {required this.analysisType,
      @JsonKey(name: 'job_id') required this.jobId,
      @JsonKey(name: 'job_status') required this.jobStatus,
      @JsonKey(name: 'queue_position') required this.queuePosition});

  factory _$RemoteJobStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteJobStatusImplFromJson(json);

  @override
  final AnalysisType analysisType;
  @override
  @JsonKey(name: 'job_id')
  final String jobId;
  @override
  @JsonKey(name: 'job_status')
  final JobStatusType jobStatus;
  @override
  @JsonKey(name: 'queue_position')
  final int queuePosition;

  @override
  String toString() {
    return 'RemoteJobStatus(analysisType: $analysisType, jobId: $jobId, jobStatus: $jobStatus, queuePosition: $queuePosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteJobStatusImpl &&
            (identical(other.analysisType, analysisType) ||
                other.analysisType == analysisType) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.jobStatus, jobStatus) ||
                other.jobStatus == jobStatus) &&
            (identical(other.queuePosition, queuePosition) ||
                other.queuePosition == queuePosition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, analysisType, jobId, jobStatus, queuePosition);

  /// Create a copy of RemoteJobStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteJobStatusImplCopyWith<_$RemoteJobStatusImpl> get copyWith =>
      __$$RemoteJobStatusImplCopyWithImpl<_$RemoteJobStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteJobStatusImplToJson(
      this,
    );
  }
}

abstract class _RemoteJobStatus implements RemoteJobStatus {
  factory _RemoteJobStatus(
          {required final AnalysisType analysisType,
          @JsonKey(name: 'job_id') required final String jobId,
          @JsonKey(name: 'job_status') required final JobStatusType jobStatus,
          @JsonKey(name: 'queue_position') required final int queuePosition}) =
      _$RemoteJobStatusImpl;

  factory _RemoteJobStatus.fromJson(Map<String, dynamic> json) =
      _$RemoteJobStatusImpl.fromJson;

  @override
  AnalysisType get analysisType;
  @override
  @JsonKey(name: 'job_id')
  String get jobId;
  @override
  @JsonKey(name: 'job_status')
  JobStatusType get jobStatus;
  @override
  @JsonKey(name: 'queue_position')
  int get queuePosition;

  /// Create a copy of RemoteJobStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteJobStatusImplCopyWith<_$RemoteJobStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
