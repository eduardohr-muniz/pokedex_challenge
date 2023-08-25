import 'package:pokedex_challenge/src/core/domain/repositories/i_favorite_repository.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';

class InsertFavoriteUsecase {
  final IFavoriteRepository favoriteRepository;
  InsertFavoriteUsecase(this.favoriteRepository);
  call(PokemonModel pokemon) {
    favoriteRepository.insert(pokemon);
  }
}
