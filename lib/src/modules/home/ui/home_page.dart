import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_challenge/src/core/log/log.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/home_controller.dart';
import 'package:pokedex_challenge/src/modules/home/ui/components/card_pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  late final HomeController _homeController;
  @override
  void initState() {
    super.initState();
    _homeController = context.read<HomeController>();
    _homeController.initItems();
    scrollController.addListener(() {
      _homeController.pagination(scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: AnimatedBuilder(
          animation: _homeController,
          builder: (context, __) {
            return ListView.builder(
              controller: scrollController,
              itemExtent: 132,
              itemCount: _homeController.items.length,
              itemBuilder: (context, index) {
                return CardPokemon(
                  controller: _homeController,
                  pokemon: _homeController.items[index],
                );
              },
            );
          }),
    );
  }
}
