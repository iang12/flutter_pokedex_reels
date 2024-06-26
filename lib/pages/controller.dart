import 'package:flutter_animations_reels/data/pokemon.dart';
import 'package:flutter_animations_reels/utils/api_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonController {
  ApiData apiData = ApiData();
  Future<List<PokemonModel>> fetchPokemonList(int totalPokemons) async {
    final response = await http
        .get(Uri.parse('${apiData.urlBase}pokemon?limit=$totalPokemons'));
    switch (response.statusCode) {
      case 200:
        final List<dynamic> parsedJson = json.decode(response.body)['results'];
        return parsedJson
            .map((pokemon) => PokemonModel.fromJson(pokemon))
            .toList();
      default:
        throw Exception('Failed to load Pokemon list');
    }
  }
}
