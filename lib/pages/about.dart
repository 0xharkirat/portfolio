// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/constants/urls.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:js' as js;

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: RawScrollbar(
        thumbColor: Colors.white54,
        radius: const Radius.circular(20),
        thickness: 5,
        padding: const EdgeInsets.only(right: 4),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: size.height / 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Harkirat Singh.",
                style: headlineStyle.copyWith(
                    fontSize:
                        size.width > 600 ? 96 : (size.width / 600) * 96 * 0.7),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(delay: .5.seconds, duration: .35.seconds)
                  .moveY(),
              const SizedBox(height: 72),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                padding: const EdgeInsets.fromLTRB(80, 80, 80, 0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white30,
                  ),
                  color: Colors.black54,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "I am a developer learning & creating better technologies, & working from Sydney, Australia.",
                      style: headlineStyle.copyWith(
                          fontSize: size.width > 600
                              ? 48
                              : (size.width / 600) * 48 * 0.7,
                          color: Colors.white60),
                    )
                        .animate()
                        .fadeIn(delay: .7.seconds, duration: .35.seconds)
                        .moveY(),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Computers are my childhood's best friends.\n\nWhen I was young, my dad and I shared the same passion for computers. We were both always excited about new processors and the evolving Windows operating systems—from 98 to XP, Vista to 7. He was also my first computer teacher, introducing me to Word, Excel, Paint, PowerPoint, downloading, and other cool stuff.\n\nI still remember the day when he first showed me Excel and its incredible formula function feature; it just blew my mind. Spending time with Dad and learning about computers from him was one of the best experiences of my life. It marked the earliest form of collaboration in my life, and I learned so much more effectively.\n\nRead more about me in this blog post 👇.",
                      style: bodyTextStyle.copyWith(
                        color: const Color.fromARGB(230, 255, 255, 255),
                        height: 1.5,
                        fontSize: size.width > 600
                            ? 20
                            : (size.width / 600) * 20 * 0.7,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: .9.seconds, duration: .35.seconds)
                        .moveY(),
                    const SizedBox(
                      height: 48,
                    ),
                    InkWell(
                      onTap: () {
                        js.context.callMethod('open', [aboutUrl]);
                      },
                      child: Container(
                        height: size.width > 600 ? 460 : 100,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.white30,
                            ),
                            left: BorderSide(
                              color: Colors.white30,
                            ),
                            right: BorderSide(
                              color: Colors.white30,
                            ),
                          ),
                        ),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: "assets/images/about.png",
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 1.1.seconds, duration: .35.seconds)
                        .moveY()
                  ],
                ),
              )
                  .animate()
                  .fadeIn(delay: 0.7.seconds, duration: .35.seconds)
                  .moveY(),
            ],
          ),
        ),
      ),
    );
  }
}
