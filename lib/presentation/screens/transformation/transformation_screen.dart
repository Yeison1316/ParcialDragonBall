import 'package:flutter/material.dart';
import 'package:parcial/models/transformation.dart';
import 'package:parcial/presentation/widgets/image_character.dart';

class TransformationScreen extends StatelessWidget {

  Transformation transformation;
  TransformationScreen({super.key,required this.transformation});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(transformation.name.toString()),

      ),
      body: Column(
        children: [
          ImageCharacter(image: transformation.image.toString()),
          Center(child: Text(transformation.name.toString()),),
          Chip(label: Text(transformation.ki.toString()))
      ]),
    );
  }
}