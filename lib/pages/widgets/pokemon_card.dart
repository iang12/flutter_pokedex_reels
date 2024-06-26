import 'package:flutter/material.dart';
import 'package:flutter_animations_reels/data/pokemon.dart';
import 'package:flutter_animations_reels/utils/capitalize.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: pokemon.namePokemon,
            child: Image.network(
              pokemon.pokemonImageUrl,
              height: 100,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            capitalizeFirstLetter(pokemon.namePokemon),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
