import 'package:pokedex_challenge/src/core/interfaces/htpp/i_http.dart';
import 'package:pokedex_challenge/src/core/interfaces/local_storage/i_local_storage.dart';
import 'package:pokedex_challenge/src/core/models/evolution_mode.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/moves_model.dart';
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

  @override
  Future<MovesModel> updateMovePokemon({required String key, required MovesModel move}) async {
    PokemonModel? pokemonLocal = await localStorage.get<PokemonModel>("pokemons", key: key);
    String url = move.url;

    final request = await http.get(url.replaceAll("https://pokeapi.co", ""));
    final MovesModel moveResult = MovesModel.fromMap(request.data);
    move.typeName = moveResult.typeName;

    localStorage.put<PokemonModel>("pokemons", key: key, value: pokemonLocal!);
    return move;
  }

  @override
  Future<PokemonModel> getEvolution({required PokemonModel pokemon}) async {
    String pokemonName = pokemon.name;
    List<PokemonModel> pokemons = [];

    final request = await http.get("/api/v2/pokemon-species/$pokemonName");
    Map<String, dynamic> chainUrlMap = request.data;
    String urlChain = chainUrlMap['evolution_chain']['url'];

    final result = await http.get(urlChain.replaceAll("https://pokeapi.co", ""));
    EvolutionModel evolutionModel = EvolutionModel.fromMap(result.data);

    List<String> pokemonsName = [];
    pokemonsName.add(evolutionModel.primaryPokemon.species.name);
    pokemonsName.add(evolutionModel.primaryPokemon.secondaryPokemon.first.species.name);
    pokemonsName.add(evolutionModel.primaryPokemon.secondaryPokemon.first.terciaryPokemon.first.species.name);

    for (var name in pokemonsName) {
      if (name != "") {
        PokemonModel? getPokemon = await localStorage.get<PokemonModel>("pokemons", key: name);
        pokemons.add(getPokemon!);
      }
    }

    pokemon.evolutions.addAll(pokemons);
    localStorage.put("pokemons", key: pokemonName, value: pokemon);
    return pokemon;
  }
}
