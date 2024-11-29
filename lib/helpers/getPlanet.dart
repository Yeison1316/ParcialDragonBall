import 'package:dio/dio.dart';
import 'package:parcial/entity/planet_entity.dart';
import 'package:parcial/models/planet.dart';

class GetPlanet {
  static const url = "http://localhost:8080/api";
  final _dio = Dio();

  Future<List<PlanetEntity>> getPL() async {
    final response = await _dio.get("$url/planeta");
    final temp = response.data["items"];
    List<PlanetEntity> PL = [];
    Planet chModel;
    for (var i = 0; i < temp.length; i++) {
      chModel = Planet.fromJsonMap(temp[i]);
      PL.add(PlanetEntity(
        id: chModel.id,
        nombre: chModel.name,
        destruido: chModel.isDestroyed,
        descripcion: chModel.description,
        img: chModel.image,
      ));
    }
    return PL;
  }
}
