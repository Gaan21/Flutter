import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final String nombreRuta;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.nombreRuta,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: "Botones",
    subtitle: "Varios botones en Flutter",
    link: "/buttons",
    nombreRuta: ButtonsScreen.name,
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: "Tarjetas",
    subtitle: "Contenedor estilizado",
    link: "/cards",
    nombreRuta: CardsScreen.name,
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: "Progress Indicators",
    subtitle: "Generales y controlados",
    link: "/progress",
    nombreRuta: ProgressScreen.name,
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: "SnackBars y diálogos",
    subtitle: "Indicadores en pantalla",
    link: "/snackbars",
    nombreRuta: SnackbarScreen.name,
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: "Animated controller",
    subtitle: "Statefull widget animado",
    link: "/animated",
    nombreRuta: AnimatedScreen.name,
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    title: "UI Controls + Titles",
    subtitle: "Una serie de controles en Flutter",
    link: "/ui-controls",
    nombreRuta: UiControlsScreen.name,
    icon: Icons.car_rental_rounded,
  ),
  MenuItem(
    title: "Tutorial",
    subtitle: "Primeros pasos",
    link: "/tutorial",
    nombreRuta: AppTutorialScreen.name,
    icon: Icons.accessibility_rounded,
  ),
  MenuItem(
    title: "InfiniteScroll y Pull",
    subtitle: "Listas infinitas y pull to refresh",
    link: "/infinite",
    nombreRuta: InfiniteScrollScreen.name,
    icon: Icons.list_alt_outlined,
  ),
];
