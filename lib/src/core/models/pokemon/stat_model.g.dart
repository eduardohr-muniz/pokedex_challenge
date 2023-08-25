// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatModelAdapter extends TypeAdapter<StatModel> {
  @override
  final int typeId = 1;

  @override
  StatModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatModel(
      baseStat: fields[0] as double,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StatModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.baseStat)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
