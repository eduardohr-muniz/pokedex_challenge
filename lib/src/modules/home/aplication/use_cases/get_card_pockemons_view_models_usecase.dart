import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
import 'package:pokedex_challenge/src/modules/home/domain/repositories/i_pokemons_repository.dart';

import '../../../../core/models/pokemon_list_model.dart';
import '../../domain/view_model/card_pokemon_view_model.dart';

class GetCardPockemonViewModelUsecase {
  final IPokemonsRepository pokemonsRepository;
  GetCardPockemonViewModelUsecase({
    required this.pokemonsRepository,
  });
  Future<CardPokemonViewModel> call(PokemonListResultModel pokemonListResultModel) async {
    String url = pokemonListResultModel.url;
    String name = pokemonListResultModel.name;
    PokemonModel pokemonModel = await pokemonsRepository.getPokemonModel(url: url, name: name);
    CardPokemonViewModel cardPokemonViewModel = CardPokemonViewModel.fromPokemonModel(pokemonModel);
    return cardPokemonViewModel;
  }
}
