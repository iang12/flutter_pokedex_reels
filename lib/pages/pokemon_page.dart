import 'package:flutter/material.dart';
import 'package:flutter_animations_reels/pages/controller.dart';
import 'package:flutter_animations_reels/data/pokemon.dart';
import 'package:flutter_animations_reels/pages/details_page.dart';
import 'package:flutter_animations_reels/pages/widgets/pokemon_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PokemonModel>> _pokemonList;
  final PokemonController _pokemonController = PokemonController();

  @override
  void initState() {
    super.initState();
    _pokemonList = _pokemonController.fetchPokemonList(140);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POKEDEX'),
      ),
      body: FutureBuilder<List<PokemonModel>>(
        future: _pokemonList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              padding: const EdgeInsets.all(12),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var pokemonData = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonDetailsPage(
                          pokemon: pokemonData,
                        ),
                      ),
                    );
                  },
                  child: PokemonCard(pokemon: pokemonData),
                );
              },
            );
          }
        },
      ),
    );
  }
}
