import 'package:flutter/material.dart';

import 'package:pokedex_challenge/src/core/models/pokemon/move_model.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/update_evolutions_pokemon_usecase.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/update_move_pokemon_usecase.dart';

class InfoController extends ChangeNotifier {
  UpdateMovePokemonUsecase updateMovePokemonUsecase;
  UpdateEvolutionsPokemonUsecase updateEvolutionsPokemonUsecase;
  InfoController(
    this.updateMovePokemonUsecase,
    this.updateEvolutionsPokemonUsecase,
  );
  final PageController pageController = PageController(initialPage: 0, keepPage: true);

  int pageindex = 0;

  bool pageIsSelected(int index) {
    return index == pageindex;
  }

  goPage(int index) async {
    pageindex = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
    notifyListeners();
  }

  Future<MoveModel> updateMove({required PokemonModel pokemon, required String moveName}) async {
    return await updateMovePokemonUsecase(moveName: moveName, pokemon: pokemon);
  }

  Future<List<PokemonModel>> updateEvolutions(String pokemonName) async {
    return await updateEvolutionsPokemonUsecase(pokemonName);
  }
}
