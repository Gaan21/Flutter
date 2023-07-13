import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';

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
];
