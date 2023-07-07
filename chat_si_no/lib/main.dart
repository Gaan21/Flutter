import 'dart:io';

import 'package:chat_si_no/config/http_conexion.dart';
import 'package:chat_si_no/config/theme/app_theme.dart';
import 'package:chat_si_no/presentation/providers/chat_provider.dart';
import 'package:chat_si_no/presentation/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        title: "Chat",
        theme: AppTheme(colorSeleccionado: 5).tema(),
        debugShowCheckedModeBanner: false,
        home: const ChatScreen(),
      ),
    );
  }
}
