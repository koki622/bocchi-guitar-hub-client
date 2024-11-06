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
      jobId: fields[0] as String,
      jobStatus: fields[1] as String,
      queuePosition: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$JobStatusDataImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.jobId)
      ..writeByte(1)
      ..write(obj.jobStatus)
      ..writeByte(2)
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
      jobId: json['job_id'] as String,
      jobStatus: json['job_status'] as String,
      queuePosition: (json['queue_position'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$JobStatusDataImplToJson(_$JobStatusDataImpl instance) =>
    <String, dynamic>{
      'job_id': instance.jobId,
      'job_status': instance.jobStatus,
      'queue_position': instance.queuePosition,
    };
