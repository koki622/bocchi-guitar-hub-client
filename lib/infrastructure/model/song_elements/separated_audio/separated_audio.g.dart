// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'separated_audio.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeparatedAudioDataImplAdapter
    extends TypeAdapter<_$SeparatedAudioDataImpl> {
  @override
  final int typeId = 2;

  @override
  _$SeparatedAudioDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SeparatedAudioDataImpl(
      vocalsPath: fields[0] as String,
      drumsPath: fields[1] as String,
      bassPath: fields[2] as String,
      guitarPath: fields[3] as String,
      pianoPath: fields[4] as String,
      otherPath: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$SeparatedAudioDataImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.vocalsPath)
      ..writeByte(1)
      ..write(obj.drumsPath)
      ..writeByte(2)
      ..write(obj.bassPath)
      ..writeByte(3)
      ..write(obj.guitarPath)
      ..writeByte(4)
      ..write(obj.pianoPath)
      ..writeByte(5)
      ..write(obj.otherPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeparatedAudioDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
