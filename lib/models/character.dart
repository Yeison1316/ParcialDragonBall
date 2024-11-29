import 'package:parcial/models/transformation.dart';

class Character{
  
  final int id;
  final String? name;
  final String? race;
  final String? description;
  final String? image;
  final List<Transformation> ? transformation;

  Character({required this.id, 
  this.name, 
  this.race, 
  this.description, 
  this.image,
  this.transformation});
  

  factory Character.fromJsonMap(Map<dynamic , dynamic> json)
  => Character(
    id:json["id"],
    name: json["name"] ?? "No name",
    race: json["race"] ?? "No race",
    description: json["description"] ?? "No description",
    image: json["image"] ?? "No image",
    transformation: (json["transformations"] as List<dynamic>?)
      ?.map((item) => Transformation.fromJsonMap(item))
      .toList() ?? []
    );

} 