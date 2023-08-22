import 'package:flutter/material.dart';
import 'package:pokedex_challenge/src/core/helpers/pokeicon_icons.dart';

class TagEntity {
  String name;
  Color color;
  IconData icon;
  TagEntity({
    this.name = '',
    required this.color,
    required this.icon,
  });
  static List<TagEntity> tags = [
    TagEntity(name: "grass", color: const Color(0xff1B932C), icon: Pokeicon.grass),
    TagEntity(name: "poison", color: const Color(0xff8849B0), icon: Pokeicon.poison),
    TagEntity(name: "fire", color: const Color(0xffF10A34), icon: Pokeicon.fire),
    TagEntity(name: "flying", color: const Color(0xff9EC4DD), icon: Pokeicon.flying),
    TagEntity(name: "water", color: const Color(0xff265DFC), icon: Pokeicon.water),
    TagEntity(name: "normal", color: const Color(0xff7D3600), icon: Pokeicon.normal),
    TagEntity(name: "electric", color: const Color(0xffF8A801), icon: Pokeicon.electric),
    TagEntity(name: "ground", color: const Color(0xff673E2C), icon: Pokeicon.ground),
    TagEntity(name: "fairy", color: const Color(0xffFF48CC), icon: Pokeicon.fairy),
    TagEntity(name: "bug", color: const Color(0xff54DC44), icon: Pokeicon.bug),
    TagEntity(name: "fighting", color: const Color(0xff0F0905), icon: Pokeicon.fighting),
    TagEntity(name: "psychic", color: const Color(0xff6114BC), icon: Pokeicon.psychic),
    TagEntity(name: "rock", color: const Color(0xff54473D), icon: Pokeicon.rock),
    TagEntity(name: "steel", color: const Color(0xff5D666E), icon: Pokeicon.steel),
    TagEntity(name: "ice", color: const Color(0xff8FC3E9), icon: Pokeicon.ice),
    TagEntity(name: "ghost", color: const Color(0xff8A8886), icon: Pokeicon.ghost),
    TagEntity(name: "dark", color: const Color(0xff040534), icon: Pokeicon.dark),
    TagEntity(name: "dragon", color: const Color(0xff0804B4), icon: Pokeicon.dragon),
  ];

  static TagEntity tagEquals(String name) {
    return tags.where((tag) => tag.name == name).first;
  }
}
