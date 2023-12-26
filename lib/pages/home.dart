import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';

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

  Center _heroSection() {
    return Center(
    child: Stack(
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
          opacity: isMouseOverImage ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hi. I'm Harkirat.", style: headlineStyle),
              Text("A Developer.", style: headlineStyle),
              const SizedBox(height: 14),
              Text(
                "I am learning & creating better technologies for the greater good of Humanity.",
                style: subTitleStyle,
              ),
            ],
          ),
        ),
        MouseRegion(
          opaque: false,
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
          child: AnimatedOpacity(
            
            opacity: isMouseOverImage ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Image.asset(
              'assets/images/hark-logo.png', // Replace with your actual image path
              width: 400,
              height: 400,
              fit: BoxFit.cover,
              
            ),
          ),
        ),
      ],
    ),
  );
  }
}
