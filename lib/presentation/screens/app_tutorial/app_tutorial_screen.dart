import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Culpa consequat nostrud dolore officia consectetur sunt eiusmod officia quis id id.',
      'assets/images/1.png'),
  SlideInfo('Entrega Rapida', 'Laborum esse ipsum adipisicing sint.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Incididunt dolore minim non et anim magna commodo eu.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageviewController = PageController();
  bool enReached = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!enReached && page >= (slides.length - 1.5)) {
        setState(() {
          enReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageviewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageviewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList()),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () => context.pop(),
              )),
          enReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text('Comenzar'),
                      onPressed: () => context.pop(),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
