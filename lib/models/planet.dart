class Planet{
  
  final int id;
  final String? name;
  final bool? isDestroyed;
  final String? description;
  final String? image;

  Planet({required this.id, 
  this.name, 
  this.isDestroyed, 
  this.description, 
  this.image});

  factory Planet.fromJsonMap(Map<dynamic , dynamic> json)
  => Planet(
    id:json["id"],
    name: json["name"] ?? "No name",
    isDestroyed: json["isDestroyed"] ?? "No destroyed",
    description: json["description"] ?? "No description",
    image: json["image"] ?? "No image"
    );

} 