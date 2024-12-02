import 'package:dio/dio.dart';
import 'package:parcial/entity/pokemon_entity.dart';
import 'package:parcial/models/pokemon.dart';

class GetPokemons {
  final Dio _dio = Dio();
  static const String _baseUrl = 'https://apidragonball.onrender.com/api';

  Future<List<PokemonEntity>> getAllPokemons() async {
    List<PokemonEntity> allPokemons = [];

    try {
      final response = await _dio.get("$_baseUrl/pokemon");
      final results = response.data['results'] as List;

      for (var result in results) {
        final pokemon = Pokemon.fromJson(result);
        allPokemons.add(PokemonEntity(
          id: pokemon.id,
          name: pokemon.name,
          image: pokemon.image,
          abilities: List<String>.from(
              pokemon.abilities), // Aseguramos que sea una lista de String
          stats: pokemon.stats
              .map((stat) => {
                    "statName": stat.statName,
                    "baseStat": stat.baseStat.toString(),
                  })
              .toList(), // Convertimos las estadísticas a un formato adecuado
        ));
      }

      return allPokemons;
    } catch (e) {
      throw Exception('Error fetching Pokémon: $e');
    }
  }
}
