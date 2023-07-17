import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class SlidesInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlidesInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlidesInfo>[
  SlidesInfo("Busca la comida", "Aliqua aute tempor nostrud culpa consequat.",
      "assets/images/1.png"),
  SlidesInfo(
      "Entrega rápida",
      "Nulla sunt dolor cillum ea pariatur anim exercitation adipisicing tempor.",
      "assets/images/2.png"),
  SlidesInfo(
      "Disfruta la comida",
      "Sunt sunt id ullamco culpa excepteur deserunt cupidatat esse voluptate aliqua ipsum fugiat occaecat nulla.",
      "assets/images/3.png"),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = "tutorial_screen";

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController;
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.3)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slide) => _Slide(
                      slide: slide,
                    ))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text("Salir"),
              onPressed: () {
                return context.pop();
              },
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 700),
                    child: FilledButton(
                      onPressed: () => context.pop,
                      child: const Text("Comenzar"),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  /* final String title;
  final String caption;
  final String imageUrl; */
  final SlidesInfo slide;

  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(slide.imageUrl),
            ),
            const SizedBox(height: 20),
            Text(
              slide.title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              slide.caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
