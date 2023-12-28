import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/pages/app_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(_createRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Harkirat Singh",
              style: TextStyle(
                  color: kTextColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: kAcornFonts,
                  fontSize: 28),
            ).animate()
      .fadeOut(delay: 1.seconds, curve: Curves.easeOut),
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
            ).animate()
            .fadeOut(delay: 1.2.seconds,curve: Curves.easeOut)
          ],
        ),
      )
    );
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
