import 'dart:convert';
part 'stats.dart';
part 'type_entity.dart';
part 'moves_entities.dart';

class PokemonEntity {
  int id;
  int baseExperience;
  double height;
  double weight;
  bool isDefault;
  String name;
  int order;
  List<Stats> stats;
  List<TypeEntity> types;
  List<PokemonEntity> evolutions;
  PokemonEntity({
    this.id = 0,
    this.baseExperience = 0,
    this.height = 0.0,
    this.weight = 0.0,
    this.isDefault = false,
    this.name = '',
    this.order = 0,
    this.stats = const [],
    this.evolutions = const [],
    this.types = const [],
  });
}
