import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons screen"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("data"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("data2"),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text("ZZZZ"),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text("Rellenar"),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_balance_rounded),
              label: const Text("money"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("Outline"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_business_outlined),
              label: const Text("Tienda"),
            ),
            TextButton(
              onPressed: () {},
              child: const Icon(Icons.add_business_outlined),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_business_outlined),
              label: const Text("Tienda"),
            ),
            const CustomButton(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.zoom_in_map_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.zoom_in_map_outlined),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(
                  Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    //Pruebasss

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Hola Mundo",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
