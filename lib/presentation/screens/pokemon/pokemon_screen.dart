import 'package:flutter/material.dart';
import 'package:parcial/entity/pokemon_entity.dart';
import 'package:parcial/helpers/getPokemon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokemonsScreen(),
    );
  }
}

class PokemonsScreen extends StatefulWidget {
  static const name = "pokemon_screen";
  @override
  _PokemonsScreenState createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {
  late Future<List<PokemonEntity>> futurePokemons;

  @override
  void initState() {
    super.initState();
    futurePokemons = GetPokemons().getAllPokemons(); // Cargar todos los Pokémon
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Pokémons"),
      ),
      body: FutureBuilder<List<PokemonEntity>>(
        future: futurePokemons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No Pokémon available"));
          } else {
            final pokemons = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // que inicie con una sola columna y
                crossAxisCount: MediaQuery.of(context).size.width > 300
                    ? MediaQuery.of(context).size.width > 600
                        ? MediaQuery.of(context).size.width > 1000
                            ? 6
                            : 4
                        : 2
                    : 1,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              padding: const EdgeInsets.all(10.0),
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];
                return CardPokemon(pokemon: pokemon);
              },
            );
          }
        },
      ),
    );
  }
}

class CardPokemon extends StatelessWidget {
  final PokemonEntity pokemon;
  const CardPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    'https://static.vecteezy.com/system/resources/thumbnails/016/412/989/small/abstract-red-background-with-light-blue-gradient-lines-comic-design-vector.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    pokemon.image,
                    fit: BoxFit.cover,
                    width: 110,
                    height: 110,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  pokemon.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5.0),
                Text(
                  "Abilities: ${pokemon.abilities.join(', ')}",
                  style: const TextStyle(
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                Text(pokemon.stats[0]['statName'] +
                    ': ' +
                    pokemon.stats[0]['baseStat'].toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
