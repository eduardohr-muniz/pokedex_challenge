import 'package:pokedex_challenge/src/core/models/pokemon/move_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon_list_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';

abstract interface class IPokemonsRepository {
  Future<PokemonListModel> getPokemonListModel({required int offSet, required int limit});
  Future<PokemonModel> getPokemonModel({required String url, required String name});
  Future<MoveModel> updateMovePokemon({required PokemonModel pokemon, required String moveName});
  Future<List<PokemonModel>> updateEvolutions({required String pokemonName});
}
