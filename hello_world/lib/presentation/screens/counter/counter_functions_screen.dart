import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Counter Functions"),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                clickCounter.toString(),
                style:
                    const TextStyle(fontSize: 200, fontWeight: FontWeight.w100),
              ),
              Text(
                (clickCounter == 1 || clickCounter == -1) ? "Click" : "Clicks",
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.w100),
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.plus_one,
              funcionAlPulsar: () {
                setState(() {
                  clickCounter++;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              icon: Icons.exposure_minus_1_rounded,
              funcionAlPulsar: () {
                setState(() {
                  if (clickCounter == 0) return;
                  clickCounter--;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              icon: Icons.refresh_rounded,
              funcionAlPulsar: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            )
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    this.funcionAlPulsar,
  });

  final IconData icon;
  final VoidCallback? funcionAlPulsar;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //shape: const StadiumBorder(),
      //backgroundColor: const Color.fromARGB(179, 186, 189, 186),
      onPressed: funcionAlPulsar,
      enableFeedback: true,
      elevation: 5,
      child: Icon(icon),
    );
  }
}
