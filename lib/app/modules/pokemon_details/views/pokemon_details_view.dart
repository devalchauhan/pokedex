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
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: getColorByType(pokemon.types!.first.type!.name!),
          collapsedHeight: 70,
          expandedHeight: 320,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 42.0),
              child: Image.network(
                pokemon.sprites!.other!.officialArtwork!.frontDefault!,
                height: 100,
              ),
            ),
            title: Text(
              '${pokemon.name!.capitalize}',
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(42),
                bottomRight: Radius.circular(42)),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: false,
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: Colors.white,
                margin: const EdgeInsets.all(24.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 14.0,
                      ),
                      Text(
                        'Pokédex ID : ${pokemon.id}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        'Species : ${pokemon.species!.name!.capitalize}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Height\n${pokemon.height!.toDouble().toString()}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              Text(
                                'Weight\n${pokemon.weight!.toDouble().toString()}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //
              Card(
                elevation: 0,
                color: Colors.white,
                margin: const EdgeInsets.all(24.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Statistics',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 14.0,
                      ),
                      Column(children: [
                        ...List.generate(
                            pokemon.stats!.length,
                            (index) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        '${pokemon.stats![index].stat!.name!.capitalize}',
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blueGrey,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Text(
                                        '${pokemon.stats![index].baseStat} / 100')
                                  ],
                                )).toList(),
                      ]),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
              ), //
              Card(
                elevation: 0,
                color: Colors.white,
                margin: const EdgeInsets.all(24.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Types',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 14.0,
                      ),
                      Wrap(children: [
                        ...List.generate(
                            pokemon.types!.length,
                            (index) => Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '${pokemon.types![index].type!.name}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                )).toList()
                      ]),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
