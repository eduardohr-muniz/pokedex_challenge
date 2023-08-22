import 'package:flutter/material.dart';
import 'package:pokedex_challenge/src/core/helpers/pokeicon_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        child: Center(
          child: Icon(
            Pokeicon.bell,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
