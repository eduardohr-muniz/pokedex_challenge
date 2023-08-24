// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moves_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovesModelAdapter extends TypeAdapter<MovesModel> {
  @override
  final int typeId = 3;

  @override
  MovesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovesModel(
      name: fields[0] as String,
      url: fields[1] as String,
      typeName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.typeName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
