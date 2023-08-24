import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/home_controller.dart';
import 'package:pokedex_challenge/src/modules/home/ui/components/tag_card.dart';
import 'package:skeletons/skeletons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/helpers/pokeicon_icons.dart';
import '../../../../core/helpers/treatment.dart';
import '../../../../core/models/pokemon_list_model.dart';
import '../../domain/view_model/card_pokemon_view_model.dart';

class CardPokemon extends StatefulWidget {
  final HomeController controller;
  final PokemonListResultModel pokemon;
  const CardPokemon({
    Key? key,
    required this.controller,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  CardPokemonViewModel? viewModel;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.controller.getCardPokemonViewModel(widget.pokemon).then((value) => setState(() {
            viewModel = value;
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (viewModel == null) {
      return SkeletonItem(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Container(
          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(32)),
        ),
      ));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Container(
        decoration: BoxDecoration(color: viewModel!.backGroundColor.withOpacity(0.8), borderRadius: BorderRadius.circular(32), boxShadow: const [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 6, spreadRadius: -1, offset: Offset(0, 4)),
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.06), blurRadius: 4, spreadRadius: -1, offset: Offset(0, 2)),
        ]),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                    width: 140,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: SvgPicture.asset(
                        "assets/images/pokeball.svg",
                        fit: BoxFit.fitWidth,
                      ),
                    ))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("#${Treatment.formathashDoubleNumber(viewModel!.id)}"),
                      Text(
                        Treatment.capitalizeFirstLetter(viewModel?.name ?? ""),
                        style: context.textTheme.displaySmall,
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        child: Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: viewModel?.tags.map((tag) => TagCard(tag: tag)).toList() ?? [],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: CachedNetworkImage(
                      imageUrl: viewModel?.urlImage ?? "",
                      progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  const Align(alignment: Alignment.topRight, child: Icon(Pokeicon.heart))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
