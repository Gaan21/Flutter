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
            FloatingActionButton(
              shape: const StadiumBorder(),
              backgroundColor: const Color.fromARGB(255, 182, 69, 61),
              onPressed: () {
                setState(() {
                  clickCounter += 1;
                });
              },
              child: const Icon(Icons.plus_one),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              shape: const LinearBorder(),
              backgroundColor: const Color.fromARGB(24, 33, 21, 207),
              onPressed: () {
                if (clickCounter == 0) return;
                setState(() {
                  clickCounter -= 1;
                });
              },
              child: const Icon(Icons.exposure_minus_1_outlined),
            ),
          ],
        ));
  }
}
