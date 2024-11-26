// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'click_sound.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClicksoundDataImplAdapter extends TypeAdapter<_$ClicksoundDataImpl> {
  @override
  final int typeId = 12;

  @override
  _$ClicksoundDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ClicksoundDataImpl(
      normalClickPath: fields[0] as String?,
      x2Path: fields[1] as String?,
      halfPath: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$ClicksoundDataImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.normalClickPath)
      ..writeByte(1)
      ..write(obj.x2Path)
      ..writeByte(2)
      ..write(obj.halfPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClicksoundDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
