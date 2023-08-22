part of 'pokemon_entity.dart';

class Stats {
  double baseStat;
  String name;
  Stats({
    this.baseStat = 0.0,
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'base_stat': baseStat,
      'name': name,
    };
  }

  factory Stats.fromMap(Map<String, dynamic> map) {
    return Stats(
      baseStat: map['baseStat']?.toDouble() ?? 0.0,
      name: map['stat']['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Stats.fromJson(String source) => Stats.fromMap(json.decode(source));
}
