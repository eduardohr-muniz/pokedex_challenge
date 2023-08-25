import 'package:flutter/material.dart';

import 'package:pokedex_challenge/src/core/log/log.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/moves_model.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/update_move_pokemon_usecase.dart';

class InfoController extends ChangeNotifier {
  UpdateMovePokemonUsecase updateMovePokemonUsecase;
  InfoController(this.updateMovePokemonUsecase);
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

  Future<MovesModel> updateMove({required String key, required MovesModel move}) async {
    return await updateMovePokemonUsecase(key: key, move: move);
  }
}
