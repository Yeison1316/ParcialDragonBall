import 'package:parcial/models/transformation.dart';

class CharacterEntity{
  final int id ;
  final String? nombre;
  final String? raza;
  final String? descripcion;
  final String? img;
  final List<Transformation>? transformacion;
  

  CharacterEntity({required this.id, 
   this.nombre, 
   this.raza, 
   this.descripcion, 
   this.img,
   this.transformacion});
}