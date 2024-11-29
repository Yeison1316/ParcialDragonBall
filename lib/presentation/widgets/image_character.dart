import 'package:flutter/material.dart';

class ImageCharacter extends StatelessWidget {
  String image;
   ImageCharacter({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: Image.network(image,
      width: size.width * 0.5,
      height: size.width * 0.5,
      fit: BoxFit.contain,),
    );
  }
}