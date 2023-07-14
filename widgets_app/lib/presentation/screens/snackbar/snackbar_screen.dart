import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = "snackbar_screen";

  const SnackbarScreen({super.key});

  void ShowCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Hola mundo"),
        action: SnackBarAction(label: "Ok", onPressed: () {}),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar y diálogos"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ShowCustomSnackBar(context);
        },
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text("Mostrar SnackBar"),
      ),
    );
  }
}
