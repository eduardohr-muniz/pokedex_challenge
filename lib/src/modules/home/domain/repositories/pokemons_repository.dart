import 'package:pokedex_challenge/src/core/interfaces/htpp/i_http.dart';
import 'package:pokedex_challenge/src/core/interfaces/local_storage/i_local_storage.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon_list_model.dart';
import 'package:pokedex_challenge/src/modules/home/domain/repositories/i_pokemons_repository.dart';

class PokemonsRepository implements IPokemonsRepository {
  final IHttp http;
  final ILocalStorage localStorage;
  PokemonsRepository({
    required this.http,
    required this.localStorage,
  });

  @override
  Future<PokemonListModel> getPokemonListModel({required int offSet, required int limit}) async {
    var request = await http.get("/api/v2/pokemon/?offset=$offSet&limit=$limit");
    PokemonListModel result = PokemonListModel.fromMap(request.data);
    return result;
  }

  @override
  Future<PokemonModel> getPokemonModel({required String url, required String name}) async {
    PokemonModel? pokemonLocal = await localStorage.get<PokemonModel>("pokemons", key: name);
    if (pokemonLocal == null) {
      final request = await http.get(url.replaceAll("https://pokeapi.co", ""));
      final PokemonModel pokemon = PokemonModel.fromMap(request.data);
      localStorage.put<PokemonModel>("pokemons", key: name, value: pokemon);

      return pokemon;
    } else {
      return pokemonLocal;
    }
  }
}
