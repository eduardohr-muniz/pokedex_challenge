import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/core/helpers/tag_entity.dart';

import 'package:pokedex_challenge/src/core/models/pokemon/moves_model.dart';
import 'package:pokedex_challenge/src/modules/info/aplication/info_controller.dart';

class ListTileMoves extends StatefulWidget {
  final MovesModel move;
  final String pokemonkey;
  const ListTileMoves({
    Key? key,
    required this.move,
    required this.pokemonkey,
  }) : super(key: key);

  @override
  State<ListTileMoves> createState() => _ListTileMovesState();
}

class _ListTileMovesState extends State<ListTileMoves> {
  late final InfoController controller;
  MovesModel? moveModel;
  @override
  void initState() {
    super.initState();
    controller = context.read<InfoController>();
    if (widget.move.typeName == "") {
      controller.updateMove(key: widget.pokemonkey, move: widget.move).then((value) {
        setState(() {
          moveModel = value;
        });
      });
    } else {
      setState(() {
        moveModel = widget.move;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (moveModel == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    TagEntity tag = TagEntity.tagEquals(moveModel!.typeName);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ListTile(
        title: Text(
          moveModel!.name,
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
