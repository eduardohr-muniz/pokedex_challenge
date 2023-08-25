import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';

abstract interface class IFavoriteRepository {
  Future<List<String>?> getAll();
  Future<void> insert(PokemonModel pokemon);
  Future<void> remove(PokemonModel pokemon);
}
