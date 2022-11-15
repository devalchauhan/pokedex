import 'dart:html';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokedex/app/data/helpers.dart';
import 'package:pokedex/app/models/pokemon_model.dart';

import '../controllers/pokemon_details_controller.dart';

class PokemonDetailsView extends GetView<PokemonDetailsController> {
  PokemonDetailsView({Key? key}) : super(key: key);

  final PokemonModel pokemon = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${pokemon.name!.capitalize}'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: getColorByType(pokemon.types!.first.type!.name!),
        flexibleSpace: Text('data'),
      ),
      body: CustomScrollView(),
    );
  }
}
