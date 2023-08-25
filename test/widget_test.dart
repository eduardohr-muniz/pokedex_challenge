// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:pokedex_challenge/src/core/interfaces/htpp/http_dio.dart';
// import 'package:pokedex_challenge/src/core/interfaces/local_storage/local_storage.dart';
// import 'package:pokedex_challenge/src/core/log/log.dart';
// import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
// import 'package:pokedex_challenge/src/core/domain/repositories/pokemons_repository.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   LocalStorage.initHive();
//   HttpDio http = HttpDio();
//   LocalStorage localStorage = LocalStorage(logger: Log());
//   PokemonsRepository pokemonsRepository = PokemonsRepository(http: http, localStorage: localStorage);
//   //! Fiz esse teste apenas para debugar a requisição que achei mais complexa da atividade
//   //! Tenho que estruturar o hive para funcionar no ambiente de teste, para este teste dar certo
//   //! Por conta do prazo isso não foi possivel
//   test('get evolutions', () async {
//     expect(await pokemonsRepository.updateEvolutions(pokemonName: "blastoise"), isA<List<PokemonModel>>());
//   });
// }
