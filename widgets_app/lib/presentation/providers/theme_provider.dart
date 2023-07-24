import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final StateProvider<bool> isDarkModeProvider =
    StateProvider<bool>((ref) => false);

final Provider<List<Color>> colorListProvider =
    Provider<List<Color>>((ref) => colorList);

final StateProvider<int> selectedIndexColorProvider =
    StateProvider<int>((ref) => 0);

final themeNotifierProvider =
//Primero la clase que controla y despues la instancian que se crea
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  //Estado = nueva instancia de AppTheme
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(modoNoche: !state.modoNoche);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
