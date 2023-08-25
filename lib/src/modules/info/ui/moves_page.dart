import 'package:flutter/material.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/move_model.dart';

import 'package:pokedex_challenge/src/modules/info/ui/components/list_tile_moves.dart';

import '../domain/view_model/modal_info_view_model.dart';

class MovesPage extends StatelessWidget {
  final ModalInfoViewModel viewModel;
  const MovesPage({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.secondaryBgColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: SizedBox(
            child: ListView.builder(
              itemCount: viewModel.pokemon.moves.length,
              itemBuilder: (context, index) {
                MoveModel move = viewModel.pokemon.moves[index];
                return ListTileMoves(moveName: move.name, pokemon: viewModel.pokemon);
              },
            ),
          ),
        ),
      ),
    );
  }
}
