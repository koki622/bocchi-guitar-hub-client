// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BeatDataAdapter extends TypeAdapter<BeatData> {
  @override
  final int typeId = 6;

  @override
  BeatData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BeatData(
      beatPosition: fields[0] as double,
      beatTime: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BeatData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.beatPosition)
      ..writeByte(1)
      ..write(obj.beatTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BeatDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BeatsDataImplAdapter extends TypeAdapter<_$BeatsDataImpl> {
  @override
  final int typeId = 5;

  @override
  _$BeatsDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$BeatsDataImpl(
      bpm: fields[0] as int,
      beats: (fields[1] as List).cast<BeatData>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$BeatsDataImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.bpm)
      ..writeByte(1)
      ..write(obj.beats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BeatsDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
