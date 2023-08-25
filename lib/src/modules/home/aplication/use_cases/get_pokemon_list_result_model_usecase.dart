import 'package:pokedex_challenge/src/core/domain/repositories/i_pokemons_repository.dart';

import '../../../../core/models/pokemon_list_model.dart';

class GetPokemonListResultModelUsecase {
  final IPokemonsRepository pokemonsRepository;
  GetPokemonListResultModelUsecase({
    required this.pokemonsRepository,
  });
  Future<List<PokemonListResultModel>> call({required int offSet, required int limit}) async {
    List<PokemonListResultModel> result = [];
    PokemonListModel pokemonListModel = await pokemonsRepository.getPokemonListModel(offSet: offSet, limit: limit);
    result.addAll(pokemonListModel.results);
    return result;
  }
}
