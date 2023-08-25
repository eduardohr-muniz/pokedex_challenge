import 'package:pokedex_challenge/src/core/models/pokemon/moves_model.dart';
import '../../domain/repositories/i_pokemons_repository.dart';

class UpdateMovePokemonUsecase {
  final IPokemonsRepository pokemonsRepository;
  UpdateMovePokemonUsecase({required this.pokemonsRepository});
  Future<MovesModel> call({required String key, required MovesModel move}) async {
    final MovesModel result = await pokemonsRepository.updateMovePokemon(key: key, move: move);
    return result;
  }
}
