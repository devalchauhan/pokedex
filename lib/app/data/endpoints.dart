class Endpoints {
  static String baseUrl = 'https://pokeapi.co/api/v2/pokemon';
  static String allPokemons = '$baseUrl?offset=1&limit=10';
  static String pokeId = '$baseUrl/';

  static String allPokemonsWithPage(int offset) =>
      '$baseUrl?offset=$offset&limit=6';
}
