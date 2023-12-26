import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Text('About Page'),
      ),
    );
  }
}
