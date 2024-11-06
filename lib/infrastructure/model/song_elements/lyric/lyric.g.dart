// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LyricDataAdapter extends TypeAdapter<LyricData> {
  @override
  final int typeId = 10;

  @override
  LyricData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LyricData(
      segmentedLyric: fields[0] as String,
      start: fields[1] as double,
      end: fields[2] as double,
      words: (fields[3] as List).cast<LyricWordData>(),
    );
  }

  @override
  void write(BinaryWriter writer, LyricData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.segmentedLyric)
      ..writeByte(1)
      ..write(obj.start)
      ..writeByte(2)
      ..write(obj.end)
      ..writeByte(3)
      ..write(obj.words);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LyricDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LyricWordDataAdapter extends TypeAdapter<LyricWordData> {
  @override
  final int typeId = 11;

  @override
  LyricWordData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LyricWordData(
      word: fields[0] as String,
      start: fields[1] as double,
      end: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LyricWordData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.word)
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
      other is LyricWordDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LyricsDataImplAdapter extends TypeAdapter<_$LyricsDataImpl> {
  @override
  final int typeId = 9;

  @override
  _$LyricsDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$LyricsDataImpl(
      lyrics: (fields[0] as List).cast<LyricData>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$LyricsDataImpl obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.lyrics);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LyricsDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
