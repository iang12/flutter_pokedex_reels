import 'package:flutter_animations_reels/utils/api_data.dart';

class PokemonModel {
  final String namePokemon;
  final String urlAPI;

  PokemonModel({required this.namePokemon, required this.urlAPI});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      namePokemon: json['name'],
      urlAPI: json['url'],
    );
  }
  String imageFormat = '.png';
  String get pokemonImageUrl =>
      '${ApiData().artworkUrl}${urlAPI.split("/")[6]}$imageFormat';
}
