import 'package:dio/dio.dart';
import 'package:parcial/entity/transformation_entity.dart';
import 'package:parcial/models/transformation.dart';

class GetTransformation {
  static const url = "https://dragonball-api.com/api/characters/";
  final _dio = Dio();

  Future<List<TransformationEntity>> getTF() async {
    final response = await _dio.get("id");
    final temp = response.data["items"];
    List<TransformationEntity> TF = [];
    Transformation chModel;
    for (var i = 0; i < temp.length; i++) {
      chModel = Transformation.fromJsonMap(temp[i]);
      TF.add(TransformationEntity(
        id: chModel.id,
        nombre: chModel.name,
        poder: chModel.ki,
        img: chModel.image,
      ));
    }
    return TF;
  }
}
