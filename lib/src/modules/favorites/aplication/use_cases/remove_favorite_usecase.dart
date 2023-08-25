import 'package:pokedex_challenge/src/core/domain/repositories/i_favorite_repository.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';

class RemoveFavoriteUsecase {
  final IFavoriteRepository favoriteRepository;
  RemoveFavoriteUsecase(this.favoriteRepository);
  call(PokemonModel pokemon) {
    favoriteRepository.remove(pokemon);
  }
}
