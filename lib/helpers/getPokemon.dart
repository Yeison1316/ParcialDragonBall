import 'package:dio/dio.dart';
import 'package:parcial/entity/pokemon_entity.dart';
import 'package:parcial/models/pokemon.dart';

class GetPokemons {
  final Dio _dio = Dio();
  static const String _baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future<List<PokemonEntity>> getAllPokemons() async {
    List<PokemonEntity> allPokemons = [];
    int limit = 30;
    int offset = 0;

    try {
      final response = await _dio.get("$_baseUrl?limit=$limit&offset=$offset");
      final results = response.data['results'] as List;

      for (var result in results) {
        final pokemonName = result['name'];
        final pokemonDetailsResponse = await _dio.get("$_baseUrl$pokemonName");

        final pokemon = Pokemon.fromJson(pokemonDetailsResponse.data);

        // Transforma las habilidades a List<String> y las estadísticas a List<Map<String, String>>
        allPokemons.add(PokemonEntity(
          id: pokemon.id,
          name: pokemon.name,
          image: pokemon.image,
          abilities:
              pokemon.abilities.map((ability) => ability.abilityName).toList(),
          stats: pokemon.stats
              .map((stat) =>
                  {"statName": stat.statName, "baseStat": stat.baseStat})
              .toList(),
        ));
      }

      return allPokemons;
    } catch (e) {
      throw Exception('Error fetching Pokémon: $e');
    }
  }
}
