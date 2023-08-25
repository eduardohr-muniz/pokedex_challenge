import 'package:pokedex_challenge/src/core/domain/repositories/i_favorite_repository.dart';

class GetFavoritesUsecase {
  final IFavoriteRepository favoriteRepository;
  GetFavoritesUsecase(this.favoriteRepository);
  Future<List<String>?> call() async {
    List<String>? pokemons = await favoriteRepository.getAll();
    return pokemons;
  }
}
