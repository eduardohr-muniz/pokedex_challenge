import 'package:flutter/material.dart';
import 'package:pokedex_challenge/src/core/extensions/extension.dart';
import 'package:pokedex_challenge/src/core/helpers/pokeicon_icons.dart';

class Messages {
  final BuildContext context;
  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void showError(String message) => _showMessage(message, context.primaryColor);

  void addFavorite() => _favoriteSnack(true);

  void removeFavorite() => _favoriteSnack(false);

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: context.textTheme.titleLarge!.copyWith(color: Colors.white)),
      backgroundColor: color,
    ));
  }

  void _favoriteSnack(bool isAdd) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 700),
        width: MediaQuery.sizeOf(context).width,
        clipBehavior: Clip.hardEdge,
        content: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Color.fromRGBO(50, 50, 93, 0.25), blurRadius: 15, spreadRadius: -5, offset: Offset(-2, 5)),
              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.3), blurRadius: 16, spreadRadius: -8, offset: Offset(0, 5)),
            ],
            color: Colors.white,
            border: Border.all(color: const Color(0xffFFD600), width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isAdd ? Icon(Pokeicon.heart_filled, color: context.primaryColor) : const Icon(Pokeicon.heart, color: Colors.black),
                const SizedBox(width: 10),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width - 90,
                    child: Text(isAdd ? "Pokemon adicionado aos favoritos" : "Pokemon removido dos favoritos", style: context.textTheme.titleLarge)),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0));
  }
}
