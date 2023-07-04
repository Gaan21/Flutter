import 'package:flutter/material.dart';

const Color _customColor = Color(0xff49149f);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int colorSeleccionado;

  AppTheme({
    this.colorSeleccionado = 0,
  }) : assert(colorSeleccionado >= 0 && colorSeleccionado < _colorThemes.length,
            "Los colores deben estar entre 0 y ${_colorThemes.length - 1}");

  ThemeData tema() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[colorSeleccionado],
      brightness: Brightness.dark,
    );
  }
}
