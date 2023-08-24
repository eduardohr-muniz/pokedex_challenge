import 'package:flutter/material.dart';

import 'package:pokedex_challenge/src/core/helpers/pokeicon_icons.dart';

class TagEntity {
  String name;
  Color color;
  Color colorCard;
  IconData icon;
  TagEntity({
    this.name = '',
    required this.color,
    required this.colorCard,
    required this.icon,
  });
  static final Map<String, TagEntity> _tags = {
    "grass": TagEntity(name: "grass", color: const Color(0xff1B932C), colorCard: const Color(0xff70D090), icon: Pokeicon.grass),
    "poison": TagEntity(name: "poison", color: const Color(0xff8849B0), colorCard: const Color(0xff8d8ecb), icon: Pokeicon.poison),
    "fire": TagEntity(name: "fire", color: const Color(0xffF10A34), colorCard: const Color(0xffEC8C4C), icon: Pokeicon.fire),
    "flying": TagEntity(name: "flying", color: const Color(0xff9EC4DD), colorCard: const Color(0xff20C5F5), icon: Pokeicon.flying),
    "water": TagEntity(name: "water", color: const Color(0xff265DFC), colorCard: const Color(0xff20C5F5), icon: Pokeicon.water),
    "normal": TagEntity(name: "normal", color: const Color(0xff7D3600), colorCard: const Color(0xffFFE0CA), icon: Pokeicon.normal),
    "electric": TagEntity(name: "electric", color: const Color(0xffF8A801), colorCard: const Color(0xffFCF47C), icon: Pokeicon.electric),
    "ground": TagEntity(name: "ground", color: const Color(0xff673E2C), colorCard: const Color(0xff9E6E53), icon: Pokeicon.ground),
    "fairy": TagEntity(name: "fairy", color: const Color(0xffFF48CC), colorCard: const Color(0xffFDB7DA), icon: Pokeicon.fairy),
    "bug": TagEntity(name: "bug", color: const Color(0xff54DC44), colorCard: const Color(0xffD0EC94), icon: Pokeicon.bug),
    "fighting": TagEntity(name: "fighting", color: const Color(0xff0F0905), colorCard: const Color(0xffB8B8B8), icon: Pokeicon.fighting),
    "psychic": TagEntity(name: "psychic", color: const Color(0xff6114BC), colorCard: const Color(0xffA98DF8), icon: Pokeicon.psychic),
    "rock": TagEntity(name: "rock", color: const Color(0xff54473D), colorCard: const Color(0xff9A8371), icon: Pokeicon.rock),
    "steel": TagEntity(name: "steel", color: const Color(0xff5D666E), colorCard: const Color(0xff7A95AA), icon: Pokeicon.steel),
    "ice": TagEntity(name: "ice", color: const Color(0xff8FC3E9), colorCard: const Color(0xff20C5F5), icon: Pokeicon.ice),
    "ghost": TagEntity(name: "ghost", color: const Color(0xff8A8886), colorCard: const Color(0xffCDCDCD), icon: Pokeicon.ghost),
    "dark": TagEntity(name: "dark", color: const Color(0xff040534), colorCard: const Color(0xff8D8ECB), icon: Pokeicon.dark),
    "dragon": TagEntity(name: "dragon", color: const Color(0xff0804B4), colorCard: const Color(0xffB7DBFF), icon: Pokeicon.dragon),
  };

  static List<TagEntity> get tags => _tags.values.toList();
  static TagEntity tagEquals(String name) {
    return _tags[name] ?? TagEntity(name: "grass", color: const Color(0xff1B932C), colorCard: const Color(0xff70D090), icon: Pokeicon.grass);
  }
}
