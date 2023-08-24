import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:pokedex_challenge/src/core/helpers/tag_entity.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';

class CardPokemonViewModel {
  final int id;
  final String name;
  final List<TagEntity> tags;
  final String urlImage;
  final bool favorite;
  final Color backGroundColor;

  CardPokemonViewModel({
    required this.id,
    required this.name,
    required this.tags,
    required this.urlImage,
    required this.favorite,
    required this.backGroundColor,
  });
  factory CardPokemonViewModel.fromPokemonModel(PokemonModel pokemonModel) {
    List<TagEntity> tags = pokemonModel.types.map((type) => TagEntity.tagEquals(type.name)).toList();
    return CardPokemonViewModel(
      id: pokemonModel.id,
      name: pokemonModel.name,
      tags: tags,
      urlImage: pokemonModel.urlImage,
      favorite: false, //TODO implementar favorito
      backGroundColor: tags.first.colorCard,
    );
  }
}
