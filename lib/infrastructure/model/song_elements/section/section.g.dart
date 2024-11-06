// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SectionDataAdapter extends TypeAdapter<SectionData> {
  @override
  final int typeId = 8;

  @override
  SectionData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SectionData(
      section: fields[0] as String,
      start: fields[1] as double,
      end: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SectionData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.section)
      ..writeByte(1)
      ..write(obj.start)
      ..writeByte(2)
      ..write(obj.end);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SectionDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SectionsDataImplAdapter extends TypeAdapter<_$SectionsDataImpl> {
  @override
  final int typeId = 7;

  @override
  _$SectionsDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SectionsDataImpl(
      sections: (fields[0] as List).cast<SectionData>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$SectionsDataImpl obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.sections);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SectionsDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
