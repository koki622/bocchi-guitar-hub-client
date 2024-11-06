// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chord.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChordDataAdapter extends TypeAdapter<ChordData> {
  @override
  final int typeId = 4;

  @override
  ChordData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChordData(
      chord: fields[0] as String,
      time: fields[1] as double,
      duration: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ChordData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.chord)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChordDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChordsDataImplAdapter extends TypeAdapter<_$ChordsDataImpl> {
  @override
  final int typeId = 3;

  @override
  _$ChordsDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ChordsDataImpl(
      chords: (fields[0] as List).cast<ChordData>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$ChordsDataImpl obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.chords);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChordsDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
