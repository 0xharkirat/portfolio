import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMouseOverImage = false;
  bool isMouseOverNav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          const SizedBox(
              height:
                  50), // Adjust the height as needed for the space above the navbar
          _navbar(),
          Expanded(
            child: _heroSection(),
          ),
        ],
      ),
    );
  }

  Widget _navbar() {
    return MouseRegion(
      cursor: SystemMouseCursors.grab,
      onEnter: (_) {
        setState(() {
          isMouseOverNav = true;
        });
      },
      onExit: (_) {
        setState(() {
          isMouseOverNav = false;
        });
      },
      child: AnimatedOpacity(
        opacity: isMouseOverNav ? 1 : 0,
        duration: const Duration(milliseconds: 100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white12,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _navItem('Home'),
                _navItem('About'),
                _navItem('Projects'),
                _navItem('Contact'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        
        onPressed: () {
          // Handle navigation or other actions
        },
        child: Text(
          title,
          style: bodyTextStyle, // Adjust text color as needed
        ),
      ),
    );
  }

  Widget _heroSection() {
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
            cursor: SystemMouseCursors.zoomIn,
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
                'assets/images/hark-logo.jpg', // Replace with your actual image path
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
