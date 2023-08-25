import 'package:pokedex_challenge/src/core/models/pokemon/moves_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon_list_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';

abstract interface class IPokemonsRepository {
  Future<PokemonListModel> getPokemonListModel({required int offSet, required int limit});
  Future<PokemonModel> getPokemonModel({required String url, required String name});
  Future<MovesModel> updateMovePokemon({required String key, required MovesModel move});
  Future<PokemonModel> getEvolution({required PokemonModel pokemon});
}
