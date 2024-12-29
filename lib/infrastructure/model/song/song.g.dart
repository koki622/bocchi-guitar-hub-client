// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SongDataImplAdapter extends TypeAdapter<_$SongDataImpl> {
  @override
  final int typeId = 0;

  @override
  _$SongDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SongDataImpl(
      audioFileId: fields[0] as String?,
      destApiServerType: fields[1] as String,
      title: fields[2] as String,
      processType: fields[3] as String,
      processStatusType: fields[4] as String,
      filePath: fields[5] as String,
      directoryPath: fields[6] as String,
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$SongDataImpl obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.audioFileId)
      ..writeByte(1)
      ..write(obj.destApiServerType)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.processType)
      ..writeByte(4)
      ..write(obj.processStatusType)
      ..writeByte(5)
      ..write(obj.filePath)
      ..writeByte(6)
      ..write(obj.directoryPath)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
