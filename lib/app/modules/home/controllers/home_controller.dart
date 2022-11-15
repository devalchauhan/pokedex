import 'dart:async';
import 'dart:developer';

import 'package:avio/avio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/data/endpoints.dart';
import 'package:pokedex/app/models/pokelist_model.dart';
import 'package:pokedex/app/models/pokemon_model.dart';

class HomeController extends GetxController {
  late ScrollController scrollController;
  RxInt page = 1.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingExtra = false.obs;
  RxList<PokeListModel> pokeList = <PokeListModel>[].obs;
  RxList<PokemonModel> pokemons = <PokemonModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void onReady() {
    fetchPokemonList();
    super.onReady();
  }

  void _scrollListener() {
    print(scrollController.offset);
    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      log('LOADING MORE');
      if (!isLoading.value && !isLoadingExtra.value) {
        page.value++;
        loadMoreData();
      }
    }
  }

  fetchPokemonList() async {
    isLoading.value = true;

    ApiCall.instance.rest(
      params: {},
      serviceUrl: Endpoints.allPokemons,
      showLoader: false,
      methodType: RestMethod.get,
      error: (status, error) {
        isLoading.value = false;
      },
      success: (status, data) async {
        try {
          if (status == 200) {
            PokeListResults pokeListResults = PokeListResults();
            pokeListResults = PokeListResults.fromJson(data);
            if (pokeListResults.results != null) {
              pokeList.value = pokeListResults.results!;
              List<Future> futures = [];
              for (PokeListModel item in pokeList.value) {
                futures.add(getPokemon(item.url!));
              }
              await Future.wait(futures).then((value) {
                isLoading.value = false;
              });
            }
          }
        } catch (e) {
          isLoading.value = false;
          log('GetPokemonList : Couldn\'t handle following : \n $e');
        }
      },
    );
  }

  loadMoreData() async {
    isLoadingExtra.value = true;
    ApiCall.instance.rest(
      params: {},
      serviceUrl: Endpoints.allPokemonsWithPage(page.value),
      showLoader: false,
      methodType: RestMethod.get,
      error: (status, error) {
        isLoadingExtra.value = false;
      },
      success: (status, data) async {
        try {
          if (status == 200) {
            PokeListResults pokeListResults = PokeListResults();
            pokeListResults = PokeListResults.fromJson(data);
            if (pokeListResults.results != null) {
              pokeList.addAll(pokeListResults.results!);
              List<Future> futures = [];
              for (PokeListModel item in pokeListResults.results!) {
                futures.add(getPokemon(item.url!));
                // await getPokemon(item.url!);
              }
              await Future.wait(futures).then((value) {
                isLoadingExtra.value = false;
              });
            }
          }
        } catch (e) {
          isLoadingExtra.value = false;
          log('GetPokemonListExtra : Couldn\'t handle following : \n $e');
        }
      },
    );
  }

  Future getPokemon(String url) async {
    Completer completer = Completer();
    ApiCall.instance.rest(
      params: {},
      serviceUrl: url,
      showLoader: false,
      methodType: RestMethod.get,
      success: (status, data) {
        if (status == 200) {
          try {
            pokemons.add(PokemonModel.fromJson(data));
            return completer.complete(true);
          } catch (e) {
            log('GetPokemon : Couldn\'t handle following : \n $e');
            return completer.complete(false);
          }
        }
      },
    );
    return completer.future;
  }
}
