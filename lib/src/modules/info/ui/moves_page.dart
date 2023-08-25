import 'package:flutter/material.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/moves_model.dart';

import 'package:pokedex_challenge/src/modules/info/ui/components/base_page_pagination.dart';
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
                MovesModel move = viewModel.pokemon.moves[index];
                return ListTileMoves(move: move, pokemonkey: viewModel.pokemon.name);
              },
            ),
          ),
        ),
      ),
    );
  }
}
