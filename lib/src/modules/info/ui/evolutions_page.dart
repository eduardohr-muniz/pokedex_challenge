import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/core/helpers/treatment.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
import 'package:pokedex_challenge/src/modules/info/aplication/info_controller.dart';
import 'package:pokedex_challenge/src/modules/info/ui/components/base_page_pagination.dart';
import 'package:pokedex_challenge/src/modules/info/ui/components/label_text.dart';

class EvolutionsPage extends StatefulWidget {
  final String pokemonName;
  const EvolutionsPage({
    Key? key,
    required this.pokemonName,
  }) : super(key: key);

  @override
  State<EvolutionsPage> createState() => _EvolutionsPageState();
}

class _EvolutionsPageState extends State<EvolutionsPage> {
  List<PokemonModel>? evolutions;
  @override
  void initState() {
    super.initState();
    if (evolutions == null) {
      var controller = context.read<InfoController>();
      controller.updateEvolutions(widget.pokemonName).then((value) {
        if (mounted) {
          setState(() {
            evolutions = value;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (evolutions == null) {
      return const BasePagePagination(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return BasePagePagination(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...evolutions!.map((pokemon) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Container(
                    height: context.w * 0.24,
                    width: context.w * 0.24,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.green)),
                    child: CachedNetworkImage(
                      imageUrl: pokemon.urlImage,
                      fit: BoxFit.fill,
                      progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  Row(
                    children: [
                      LabelText(Treatment.capitalizeFirstLetter(pokemon.name)),
                      Icon(
                        Icons.arrow_right_alt_sharp,
                        color: context.secondaryTextColor,
                        size: 20,
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    ));
  }
}
