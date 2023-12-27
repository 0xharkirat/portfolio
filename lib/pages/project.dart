import 'package:flutter/material.dart';

import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/widgets/staggered_grid_layout.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: size.height / 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Big Title
               Center(
                child: Text(
                  "Projects.",
                  style: headlineStyle,
                ),
              ),
              const SizedBox(height: 16),
              // Subtitle
               Container(
                width: size.width/2,
                child: Expanded(
                  child: Text(
                    "A collection of apps, websites, packages and tools that I've created to be helpful, fun & sometimes just to show off.",
                    style: subTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 96),
              // Staggered Grid Layout
              const StaggeredGridLayout(),
            ],
          ),
        ),
      );
    
  }
}


