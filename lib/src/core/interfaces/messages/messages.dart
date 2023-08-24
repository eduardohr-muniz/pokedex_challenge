import 'package:flutter/material.dart';
import 'package:pokedex_challenge/src/core/helpers/pokeicon_icons.dart';
import 'i_messages.dart';

class Messages implements IMessages {
  final BuildContext context;
  Messages(this.context);

  @override
  void showError(String message) => _showMessage(message, Colors.red, Colors.white, false);

  @override
  void showInfo(String message) => _showMessage(message, Colors.blue, Colors.black, false);

  @override
  void showSucess(String message) => _showMessage(message, Colors.green, Colors.white, false);

  @override
  void addFavorite(String message) => _showMessage(message, Colors.white, Colors.black, true);

  @override
  void removeFavorite(String message) => _showMessage(message, Colors.white, Colors.black, true);

  void _showMessage(String message, Color color, Color colorText, bool favorite) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        width: MediaQuery.sizeOf(context).width,
        clipBehavior: Clip.hardEdge,
        content: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Color.fromRGBO(50, 50, 93, 0.25), blurRadius: 15, spreadRadius: -5, offset: Offset(-2, 5)),
              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.3), blurRadius: 16, spreadRadius: -8, offset: Offset(0, 5)),
            ],
            color: color,
            border: favorite ? Border.all(color: const Color(0xffFFD600), width: 2) : null,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Pokeicon.heart_filled,
                  color: Colors.red,
                ),
                const SizedBox(width: 10),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width - 90,
                    child: Text("Pokemon adicionado aos favoritos", style: TextStyle(color: colorText))),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0));
  }
}
