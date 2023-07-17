import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = "ui_controlls_screen";

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls"),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransport = Transportation.car;
  bool breakfast = false;
  bool lunch = false;
  bool dinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Developer Mode"),
          subtitle: const Text("Controles adicionales"),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text("Vehículo de transporte"),
          subtitle: Text("$selectedTransport"),
          children: [
            RadioListTile(
              title: const Text("En coche"),
              subtitle: const Text("Viajar en coche"),
              value: Transportation.car,
              groupValue: selectedTransport,
              onChanged: (value) {
                setState(() {
                  selectedTransport = Transportation.car;
                });
              },
            ),
            RadioListTile(
              title: const Text("En barco"),
              subtitle: const Text("Viajar en barco"),
              value: Transportation.boat,
              groupValue: selectedTransport,
              onChanged: (value) {
                setState(() {
                  selectedTransport = Transportation.boat;
                });
              },
            ),
            RadioListTile(
              title: const Text("En avión"),
              subtitle: const Text("Viajar en avión"),
              value: Transportation.plane,
              groupValue: selectedTransport,
              onChanged: (value) {
                setState(() {
                  selectedTransport = Transportation.plane;
                });
              },
            ),
            RadioListTile(
              title: const Text("En submarino"),
              subtitle: const Text("Viajar en submarino"),
              value: Transportation.submarine,
              groupValue: selectedTransport,
              onChanged: (value) {
                setState(() {
                  selectedTransport = Transportation.submarine;
                });
              },
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text("¿Desayuno?"),
          value: breakfast,
          onChanged: (value) {
            setState(() {
              breakfast = !breakfast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("¿Almuerzo?"),
          value: lunch,
          onChanged: (value) {
            setState(() {
              lunch = !lunch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("¿Cena?"),
          value: dinner,
          onChanged: (value) {
            setState(() {
              dinner = !dinner;
            });
          },
        ),
      ],
    );
  }
}
