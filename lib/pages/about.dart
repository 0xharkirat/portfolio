// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/colors.dart';

import 'package:portfolio/constants/img_urls.dart';
import 'package:portfolio/constants/urls.dart';
import 'package:portfolio/provider/font_provider.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:js' as js;

class AboutPage extends ConsumerStatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends ConsumerState<AboutPage> {
  bool isImageHover = false;
  Offset imageMousePos = const Offset(0, 0);

  bool isCaptionHover = false;

  bool isButtonHover = false;
  Offset buttonMousePos = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentFontGroup = ref.watch(fontProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: RawScrollbar(
        thumbColor: Colors.white54,
        radius: const Radius.circular(20),
        thickness: 5,
        padding: const EdgeInsets.only(right: 4),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 31, top: (size.height / 5) - 31),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 116,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    Text(
                      "Harkirat Singh.",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: size.width > 600
                              ? 96
                              : (size.width / 600) * 96 * 0.7,
                              fontFamily: currentFontGroup['headline']),
                      textAlign: TextAlign.center,
                    )
                        .animate()
                        .fadeIn(delay: .5.seconds, duration: .35.seconds)
                        .moveY(),
                    const SizedBox(height: 96),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MouseRegion(
                                  onEnter: (event) {
                                    setState(() {
                                      isImageHover = true;
                                    });
                                  },
                                  onHover: (event) {
                                    setState(() {
                                      imageMousePos += event.delta;
                                      imageMousePos += const Offset(0.12, 0.12);
                                    });
                                  },
                                  onExit: (event) {
                                    setState(() {
                                      isImageHover = false;
                                      imageMousePos = const Offset(0, 0);
                                    });
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      js.context.callMethod('open', [aboutUrl]);
                                    },
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(200),
                                            topRight: Radius.circular(200)),
                                        child: AnimatedScale(
                                          scale: isImageHover ? 1.5 : 1,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeOutCubic,
                                          child: FadeInImage.memoryNetwork(
                                            placeholder: kTransparentImage,
                                            image: harkStand,
                                            height: 400,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topCenter,
                                          ),
                                        )
                                            .animate(
                                                target: isImageHover ? 0.1 : 0)
                                            .move(
                                                end: imageMousePos,
                                                duration: 1.seconds,
                                                curve: Curves.easeOutCubic)),
                                  )),
                              MouseRegion(
                                onEnter: (event) {
                                  setState(() {
                                    isCaptionHover = true;
                                  });
                                },
                                onHover: (event) {},
                                onExit: (event) {
                                  setState(() {
                                    isCaptionHover = false;
                                  });
                                },
                                child: InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', [
                                      "https://youtu.be/l0Jzm5sHb6U?si=5YEwpAce2VSvWF1J"
                                    ]);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeOutCubic,
                                    color: isCaptionHover
                                        ? const Color.fromARGB(255, 40, 40, 40)
                                        : const Color.fromARGB(255, 18, 18, 18),
                                    height: 100,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10),
                                    child: Center(
                                      child: Text(
                                        "\"Men are here. We Make Fire. Cook Meat.\"",
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            fontSize: 24,
                                            decoration: isCaptionHover
                                                ? TextDecoration.underline
                                                : TextDecoration.none,
                                                fontFamily: currentFontGroup['body']),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 96,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "I am a Developer learning & creating better technologies, working from Sydney, Australia.",
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: size.width > 600
                                        ? 48
                                        : (size.width / 600) * 48 * 0.7,
                                    color: Colors.white60,
                                    fontFamily: currentFontGroup['headline']),
                              )
                                  .animate()
                                  .fadeIn(
                                      delay: .7.seconds, duration: .35.seconds)
                                  .moveY(),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Computers are my childhood's best friends.\n\nWhen I was young, my dad and I shared the same passion for computers. We were both always excited about new processors and the evolving Windows operating systems—from 98 to XP, Vista to 7. He was also my first computer teacher, introducing me to Word, Excel, Paint, PowerPoint, downloading, and other cool stuff.\n\nI still remember the day when he first showed me Excel and its incredible formula function feature; it just blew my mind. Spending time with Dad and learning about computers from him was one of the best experiences of my life. It marked the earliest form of collaboration in my life, and I learned so much more effectively.",
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color:
                                      const Color.fromARGB(230, 255, 255, 255),
                                  height: 1.5,
                                  fontSize: size.width > 600
                                      ? 20
                                      : (size.width / 600) * 20 * 0.7,
                                      fontFamily: currentFontGroup['body'],
                                ),
                              )
                                  .animate()
                                  .fadeIn(
                                      delay: .9.seconds, duration: .35.seconds)
                                  .moveY(),
                              const SizedBox(
                                height: 16,
                              ),
                              MouseRegion(
                                onEnter: (event) {
                                  setState(() {
                                    isButtonHover = true;
                                  });
                                },
                                onHover: (event) {
                                  setState(() {
                                    buttonMousePos += event.delta;
                                    buttonMousePos += const Offset(0.12, 0.12);
                                  });
                                },
                                onExit: (event) {
                                  setState(() {
                                    isButtonHover = false;
                                    buttonMousePos = const Offset(0, 0);
                                  });
                                },
                                child: InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', [aboutUrl]);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeOutCubic,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    padding:
                                        EdgeInsets.all(isButtonHover ? 30 : 15),
                                    decoration: BoxDecoration(
                                        color: isButtonHover
                                            ? kTextColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: isButtonHover
                                                ? kNewBackgroundcolor
                                                : kTextColor)),
                                    child: Text(
                                      "My Brief life Story ↗",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          fontSize: 16,
                                          color: isButtonHover
                                              ? kNewBackgroundcolor
                                              : kTextColor,
                                              fontFamily: currentFontGroup['body']),
                                    )
                                        .animate(
                                            target: isButtonHover ? 0.1 : 0)
                                        .move(
                                          end: buttonMousePos,
                                        ),
                                  ),
                                )
                                    .animate()
                                    .fadeIn(
                                        delay: 1.1.seconds,
                                        duration: .35.seconds)
                                    .moveY(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                        .animate()
                        .fadeIn(delay: 0.7.seconds, duration: .35.seconds)
                        .moveY(),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                height: isButtonHover ? 96 - 30 : 96,
              ),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}
