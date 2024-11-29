class Transformation{
  
  final int id;
  final String? name;
  final String? ki;
  final String? image;

  Transformation({required this.id, 
  this.name, 
  this.ki,  
  this.image});

  factory Transformation.fromJsonMap(Map<dynamic , dynamic> json)
  => Transformation(
    id:json["id"],
    name: json["name"] ?? "No name",
    ki: json["ki"] ?? "No ki",
    image: json["image"] ?? "No image"
    );

} 