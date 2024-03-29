import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/img_urls.dart';
import 'package:portfolio/provider/font_provider.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool scaleFinished = false;
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ScrollTransformView(
        children: [
          ScrollTransformItem(
            builder: (double scrollOffset) {
              // Calculate scale based on scroll offset
              double scale = 0 + (scrollOffset / size.height);
              scale = scale.clamp(0.0, 1.0);

              if (scale == 1) {
                scaleFinished = true;
              } else {
                scaleFinished = false;
              }

              return Transform.scale(
                scale: scale,
                child: AnimatedImage(
                  size: size,
                  onScaleFinished: scaleFinished,
                ),
              );
            },
            offsetBuilder: (scrollOffset) {
              final bool startScrollingImage = scrollOffset >= size.height;

              final double onScreenOffset = scrollOffset;

              return Offset(
                  0,
                  !startScrollingImage
                      ? onScreenOffset
                      : onScreenOffset - (scrollOffset - size.height));
            },
          ),
          ScrollTransformItem(
            builder: (double scrollOffset) {
              // Calculate opacity based on scroll offset
              double opacity = 1.0 - (scrollOffset / size.height);
              opacity = opacity.clamp(0.0, 1.0); //
              return Consumer(builder:
                  (BuildContext context, WidgetRef ref, Widget? child) {
                final currentFontGroup = ref.watch(fontProvider);
                return AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration.zero,
                  child: Container(
                    height: size.height - 58,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: (size.height / 3) - 31),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Hi. I'm Harkirat.",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: size.width > 600
                                        ? 96
                                        : (size.width / 600) * 96 * 0.7,
                                    fontFamily: currentFontGroup['headline']),
                            textAlign: TextAlign.center,
                          )
                              .animate()
                              .fadeIn(delay: .5.seconds, duration: .35.seconds)
                              .slide(end: const Offset(0, .2)),
                          Text(
                            "A Developer.",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: size.width > 600
                                        ? 96
                                        : (size.width / 600) * 96 * 0.7,
                                    fontFamily: currentFontGroup['headline']),
                            textAlign: TextAlign.center,
                          )
                              .animate()
                              .fadeIn(delay: .7.seconds, duration: .35.seconds)
                              .slide(end: const Offset(0, .2)),
                          const SizedBox(height: 14),
                          Text(
                            "I am learning & creating better technologies for the greater good of Humanity.",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: size.width > 600
                                        ? 20
                                        : (size.width / 600) * 40 * 0.7,
                                    fontFamily: currentFontGroup['body']),
                            textAlign: TextAlign.center,
                          )
                              .animate()
                              .fadeIn(delay: .9.seconds, duration: .35.seconds)
                              .slide(end: const Offset(0, .2)),
                          const SizedBox(
                            height: 96,
                          ),
                          AnimatedOpacity(
                            opacity: scrollOffset >= 10 ? 0 : 1,
                            duration: const Duration(milliseconds: 500),
                            child: Image.network(
                              scrollGif,
                              height: 30,
                              width: 30,
                            )
                                .animate()
                                .fadeIn(
                                    delay: 1.1.seconds, duration: .35.seconds)
                                .slide(end: const Offset(0, .2)),
                          ),
                        ]
                            .animate()
                            .shimmer(
                                delay: 1.1.seconds, duration: 1800.ms, size: 4)
                            .scaleXY(end: 1.02, duration: 600.ms)
                            .then(delay: 600.ms)
                            .scaleXY(end: 1 / 1.02)),
                  ),
                );
              });
            },
            offsetBuilder: (scrollOffset) =>
                Offset(0, -(size.height - 58) + scrollOffset),
          ),
          ScrollTransformItem(
            builder: ((scrollOffset) => const Footer()),
          )
        ],
      ),
    );
  }
}

class AnimatedImage extends StatelessWidget {
  const AnimatedImage({
    super.key,
    required this.size,
    required this.onScaleFinished,
  });

  final bool onScaleFinished;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height - 58,
      child: Center(
        child: Image.network(
          harkLogo,
          width: 400, // Replace with your actual image path

          fit: BoxFit.cover,
        )
            .animate(target: onScaleFinished ? 1 : 0)
            .shimmer(angle: -1.57, size: 2, duration: 1.seconds),
      ),
    );
  }
}
