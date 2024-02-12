// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/fonts.dart';
import 'dart:js' as js;
import 'package:portfolio/pages/app_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Harkirat Singh",
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: kAcornFonts,
                        fontSize: 28),
                  ).animate().fadeOut(delay: 1.seconds, curve: Curves.easeOut),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Portfolio",
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w100,
                        fontFamily: kAcornFonts,
                        fontSize: 28),
                  )
                      .animate()
                      .fadeOut(delay: 1.2.seconds, curve: Curves.easeOut),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                  splashFactory: NoSplash.splashFactory,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    js.context.callMethod('playAudio', []);
                    Navigator.of(context).pushReplacement(_createRoute());
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: kTextColor)),
                      child: Text(
                        "Enter",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              color: kTextColor,
                            ),
                      ))).animate()
                      .fadeIn(delay: 1.2.seconds, curve: Curves.easeOut)
                      .moveY(begin: 20),
                      
            ],
          ),
        ));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const AppView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.linear).animate(animation),
        child: child,
      );
    },
  );
}
