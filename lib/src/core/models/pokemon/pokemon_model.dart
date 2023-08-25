import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/ability_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/move_model.dart';

import 'stat_model.dart';
import 'type_model.dart';

part 'pokemon_model.g.dart';

@HiveType(typeId: 0)
class PokemonModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  int baseExperience;
  @HiveField(2)
  double height;
  @HiveField(3)
  double weight;
  @HiveField(4)
  bool isFavorite;
  @HiveField(5)
  String name;
  @HiveField(6)
  int order;
  @HiveField(7)
  String urlImage;
  @HiveField(8)
  List<StatModel> stats;
  @HiveField(9)
  List<TypeModel> types;
  @HiveField(10)
  String evolutions;
  @HiveField(11)
  List<AbilityModel> abilities;
  @HiveField(12)
  List<MoveModel> moves;
  PokemonModel({
    required this.id,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.isFavorite,
    required this.name,
    required this.order,
    required this.stats,
    required this.evolutions,
    required this.types,
    required this.urlImage,
    required this.abilities,
    required this.moves,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'baseExperience': baseExperience,
      'height': height,
      'weight': weight,
      'isDefault': isFavorite,
      'name': name,
      'order': order,
      'stats': stats.map((x) => x.toMap()).toList(),
      'types': types.map((x) => x.toMap()).toList(),
      'evolutions': evolutions,
      'abilities': abilities.map((x) => x.toMap()).toList(),
      'moves': moves.map((x) => x.toMap()).toList()
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id']?.toInt() ?? 0,
      baseExperience: map['baseExperience']?.toInt() ?? 0,
      height: map['height']?.toDouble() ?? 0.0,
      weight: map['weight']?.toDouble() ?? 0.0,
      isFavorite: map['isDefault'] ?? false,
      name: map['name'] ?? '',
      order: map['order']?.toInt() ?? 0,
      stats: List<StatModel>.from(map['stats']?.map((x) => StatModel.fromMap(x)) ?? const []),
      types: List<TypeModel>.from(map['types']?.map((x) => TypeModel.fromMap(x)) ?? const []),
      evolutions: map['evolutions'] ?? '',
      urlImage: map['sprites']['other']['official-artwork']['front_default'] ?? "",
      abilities: List<AbilityModel>.from(map['abilities']?.map((x) => AbilityModel.fromMap(x)) ?? const []),
      moves: List<MoveModel>.from(map['moves']?.map((x) => MoveModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  double get totalStat {
    double value = 0.0;
    for (var stat in stats) {
      value += stat.baseStat;
    }
    return value;
  }

  MoveModel getMoveByName(String name) {
    return moves.where((element) => element.name == name).first;
  }

  factory PokemonModel.fromJson(String source) => PokemonModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonModel(id: $id, baseExperience: $baseExperience, height: $height, weight: $weight, isDefault: $isFavorite, name: $name, order: $order, urlImage: $urlImage, stats: $stats, types: $types, evolutions: $evolutions)';
  }
}
