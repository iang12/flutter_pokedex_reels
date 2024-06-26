import 'package:flutter/material.dart';
import 'package:flutter_animations_reels/data/pokemon.dart';
import 'package:flutter_animations_reels/pages/details_page.dart';
import 'package:flutter_animations_reels/pages/widgets/pokemon_card.dart';

class PokemonCardsList extends StatelessWidget {
  final List<PokemonModel> pokemonList;

  const PokemonCardsList({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      padding: const EdgeInsets.all(12),
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PokemonDetailsPage(pokemon: pokemonList[index]),
              ),
            );
          },
          child: PokemonCard(pokemon: pokemonList[index]),
        );
      },
    );
  }
}
