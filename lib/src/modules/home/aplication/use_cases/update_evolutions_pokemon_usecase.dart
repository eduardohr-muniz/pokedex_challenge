import '../../../../core/models/pokemon/pokemon_model.dart';
import '../../../../core/domain/repositories/i_pokemons_repository.dart';

class UpdateEvolutionsPokemonUsecase {
  final IPokemonsRepository pokemonsRepository;
  UpdateEvolutionsPokemonUsecase({required this.pokemonsRepository});
  Future<List<PokemonModel>> call(String pokemonName) async {
    final List<PokemonModel> result = await pokemonsRepository.updateEvolutions(pokemonName: pokemonName);
    return result;
  }
}
