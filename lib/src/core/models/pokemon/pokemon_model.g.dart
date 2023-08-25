// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonModelAdapter extends TypeAdapter<PokemonModel> {
  @override
  final int typeId = 0;

  @override
  PokemonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonModel(
      id: fields[0] as int,
      baseExperience: fields[1] as int,
      height: fields[2] as double,
      weight: fields[3] as double,
      isDefault: fields[4] as bool,
      name: fields[5] as String,
      order: fields[6] as int,
      stats: (fields[8] as List).cast<StatsModel>(),
      evolutions: (fields[10] as List).cast<PokemonModel>(),
      types: (fields[9] as List).cast<TypeModel>(),
      urlImage: fields[7] as String,
      abilities: (fields[11] as List).cast<AbilityModel>(),
      moves: (fields[12] as List).cast<MovesModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, PokemonModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.baseExperience)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.isDefault)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.order)
      ..writeByte(7)
      ..write(obj.urlImage)
      ..writeByte(8)
      ..write(obj.stats)
      ..writeByte(9)
      ..write(obj.types)
      ..writeByte(10)
      ..write(obj.evolutions)
      ..writeByte(11)
      ..write(obj.abilities)
      ..writeByte(12)
      ..write(obj.moves);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
