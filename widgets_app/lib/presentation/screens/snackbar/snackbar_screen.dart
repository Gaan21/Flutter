import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = "snackbar_screen";

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Hola mundo"),
        action: SnackBarAction(label: "Ok", onPressed: () {}),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void openDialog(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Estas seguro"),
          content: const Text(
              "Voluptate nostrud incididunt ad et proident. Ipsum consectetur dolore do duis velit in sint dolore laborum et. Sunt consequat nostrud duis laboris officia est adipisicing sunt et exercitation."),
          actions: [
            TextButton(
              onPressed: () {
                return context.pop();
              },
              child: const Text("Cancelar"),
            ),
            FilledButton(
              onPressed: () {
                return context.pop();
              },
              child: const Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar y diálogos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text("Como están los máquinas, lo primero de todo"),
                ]);
              },
              child: const Text("Licencias"),
            ),
            FilledButton.tonal(
              onPressed: () {},
              child: const Text("Mostrar diálogo"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackBar(context);
        },
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text("Mostrar SnackBar"),
      ),
    );
  }
}
