import 'package:flutter/material.dart';
import 'package:parcial/entity/planet_entity.dart';
import 'package:parcial/helpers/getPlanet.dart';
import 'package:parcial/presentation/widgets/drawer.dart';

class PlanetScreen extends StatelessWidget {
    static const name = "planet_screen";
  const PlanetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petition = GetPlanet();
    return Scaffold(
      appBar: AppBar(title: Text('Planets'),),
      drawer: Menu(),
      body: FutureBuilder(
        future: petition.getPL(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        
          return ListPlanet(planets: snapshot.requireData);
          
        },),
    );
  }
}



class ListPlanet extends StatelessWidget {
  const ListPlanet({
    super.key,
    required this.planets,
  });

  final List<PlanetEntity> planets;

  @override
  Widget build(BuildContext context) {
    
  return ListView.builder(
    
    itemCount: planets.length,
    itemBuilder: (context, index) {
      return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  planets[index].nombre.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  color: const Color.fromARGB(255, 44, 6, 116)),
                ),
                Text(
                  planets[index].descripcion.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  color: const Color.fromARGB(255, 44, 6, 116)),
                ),
                Container(
                  width: 100, 
                  height: 100, 
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(planets[index].img ?? ''),
                      fit: BoxFit.cover, 
                    ),
                    borderRadius: BorderRadius.circular(8), 
                  ),
                ),
                const SizedBox(height: 8), 
              ],
            ),
          )
      );
    },
  );
}


}