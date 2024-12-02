class Pokemon {
  final int id;
  final String name;
  final String image;
  final List<String>
      abilities; // Aseguramos que las habilidades sean una lista de String
  final List<Stat> stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.abilities,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    var abilitiesList = List<String>.from(
        json['abilities']); // Habilidades como lista de Strings
    var statsList =
        (json['stats'] as List).map((stat) => Stat.fromJson(stat)).toList();

    return Pokemon(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      abilities: abilitiesList,
      stats: statsList,
    );
  }
}

class Stat {
  final String statName;
  final int baseStat;

  Stat({required this.statName, required this.baseStat});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      statName: json['statName'],
      baseStat: json['baseStat'],
    );
  }
}
