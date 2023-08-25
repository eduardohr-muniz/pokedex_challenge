import 'package:pokedex_challenge/src/core/helpers/tag_entity.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';

class ModalInfoViewModel {
  final PokemonModel pokemon;
  final int id;
  final String name;
  final List<TagEntity> tags;
  final String urlImage;
  final bool favorite;

  ModalInfoViewModel({
    required this.pokemon,
    required this.id,
    required this.name,
    required this.tags,
    required this.urlImage,
    required this.favorite,
  });
  factory ModalInfoViewModel.fromPokemonModel(PokemonModel pokemonModel) {
    List<TagEntity> tags = pokemonModel.types.map((type) => TagEntity.tagEquals(type.name)).toList();
    return ModalInfoViewModel(
      pokemon: pokemonModel,
      id: pokemonModel.id,
      name: pokemonModel.name,
      tags: tags,
      urlImage: pokemonModel.urlImage,
      favorite: false,
    );
  }
}
