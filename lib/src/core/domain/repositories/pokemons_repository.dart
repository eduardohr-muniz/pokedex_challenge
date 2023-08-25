import '../../interfaces/htpp/i_http.dart';
import '../../interfaces/local_storage/i_local_storage.dart';
import '../../models/evolution_model.dart';
import '../../models/pokemon/move_model.dart';
import '../../models/pokemon/pokemon_model.dart';
import '../../models/pokemon_list_model.dart';
import 'i_pokemons_repository.dart';

class PokemonsRepository implements IPokemonsRepository {
  final IHttp http;
  final ILocalStorage localStorage;
  PokemonsRepository({
    required this.http,
    required this.localStorage,
  });

  _savePokemonModelLocal(PokemonModel pokemonModel) async {
    await localStorage.put<PokemonModel>("pokemons", key: pokemonModel.name, value: pokemonModel);
  }

  _convertListToString(List<String> inputList) {
    String result = inputList.join(',');

    return result;
  }

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
      await _savePokemonModelLocal(pokemon);
      return pokemon;
    } else {
      return pokemonLocal;
    }
  }

  @override
  Future<MoveModel> updateMovePokemon({required PokemonModel pokemon, required String moveName}) async {
    MoveModel move = pokemon.moves.firstWhere((element) => element.name == moveName);

    String url = move.url;

    final request = await http.get(url.replaceAll("https://pokeapi.co", ""));
    final MoveModel moveResult = MoveModel.fromMap(request.data);
    move.typeName = moveResult.typeName;

    await _savePokemonModelLocal(pokemon);
    return move;
  }

  @override
  Future<List<PokemonModel>> updateEvolutions({required String pokemonName}) async {
    PokemonModel? pokemon = await localStorage.get<PokemonModel>("pokemons", key: pokemonName);
    List<PokemonModel> pokemons = [];

    final request = await http.get("/api/v2/pokemon-species/$pokemonName");
    Map<String, dynamic> chainUrlMap = request.data;
    String urlChain = chainUrlMap['evolution_chain']['url'];
    List<String> pokemonsName = [];
    if (pokemon?.evolutions == "") {
      final result = await http.get(urlChain.replaceAll("https://pokeapi.co", ""));
      EvolutionModel evolutionModel = EvolutionModel.fromMap(result.data);
      pokemonsName.add(evolutionModel.primaryPokemon.species.name);
      if (evolutionModel.primaryPokemon.secondaryPokemon!.isNotEmpty) {
        pokemonsName.add(evolutionModel.primaryPokemon.secondaryPokemon?.first.species.name ?? "");
      }
      if (evolutionModel.primaryPokemon.secondaryPokemon!.first.terciaryPokemon!.isNotEmpty) {
        pokemonsName.add(evolutionModel.primaryPokemon.secondaryPokemon?.first.terciaryPokemon?.first.species?.name ?? "");
      }
    } else {
      pokemonsName.addAll(pokemon!.evolutions.split(","));
    }

    for (var name in pokemonsName) {
      if (name != "") {
        PokemonModel? getPokemon = await localStorage.get<PokemonModel>("pokemons", key: name);
        if (getPokemon != null) {
          getPokemon.evolutions = _convertListToString(pokemonsName);
          pokemons.add(getPokemon);
          _savePokemonModelLocal(pokemon!);
        }
      }
    }

    return pokemons;
  }
}
