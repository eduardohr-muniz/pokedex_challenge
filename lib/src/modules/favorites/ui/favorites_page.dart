import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/core/helpers/messages.dart';
import 'package:pokedex_challenge/src/modules/favorites/aplication/favorite_controller.dart';
import '../../home/ui/components/card_pokemon.dart';
import '../../info/ui/modal_info_pokemon.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late final FavoriteController controller;
  @override
  void initState() {
    super.initState();
    controller = context.read<FavoriteController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final messages = Messages.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.primaryColor,
        foregroundColor: context.primaryBgColor,
        title: Text(
          'Favoritos',
          style: context.textTheme.displayLarge!.copyWith(color: context.primaryBgColor),
        ),
      ),
      body: SizedBox(
        child: ValueListenableBuilder(
            valueListenable: controller.favorites,
            builder: (_, names, __) {
              if (names.isEmpty) {
                return Center(
                  child: Text("Nenhum favorito no momento", style: context.textTheme.labelLarge),
                );
              }
              return ListView.builder(
                itemExtent: 132,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  String name = names[index];
                  return CardPokemon(
                    getCardPokemonViewModel: () => controller.getCardPokemonViewModel(name, messages),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => ModalInfoPokemon(
                                getDescription: () => controller.getDialogDescriptionViewModel(name, messages),
                              ));
                    },
                  );
                },
              );
            }),
      ),
    );
  }
}
