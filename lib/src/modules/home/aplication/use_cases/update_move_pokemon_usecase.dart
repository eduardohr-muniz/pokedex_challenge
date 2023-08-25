import 'package:pokedex_challenge/src/core/models/pokemon/move_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
import '../../../../core/domain/repositories/i_pokemons_repository.dart';

class UpdateMovePokemonUsecase {
  final IPokemonsRepository pokemonsRepository;
  UpdateMovePokemonUsecase({required this.pokemonsRepository});
  Future<MoveModel> call({required PokemonModel pokemon, required String moveName}) async {
    final MoveModel result = await pokemonsRepository.updateMovePokemon(moveName: moveName, pokemon: pokemon);
    return result;
  }
}
