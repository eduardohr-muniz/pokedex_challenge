import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/core/helpers/pokeicon_icons.dart';
import 'package:pokedex_challenge/src/core/helpers/routes.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/home_controller.dart';
import 'package:pokedex_challenge/src/modules/home/ui/components/card_pokemon.dart';

import '../../../core/helpers/messages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Messages messages;
  final scrollController = ScrollController();
  late final HomeController _homeController;
  @override
  void initState() {
    super.initState();
    messages = Messages.of(context);
    _homeController = context.read<HomeController>();
    _homeController.initItems(messages);
    scrollController.addListener(() {
      _homeController.pagination(scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.favorites.route);
            },
            icon: const Icon(Pokeicon.pokeball, color: Colors.white, size: 40),
            tooltip: "Favorites",
          )
        ],
        title: Center(
          child: SizedBox(height: 50, child: Image.asset("assets/images/pokemon_logo.png", fit: BoxFit.cover)),
        ),
      ),
      body: AnimatedBuilder(
          animation: _homeController,
          builder: (context, __) {
            return ListView.builder(
              controller: scrollController,
              itemExtent: 132,
              itemCount: _homeController.items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: CardPokemon(
                    onTap: () {},
                    getCardPokemonViewModel: () => _homeController.getCardPokemonViewModel(_homeController.items[index], messages),
                  ),
                );
              },
            );
          }),
    );
  }
}
