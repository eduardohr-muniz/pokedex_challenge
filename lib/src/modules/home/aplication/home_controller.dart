import 'package:flutter/material.dart';
import 'package:pokedex_challenge/src/modules/info/domain/view_model/modal_info_view_model.dart';

import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/get_card_pockemons_view_models_usecase.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/get_dialog_description_view_model_usecase.dart';
import 'package:pokedex_challenge/src/modules/home/aplication/use_cases/get_pokemon_list_result_model_usecase.dart';

import '../../../core/models/pokemon_list_model.dart';
import '../domain/view_model/card_pokemon_view_model.dart';

class HomeController extends ChangeNotifier {
  final GetPokemonListResultModelUsecase getPokemonListResultModelUseCase;
  final GetCardPockemonViewModelUsecase getCardPockemonViewModelUseCase;
  final GetDialogDescriptionViewModelUsecase getDialogDescriptionViewModelUsecase;

  HomeController({
    required this.getPokemonListResultModelUseCase,
    required this.getCardPockemonViewModelUseCase,
    required this.getDialogDescriptionViewModelUsecase,
  });

  List<PokemonListResultModel> items = [];
  int _offSet = 0;
  final int _limit = 20;
  bool isLoading = false;

  void initItems() {
    items = [];
    _offSet = 0;
    loadNextItems();
  }

  void pagination(ScrollController scrollController) {
    int cardHeight = 240;
    double position = scrollController.position.pixels;
    double maxPositon = scrollController.position.maxScrollExtent;
    if ((position + cardHeight > maxPositon) && (items.length - 1 < _offSet) && isLoading == false) {
      loadNextItems();
    }
  }

  Future<void> loadNextItems() async {
    isLoading = true;
    List<PokemonListResultModel> nextItems = await getPokemonListResultModelUseCase(limit: _limit, offSet: _offSet);
    items.addAll(nextItems);
    _offSet += _limit;
    isLoading = false;
    notifyListeners();
  }

  Future<CardPokemonViewModel> getCardPokemonViewModel(PokemonListResultModel pokemonListResultModel) async {
    CardPokemonViewModel result;
    result = await getCardPockemonViewModelUseCase(pokemonListResultModel);
    return result;
  }

  Future<ModalInfoViewModel> getDialogDescriptionViewModel(PokemonListResultModel pokemonListResultModel) async {
    ModalInfoViewModel result;
    result = await getDialogDescriptionViewModelUsecase(pokemonListResultModel);
    return result;
  }
}
