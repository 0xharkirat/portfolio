// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/constants/imgUrls.dart';
import 'package:portfolio/constants/urls.dart';
import 'package:portfolio/widgets/footer.dart';
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
          padding: EdgeInsets.only(bottom: 31, top: (size.height / 5) - 31 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 116,),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                    ),
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
                    const SizedBox(height: 96),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkWell(
                                onTap: () {
                                  js.context.callMethod('open', [aboutUrl]);
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(200),
                                      topRight: Radius.circular(200)),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: harkStand,
                                    height: 400,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                              )
                                  .animate()
                                  .fadeIn(delay: 1.1.seconds, duration: .35.seconds)
                                  .moveY(),
                              InkWell(
                                onTap: () {
                                  js.context.callMethod('open', ["https://youtu.be/l0Jzm5sHb6U?si=5YEwpAce2VSvWF1J"]);
                                },
                                child: Container(
                                  color: Colors.black54,
                                  height: 100,
                                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                  child: Center(
                                    child: Text("\"Men are here. We Make Fire. Cook Meat.\"", style: bodyTextStyle.copyWith(
                                      fontSize: 24
                                    ),
                                    textAlign: TextAlign.center,),
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
                                "Computers are my childhood's best friends.\n\nWhen I was young, my dad and I shared the same passion for computers. We were both always excited about new processors and the evolving Windows operating systems—from 98 to XP, Vista to 7. He was also my first computer teacher, introducing me to Word, Excel, Paint, PowerPoint, downloading, and other cool stuff.\n\nI still remember the day when he first showed me Excel and its incredible formula function feature; it just blew my mind. Spending time with Dad and learning about computers from him was one of the best experiences of my life. It marked the earliest form of collaboration in my life, and I learned so much more effectively.",
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
                                height: 16,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white)),
                                child: InkWell(
                                  onTap: (){
                                    js.context.callMethod('open', [aboutUrl]);
                                  },
                                  child: Text(
                                    "My Brief life Story ↗",
                                    style: bodyTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ).animate()
                                  .fadeIn(delay: 1.1.seconds, duration: .35.seconds)
                                  .moveY(),
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
              const SizedBox(
                height: 96,
              ),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}
