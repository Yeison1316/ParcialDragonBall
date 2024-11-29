import 'package:flutter/material.dart';
import 'package:parcial/entity/character_entity.dart';
import 'package:parcial/helpers/getCharacter.dart';
import 'package:parcial/presentation/screens/transformation/transformation_screen.dart';
import 'package:parcial/presentation/widgets/image_character.dart';

class DetailCharacter extends StatefulWidget {
  final int id;

  const DetailCharacter({super.key, required this.id});

  @override
  State<DetailCharacter> createState() => _DetailCharacterState();
}

class _DetailCharacterState extends State<DetailCharacter> {

  final petition = GetCharacter();
  late CharacterEntity character = CharacterEntity(id: 0);
  bool loader = true;

  void getData() async{
    CharacterEntity newCharacter = await petition.getCharacterOnly(widget.id);
    character = newCharacter;
    loader = false;
    setState(() {
      
    });
  }
  
  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(loader){
      return CircularProgressIndicator();
    }
    return Scaffold(
      appBar: AppBar(
        title:Text(character.nombre.toString()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageCharacter(image: character.img.toString()),
              Text(character.nombre.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
              ),
              Text(character.descripcion.toString(),textAlign: TextAlign.justify,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0,
                runSpacing: 8.0,
                children: character.transformacion!.map((transformation) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) =>
                        TransformationScreen(transformation: transformation)
                       )
                     );
                    },
                    child: Column(
                      children: [
                        Image.network(
                          transformation.image.toString(),
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                          ),
                          Text(transformation.name.toString())
                      ],
                    ),
                  );
                }).toList() ?? [],
              )
            ],
          ),
        ),
      ),
    );
  }
}