import 'package:flutter/material.dart';
import 'package:parcial/entity/character_entity.dart';
import 'package:parcial/helpers/getCharacter.dart';
import 'package:parcial/presentation/widgets/detail_character.dart';
import 'package:parcial/presentation/widgets/drawer.dart';

class CharacterScreen extends StatelessWidget {
  static const name = "character_screen";
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petition = GetCharacter();
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
      ),
      drawer: Menu(),
      body: FutureBuilder(
        future: petition.getPJ(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListCharacter(characters: snapshot.requireData);
        },
      ),
    );
  }
}

class ListCharacter extends StatefulWidget {
  const ListCharacter({
    super.key,
    required this.characters,
  });

  final List<CharacterEntity> characters;

  @override
  State<ListCharacter> createState() => _ListCharacterState();
}

class _ListCharacterState extends State<ListCharacter> {
  int page = 1;
  bool loading = false;
  ScrollController scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    /*scroll.addListener(() {
      if (scroll.position.pixels + 200 >= scroll.position.maxScrollExtent){
        loadInfo();
      }
     });*/
  }

  loadInfo() async {
    if (loading) return;
    loading = true;
    final petition = GetCharacter();
    page++;
    final result = await petition.getPJ();
    widget.characters.addAll(result);
    page++;
    loading = false;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      controller: scroll,
      itemCount: widget.characters.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailCharacter(id: widget.characters[index].id)));
          },
          child: Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.2,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage(widget.characters[index].img ?? ''),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          widget.characters[index].nombre.toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 44, 6, 116)),
                        ),
                        SizedBox(
                          width: size.width * 0.6,
                          child: Text(
                            textAlign: TextAlign.justify,
                            widget.characters[index].descripcion.toString(),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 44, 6, 116)),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
