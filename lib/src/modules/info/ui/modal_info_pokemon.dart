import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/modules/info/aplication/info_controller.dart';
import 'package:pokedex_challenge/src/modules/info/domain/view_model/modal_info_view_model.dart';
import 'package:pokedex_challenge/src/modules/info/ui/about_page.dart';
import 'package:pokedex_challenge/src/modules/info/ui/components/diagonal_container.dart';
import 'package:pokedex_challenge/src/modules/info/ui/evolutions_page.dart';
import 'package:pokedex_challenge/src/modules/info/ui/moves_page.dart';
import 'package:pokedex_challenge/src/modules/info/ui/stats_page.dart';

class ModalInfoPokemon extends StatefulWidget {
  final Future<ModalInfoViewModel> Function() getDescription;
  const ModalInfoPokemon({
    Key? key,
    required this.getDescription,
  }) : super(key: key);

  @override
  State<ModalInfoPokemon> createState() => _ModalInfoPokemonState();
}

class _ModalInfoPokemonState extends State<ModalInfoPokemon> {
  ModalInfoViewModel? viewModel;
  late final InfoController controller;
  @override
  void initState() {
    super.initState();
    controller = context.read<InfoController>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.getDescription().then((value) {
        viewModel = value;
      });
      setState(() {});
      Future.delayed(const Duration(milliseconds: 100), () {
        controller.goPage(0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (viewModel == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final controller = context.read<InfoController>();
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            DiagonalContainer(viewModel: viewModel!),
            Expanded(
              child: SizedBox(
                width: context.w,
                child: PageView(
                  controller: controller.pageController,
                  children: [
                    AboutPage(viewModel: viewModel!),
                    StatsPage(viewModel: viewModel!),
                    EvolutionsPage(pokemonName: viewModel!.pokemon.name),
                    MovesPage(viewModel: viewModel!),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
