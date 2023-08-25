import 'package:flutter/material.dart';

import 'package:pokedex_challenge/src/core/domain/repositories/i_pokemons_repository.dart';
import 'package:pokedex_challenge/src/core/helpers/messages.dart';
import 'package:pokedex_challenge/src/core/interfaces/htpp/http_exception.dart';
import 'package:pokedex_challenge/src/core/models/pokemon/pokemon_model.dart';
import 'package:pokedex_challenge/src/modules/favorites/aplication/use_cases/get_favorites_usecase.dart';
import 'package:pokedex_challenge/src/modules/favorites/aplication/use_cases/insert_favorite_usecase.dart';
import 'package:pokedex_challenge/src/modules/favorites/aplication/use_cases/remove_favorite_usecase.dart';

import '../../home/aplication/use_cases/get_dialog_description_view_model_usecase.dart';
import '../../home/domain/view_model/card_pokemon_view_model.dart';
import '../../info/domain/view_model/modal_info_view_model.dart';

class FavoriteController extends ChangeNotifier {
  GetDialogDescriptionViewModelUsecase getDialogDescriptionViewModelUsecase;
  GetFavoritesUsecase getFavoritesUsecase;
  InsertFavoriteUsecase inserFavoriteUsecase;
  RemoveFavoriteUsecase removeFavoriteUsecase;
  IPokemonsRepository pokemonsRepository;
  FavoriteController(
    this.getDialogDescriptionViewModelUsecase,
    this.getFavoritesUsecase,
    this.inserFavoriteUsecase,
    this.removeFavoriteUsecase,
    this.pokemonsRepository,
  ) {
    getFavorites();
  }
  ValueNotifier<List<String>> favorites = ValueNotifier(<String>[]);

  bool isFavorite(String pokemonName) {
    return favorites.value.contains(pokemonName);
  }

  getFavorites() async {
    favorites.value.clear();
    favorites.value = await getFavoritesUsecase() ?? [];
    notifyListeners();
  }

  changeFavorite(PokemonModel pokemon, Messages messages) async {
    try {
      if (isFavorite(pokemon.name)) {
        await _removeFavorite(pokemon);
        notifyListeners();
        messages.removeFavorite();
      } else {
        await _inserFavorite(pokemon);
        notifyListeners();
        messages.addFavorite();
      }
    } on HttpExceptionCustom catch (e) {
      messages.showError(e.toString());
    }
  }

  _inserFavorite(PokemonModel pokemon) async {
    await removeFavoriteUsecase(pokemon);
    favorites.value.remove(pokemon.name);
    List<String> values = favorites.value;
    values.add(pokemon.name);
    favorites.value = values;
    await inserFavoriteUsecase(pokemon);
  }

  _removeFavorite(PokemonModel pokemon) async {
    List<String> values = favorites.value;
    values.remove(pokemon.name);
    favorites.value = values;
    await removeFavoriteUsecase(pokemon);
  }

  Future<CardPokemonViewModel> getCardPokemonViewModel(String name, Messages messages) async {
    try {
      CardPokemonViewModel? result;
      PokemonModel pokemonModel = await pokemonsRepository.getPokemonModel(url: "", name: name);
      result = CardPokemonViewModel.fromPokemonModel(pokemonModel);

      return result;
    } on HttpExceptionCustom catch (e) {
      messages.showError(e.toString());
      rethrow;
    }
  }

  Future<ModalInfoViewModel> getDialogDescriptionViewModel(String name, Messages messages) async {
    try {
      ModalInfoViewModel? result;
      PokemonModel pokemonModel = await pokemonsRepository.getPokemonModel(url: "", name: name);
      result = await getDialogDescriptionViewModelUsecase(pokemonModel);

      return result;
    } on HttpExceptionCustom catch (e) {
      messages.showError(e.toString());
      rethrow;
    }
  }
}
