import 'package:flutter/material.dart';
import 'package:parcial/presentation/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Center(child: WidgetConFondo()),
      drawer: Menu(),
    );
  }
}

class WidgetConFondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: NetworkImage(''),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Texto con sombra
          Text(
            'Welcome to DBZ API',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.6),
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
          // Botón o acción adicional
          Positioned(
            bottom: 20,
            child: ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('¡Botón presionado!')),
                );
              },
              child: Text('Haz clic'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
