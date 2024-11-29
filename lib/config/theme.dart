import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 86, 75, 59);

const List<Color> colorTheme = [
  Color.fromARGB(255, 235, 71, 59),
  Colors.greenAccent,
  Colors.blueAccent,
  Colors.redAccent,
  Colors.orangeAccent
];

class AppTheme {
  final int selectColor;

  AppTheme({this.selectColor = 0});

  ThemeData themeData() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorTheme[selectColor],
        scaffoldBackgroundColor: const Color.fromARGB(255, 241, 239, 239),
        appBarTheme: AppBarTheme(
            backgroundColor: colorTheme[selectColor],
            titleTextStyle:
                const TextStyle(color: Colors.white, fontSize: 20)));
  }
}
