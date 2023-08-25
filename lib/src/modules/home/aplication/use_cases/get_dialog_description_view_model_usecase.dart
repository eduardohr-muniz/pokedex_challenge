import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
import 'package:pokedex_challenge/src/modules/info/domain/view_model/modal_info_view_model.dart';
import 'package:pokedex_challenge/src/modules/home/domain/repositories/i_pokemons_repository.dart';
import '../../../../core/models/pokemon_list_model.dart';

class GetDialogDescriptionViewModelUsecase {
  final IPokemonsRepository pokemonsRepository;
  GetDialogDescriptionViewModelUsecase({
    required this.pokemonsRepository,
  });
  Future<ModalInfoViewModel> call(PokemonListResultModel pokemonListResultModel) async {
    String url = pokemonListResultModel.url;
    String name = pokemonListResultModel.name;
    PokemonModel pokemonModel = await pokemonsRepository.getPokemonModel(url: url, name: name);
    ModalInfoViewModel dialogDescriptionViewModel = ModalInfoViewModel.fromPokemonModel(pokemonModel);
    return dialogDescriptionViewModel;
  }
}