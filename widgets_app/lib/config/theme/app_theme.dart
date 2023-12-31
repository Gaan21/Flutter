import 'package:flutter/material.dart';

const List<Color> colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.deepPurple,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;

  final bool modoNoche;

  AppTheme({this.modoNoche = false, this.selectedColor = 0})
      : assert(selectedColor >= 0,
            "El color seleccionado tiene que ser mayor que cero"),
        assert(selectedColor < colorList.length,
            "El color seleccionado tiene que ser menor que ${colorList.length}");

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: modoNoche ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      );

  AppTheme copyWith({int? selectedColor, bool? modoNoche}) {
    return AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        modoNoche: modoNoche ?? this.modoNoche);
  }
}
