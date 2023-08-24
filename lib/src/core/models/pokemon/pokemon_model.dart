import 'dart:convert';

import 'package:hive/hive.dart';

import 'stats_model.dart';
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
  bool isDefault;
  @HiveField(5)
  String name;
  @HiveField(6)
  int order;
  @HiveField(7)
  String urlImage;
  @HiveField(8)
  List<StatsModel> stats;
  @HiveField(9)
  List<TypeModel> types;
  @HiveField(10)
  List<PokemonModel> evolutions;
  PokemonModel({
    required this.id,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.isDefault,
    required this.name,
    required this.order,
    required this.stats,
    required this.evolutions,
    required this.types,
    required this.urlImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'baseExperience': baseExperience,
      'height': height,
      'weight': weight,
      'isDefault': isDefault,
      'name': name,
      'order': order,
      'stats': stats.map((x) => x.toMap()).toList(),
      'types': types.map((x) => x.toMap()).toList(),
      'evolutions': evolutions.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id']?.toInt() ?? 0,
      baseExperience: map['baseExperience']?.toInt() ?? 0,
      height: map['height']?.toDouble() ?? 0.0,
      weight: map['weight']?.toDouble() ?? 0.0,
      isDefault: map['isDefault'] ?? false,
      name: map['name'] ?? '',
      order: map['order']?.toInt() ?? 0,
      stats: List<StatsModel>.from(map['stats']?.map((x) => StatsModel.fromMap(x)) ?? const []),
      types: List<TypeModel>.from(map['types']?.map((x) => TypeModel.fromMap(x)) ?? const []),
      evolutions: List<PokemonModel>.from(map['evolutions']?.map((x) => PokemonModel.fromMap(x)) ?? const []),
      urlImage: map['sprites']['other']['official-artwork']['front_default'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) => PokemonModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonModel(id: $id, baseExperience: $baseExperience, height: $height, weight: $weight, isDefault: $isDefault, name: $name, order: $order, urlImage: $urlImage, stats: $stats, types: $types, evolutions: $evolutions)';
  }
}