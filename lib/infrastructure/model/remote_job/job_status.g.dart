// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobStatusDataImplAdapter extends TypeAdapter<_$JobStatusDataImpl> {
  @override
  final int typeId = 1;

  @override
  _$JobStatusDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$JobStatusDataImpl(
      jobName: fields[0] as String,
      jobId: fields[1] as String,
      jobStatus: fields[2] as String,
      queuePosition: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$JobStatusDataImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.jobName)
      ..writeByte(1)
      ..write(obj.jobId)
      ..writeByte(2)
      ..write(obj.jobStatus)
      ..writeByte(3)
      ..write(obj.queuePosition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobStatusDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobStatusDataImpl _$$JobStatusDataImplFromJson(Map<String, dynamic> json) =>
    _$JobStatusDataImpl(
      jobName: json['job_name'] as String,
      jobId: json['job_id'] as String,
      jobStatus: json['job_status'] as String,
      queuePosition: (json['queue_position'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$JobStatusDataImplToJson(_$JobStatusDataImpl instance) =>
    <String, dynamic>{
      'job_name': instance.jobName,
      'job_id': instance.jobId,
      'job_status': instance.jobStatus,
      'queue_position': instance.queuePosition,
    };
