import 'package:flutter/material.dart';
import 'package:pokedex/app/data/helpers.dart';
import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:get/get.dart';

class PokeMonCard extends StatelessWidget {
  final List<PokemonModel> list;
  final int index;
  const PokeMonCard({super.key, required this.list, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: getColorByType(list[index].types!.first.type!.name!),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    list[index].name!.capitalize!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                              list[index].types!.length,
                              (i) => Card(
                                    elevation: 0,
                                    color: Colors.white.withOpacity(0.4),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.0, horizontal: 4),
                                      child: Text(
                                          list[index].types![i].type!.name!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14)),
                                    ),
                                  )).toList()
                        ],
                      ),
                      Image.network(
                        list[index]
                            .sprites!
                            .other!
                            .officialArtwork!
                            .frontDefault!,
                        height: 100,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Text(
              '#${list[index].id!.toString()}',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
