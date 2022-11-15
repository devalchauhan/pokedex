import 'package:flutter/material.dart';
import 'package:pokedex/app/constants/colors.dart';
import 'package:pokedex/app/constants/constants.dart';

Color getColorByType(String type) {
  switch (type) {
    case 'fire':
      return ColorConstants.fire;
    case 'water':
      return ColorConstants.water;
    case 'electric':
      return ColorConstants.electric;
    case 'grass':
      return ColorConstants.grass;
    case 'ice':
      return ColorConstants.ice;
    case 'fighting':
      return ColorConstants.fighting;
    case 'poison':
      return ColorConstants.poison;
    case 'ground':
      return ColorConstants.ground;
    case 'flying':
      return ColorConstants.flying;
    case 'psychic':
      return ColorConstants.psychic;
    case 'bug':
      return ColorConstants.bug;
    case 'rock':
      return ColorConstants.rock;
    case 'ghost':
      return ColorConstants.ghost;
    case 'dragon':
      return ColorConstants.dragon;
    case 'dark':
      return ColorConstants.dark;
    case 'steel':
      return ColorConstants.steel;
    case 'fairy':
      return ColorConstants.fairy;
    default:
      return ColorConstants.normal;
  }
}
