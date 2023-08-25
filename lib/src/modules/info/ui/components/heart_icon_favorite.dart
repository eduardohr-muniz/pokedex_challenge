import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/core/helpers/pokeicon_icons.dart';
import 'package:pokedex_challenge/src/core/helpers/messages.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
import 'package:pokedex_challenge/src/modules/favorites/aplication/favorite_controller.dart';

class HeartIconFavorite extends StatefulWidget {
  final PokemonModel pokemon;
  const HeartIconFavorite({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<HeartIconFavorite> createState() => _HeartIconFavoriteState();
}

class _HeartIconFavoriteState extends State<HeartIconFavorite> {
  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = context.read<FavoriteController>();
    Messages messages = Messages.of(context);
    return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return IconButton(
              onPressed: () async {
                await controller.changeFavorite(widget.pokemon, messages);
              },
              icon: controller.isFavorite(widget.pokemon.name)
                  ? Icon(
                      Pokeicon.heart_filled,
                      color: context.primaryColor,
                    )
                  : const Icon(Pokeicon.heart));
        });
  }
}
