import 'package:flutter/material.dart';
import 'package:portfolio/contants/colors.dart';
import 'package:portfolio/contants/fonts.dart';
import 'package:portfolio/pages/home.dart';

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
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Harkirat Singh", style: TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.bold,
            fontFamily: kAcornFonts,
            fontSize: 28
          ),),
          SizedBox(width: 5,),
          Text("Portfolio", style: TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.w100,
            fontFamily: kAcornFonts,
            fontSize: 28
          ),)
        ],
      )),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      
      return FadeTransition(
        opacity: CurveTween(curve: Curves.linear).animate(animation),
        child: child,
      );
    },
  );
}
