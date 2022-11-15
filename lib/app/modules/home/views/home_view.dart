import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokedex/app/models/pokemon_model.dart';
import 'package:pokedex/app/modules/home/views/pokemon_card.dart';
import 'package:pokedex/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Obx(
          () => controller.isLoading.value
              ? SizedBox(
                  height: Get.height * .9,
                  child: const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                )
              : Column(
                  children: [
                    GridView.builder(
                      primary: false,
                      itemCount: controller.pokemons.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        List<PokemonModel> list = controller.pokemons;
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.POKEMON_DETAILS,
                                arguments: list[index]);
                          },
                          child: PokeMonCard(list: list, index: index),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                    ),
                    controller.isLoadingExtra.value
                        ? const Center(
                            child: CupertinoActivityIndicator(),
                          )
                        : Container()
                  ],
                ),
        ),
      ),
    );
  }
}
