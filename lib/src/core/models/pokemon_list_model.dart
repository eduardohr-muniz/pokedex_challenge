import 'dart:convert';

class PokemonListModel {
  final int count;
  final String next;
  final String previous;
  final List<PokemonListResultModel> results;
  PokemonListModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((result) => result.toMap()).toList(),
    };
  }

  factory PokemonListModel.fromMap(Map<String, dynamic> map) {
    return PokemonListModel(
      count: map['count']?.toInt() ?? 0,
      next: map['next'] ?? '',
      previous: map['previous'] ?? '',
      results: List<PokemonListResultModel>.from(map['results']?.map((result) => PokemonListResultModel.fromMap(result)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonListModel.fromJson(String source) => PokemonListModel.fromMap(json.decode(source));
}

class PokemonListResultModel {
  final String name;
  final String url;
  PokemonListResultModel({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory PokemonListResultModel.fromMap(Map<String, dynamic> map) {
    return PokemonListResultModel(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonListResultModel.fromJson(String source) => PokemonListResultModel.fromMap(json.decode(source));
}

// count: 1281,
// next: "https://pokeapi.co/api/v2/pokemon/?offset=150&limit=50",
// previous: "https://pokeapi.co/api/v2/pokemon/?offset=50&limit=50",
// results: [
// {
// name: "electrode",
// url: "https://pokeapi.co/api/v2/pokemon/101/"
// },