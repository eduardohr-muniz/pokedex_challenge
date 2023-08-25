import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/core/helpers/tag_entity.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/move_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
import 'package:pokedex_challenge/src/modules/info/aplication/info_controller.dart';

class ListTileMoves extends StatefulWidget {
  final PokemonModel pokemon;
  final String moveName;
  const ListTileMoves({
    Key? key,
    required this.pokemon,
    required this.moveName,
  }) : super(key: key);

  @override
  State<ListTileMoves> createState() => _ListTileMovesState();
}

class _ListTileMovesState extends State<ListTileMoves> {
  MoveModel get moveModel => widget.pokemon.getMoveByName(widget.moveName);
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (moveModel.typeName == "") {
        var controller = context.read<InfoController>();
        controller.updateMove(pokemon: widget.pokemon, moveName: widget.moveName).then((value) {
          if (mounted) {
            setState(() {});
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (moveModel.typeName == "") {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    TagEntity tag = TagEntity.tagEquals(moveModel.typeName);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ListTile(
        title: Text(
          moveModel.name,
          style: context.textTheme.bodyLarge,
        ),
        trailing: Container(
          decoration: BoxDecoration(color: tag.color, shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              tag.icon,
              color: Colors.white,
              size: 14,
            ),
          ),
        ),
      ),
    );
  }
}
