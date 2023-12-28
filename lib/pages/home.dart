import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isMouseOverImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _heroSection(),
    );
  }

  Widget _heroSection() {
    final size = MediaQuery.of(context).size;
    return RawScrollbar(
       thumbColor: Colors.white54,
        radius: const Radius.circular(20),
        thickness: 5,
        padding: const EdgeInsets.only(right: 4),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: size.height / 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                AnimatedOpacity(
                  opacity: isMouseOverImage ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hi. I'm Harkirat.",
                            style: headlineStyle.copyWith(
                                fontSize: size.width > 600
                                    ? 96
                                    : (size.width / 600) * 96 * 0.7),
                            textAlign: TextAlign.center,
                          )
                              .animate()
                              .fadeIn(delay: .5.seconds, duration: .35.seconds)
                              .slide(end: const Offset(0, .2)),
                          Text(
                            "A Developer.",
                            style: headlineStyle.copyWith(
                                fontSize: size.width > 600
                                    ? 96
                                    : (size.width / 600) * 96 * 0.7),
                            textAlign: TextAlign.center,
                          )
                              .animate()
                              .fadeIn(delay: .7.seconds, duration: .35.seconds)
                              .slide(end: const Offset(0, .2)),
                          const SizedBox(height: 14),
                          Text(
                            "I am learning & creating better technologies for the greater good of Humanity.",
                            style: subTitleStyle.copyWith(
                                fontSize: size.width > 600
                                    ? 20
                                    : (size.width / 600) * 40 * 0.7),
                            textAlign: TextAlign.center,
                          )
                              .animate()
                              .fadeIn(delay: .9.seconds, duration: .35.seconds)
                              .slide(end: const Offset(0, .2)),
                        ]
                            .animate()
                            .shimmer(delay: 2.seconds, duration: 1800.ms, size: 4)
                            
                            .scaleXY(end: 1.02, duration: 600.ms)
                            .then(delay: 600.ms)
                            .scaleXY(end: 1 / 1.02)),
                  ),
                ),
                size.width > 1024
                    ? MouseRegion(
                        cursor: SystemMouseCursors.grabbing,
                        onEnter: (_) {
                          setState(() {
                            isMouseOverImage = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            isMouseOverImage = false;
                          });
                        },
                        child: AnimatedImage(
                          isMouseOverImage: isMouseOverImage,
                          size: size,
                        ),
                      )
                    : GestureDetector(
                        onScaleUpdate: (ScaleUpdateDetails details) {
                          double scaleFactor = details.scale;
                          setState(() {
                            isMouseOverImage = scaleFactor > 1.0;
                          });
                        },
                        child: AnimatedImage(
                          isMouseOverImage: isMouseOverImage,
                          size: size,
                        ),
                      ),
              ],
            ),
           const SizedBox(
            height: 96,
           ),
           const Footer(),
          ],
        ),
      ),
    );
  }
}

class AnimatedImage extends StatelessWidget {
  const AnimatedImage({
    super.key,
    required this.isMouseOverImage,
    required this.size,
  });

  final bool isMouseOverImage;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: isMouseOverImage ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: Image.asset(
          'assets/images/hark-logo.png', // Replace with your actual image path
          width: size.width > 600 ? 400 : (size.width / 400) * 0.4,
          height: size.width > 600 ? 400 : (size.height / 400) * 0.4,
          fit: BoxFit.cover,
        )
            .animate(target: isMouseOverImage ? 1 : 0)
            .scaleXY(begin: 0, alignment: const Alignment(0, -0.3))
            .then()
            .shimmer(angle: -1.57, size: 2, duration: 1.seconds));
  }
}
