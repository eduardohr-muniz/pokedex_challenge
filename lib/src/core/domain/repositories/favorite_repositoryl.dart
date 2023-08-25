import 'package:pokedex_challenge/src/core/interfaces/local_storage/i_local_storage.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';

import './i_favorite_repository.dart';

class FavoriteRepository implements IFavoriteRepository {
  ILocalStorage localStorage;
  FavoriteRepository(
    this.localStorage,
  );
  _savePokemonModelLocal(PokemonModel pokemonModel) async {
    await localStorage.put<PokemonModel>("pokemons", key: pokemonModel.name, value: pokemonModel);
  }

  @override
  Future<List<String>?> getAll() async {
    List<String>? result = await localStorage.getAll<String>("favorites");
    return result;
  }

  @override
  Future<void> insert(PokemonModel pokemon) async {
    pokemon.isFavorite = true;
    await _savePokemonModelLocal(pokemon);
    await localStorage.put<String>("favorites", key: pokemon.name, value: pokemon.name);
  }

  @override
  Future<void> remove(PokemonModel pokemon) async {
    pokemon.isFavorite = false;
    await localStorage.delete<String>("favorites", key: pokemon.name);
    await _savePokemonModelLocal(pokemon);
  }
}
