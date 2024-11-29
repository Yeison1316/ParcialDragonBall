class Pokemon {
  final int id;
  final String name;
  final String image;
  final List<Ability> abilities;
  final List<Stats> stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.abilities,
    required this.stats,
  });

  // Convertir JSON a un objeto Pokemon
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    var abilitiesFromJson = json['abilities'] as List;
    List<Ability> abilitiesList =
        abilitiesFromJson.map((i) => Ability.fromJson(i)).toList();

    var statsFromJson = json['stats'] as List;
    List<Stats> statsList =
        statsFromJson.map((i) => Stats.fromJson(i)).toList();

    return Pokemon(
      id: json['id'],
      name: json['name'],
      image: json['sprites']['front_default'],
      abilities: abilitiesList,
      stats: statsList,
    );
  }
}

class Ability {
  final String abilityName;

  Ability({required this.abilityName});
  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      abilityName: json['ability']['name'],
    );
  }
}

class Stats {
  final int baseStat;
  final String statName;

  Stats({required this.baseStat, required this.statName});

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      baseStat: json['base_stat'],
      statName: json['stat']['name'],
    );
  }
}
