import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = "progress_screen";

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress indicators"),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text("Circular progress indicator"),
          SizedBox(
            height: 15,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),
          SizedBox(
            height: 30,
          ),
          Text("Progress indicator circular y controlado"),
          SizedBox(
            height: 15,
          ),
          _ControllerProgressIndicator()
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 4) / 100;
      }).takeWhile((value) => value <= 100),
      //Snapshot es el valor del stream
      builder: (context, snapshot) {
        final progress = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.black45,
                value: progress,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: LinearProgressIndicator(value: progress),
              ),
            ],
          ),
        );
      },
    );
  }
}
