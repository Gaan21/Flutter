import 'package:chat_si_no/config/theme/app_theme.dart';
import 'package:chat_si_no/presentation/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat",
      theme: AppTheme(colorSeleccionado: 5).tema(),
      debugShowCheckedModeBanner: false,
      home: const ChatScreen(),
    );
  }
}
