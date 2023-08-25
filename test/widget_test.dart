import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:pokedex_challenge/src/core/interfaces/htpp/http_dio.dart';
import 'package:pokedex_challenge/src/core/interfaces/local_storage/local_storage.dart';
import 'package:pokedex_challenge/src/core/log/log.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
import 'package:pokedex_challenge/src/modules/home/domain/repositories/pokemons_repository.dart';

void main() {
  HttpDio http = HttpDio();
  LocalStorage localStorage = LocalStorage(logger: Log());
  PokemonsRepository pokemonsRepository = PokemonsRepository(http: http, localStorage: localStorage);
  PokemonModel pokemon = PokemonModel(
    id: 0,
    baseExperience: 1,
    height: 2,
    weight: 1,
    isDefault: false,
    name: "blastoise",
    order: 0,
    stats: [],
    evolutions: [],
    types: [],
    urlImage: "",
    abilities: [],
    moves: [],
  );
  test('get evolutions', () async {
    expect(await pokemonsRepository.getEvolution(pokemon: pokemon), isA<PokemonModel>());
  });
}
