class PokemonEntity {
  final int id;
  final String name;
  final String image;
  final List<String> abilities;
  final List<Map<String, dynamic>> stats;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.abilities,
    required this.stats,
  });
}
