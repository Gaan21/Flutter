import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Chat si no"),
        ),
        body: Center(
          child: FilledButton.tonal(
            onPressed: () {},
            child: const Text("Clik aqui"),
          ),
        ),
      ),
    );
  }
}
