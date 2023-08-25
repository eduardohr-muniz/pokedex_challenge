import 'dart:convert';

class EvolutionModel {
  PrimaryPokemon primaryPokemon;

  EvolutionModel({
    required this.primaryPokemon,
  });

  Map<String, dynamic> toMap() {
    return {
      'chain': primaryPokemon.toMap(),
    };
  }

  factory EvolutionModel.fromMap(Map<String, dynamic> map) {
    return EvolutionModel(
      primaryPokemon: PrimaryPokemon.fromMap(map['chain']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionModel.fromJson(String source) => EvolutionModel.fromMap(json.decode(source));
}

class PrimaryPokemon {
  List<SecondaryPokemon>? secondaryPokemon;
  bool isBaby;
  Species species;

  PrimaryPokemon({
    required this.secondaryPokemon,
    required this.isBaby,
    required this.species,
  });

  Map<String, dynamic> toMap() {
    return {
      'evolves_to': secondaryPokemon?.map((x) => x.toMap()).toList() ?? const [],
      'isBaby': isBaby,
      'species': species.toMap(),
    };
  }

  factory PrimaryPokemon.fromMap(Map<String, dynamic> map) {
    return PrimaryPokemon(
      secondaryPokemon: List<SecondaryPokemon>.from(map['evolves_to']?.map((x) => SecondaryPokemon.fromMap(x)) ?? const []),
      isBaby: map['isBaby'] ?? false,
      species: Species.fromMap(map['species']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PrimaryPokemon.fromJson(String source) => PrimaryPokemon.fromMap(json.decode(source));
}

class SecondaryPokemon {
  List<TerciaryPokemon>? terciaryPokemon;
  bool isBaby;
  Species species;

  SecondaryPokemon({
    required this.terciaryPokemon,
    required this.isBaby,
    required this.species,
  });

  Map<String, dynamic> toMap() {
    return {
      'evolves_to': terciaryPokemon?.map((x) => x.toMap()).toList() ?? const [],
      'isBaby': isBaby,
      'species': species.toMap(),
    };
  }

  factory SecondaryPokemon.fromMap(Map<String, dynamic> map) {
    return SecondaryPokemon(
      terciaryPokemon: List<TerciaryPokemon>.from(map['evolves_to']?.map((x) => TerciaryPokemon.fromMap(x)) ?? const []),
      isBaby: map['isBaby'] ?? false,
      species: Species.fromMap(map['species']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SecondaryPokemon.fromJson(String source) => SecondaryPokemon.fromMap(json.decode(source));
}

class TerciaryPokemon {
  bool isBaby;
  Species? species;

  TerciaryPokemon({
    required this.isBaby,
    required this.species,
  });

  Map<String, dynamic> toMap() {
    return {
      'isBaby': isBaby,
      'species': species?.toMap() ?? "",
    };
  }

  factory TerciaryPokemon.fromMap(Map<String, dynamic> map) {
    return TerciaryPokemon(
      isBaby: map['isBaby'] ?? false,
      species: Species.fromMap(map['species'] ?? ""),
    );
  }

  String toJson() => json.encode(toMap());

  factory TerciaryPokemon.fromJson(String source) => TerciaryPokemon.fromMap(json.decode(source));
}

class Species {
  String name;
  String url;

  Species({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Species.fromMap(Map<String, dynamic> map) {
    return Species(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Species.fromJson(String source) => Species.fromMap(json.decode(source));
}
