import 'package:flutter/material.dart';
import 'package:flutter_animations_reels/data/pokemon.dart';
import 'package:flutter_animations_reels/utils/capitalize.dart';

class PokemonDetailsPage extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonDetailsPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(capitalizeFirstLetter(pokemon.namePokemon)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: pokemon.namePokemon,
              child: Image.network(
                pokemon.pokemonImageUrl,
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              capitalizeFirstLetter(
                pokemon.namePokemon,
              ),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
