import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/staggered_grid_layout.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

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
              Center(
                child: Text(
                  "Projects.",
                  style: headlineStyle.copyWith(
                      fontSize:
                          size.width > 600 ? 96 : (size.width / 600) * 96 * 0.7),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(delay: .5.seconds, duration: .35.seconds)
                    .moveY(),
              ),
              const SizedBox(height: 16),
      
              SizedBox(
                width: size.width / 2,
                child: Text(
                  "A collection of apps, websites, packages and tools that I've created to be helpful, fun & sometimes just to show off.",
                  style: subTitleStyle.copyWith(
                      fontSize:
                          size.width > 600 ? 20 : (size.width / 600) * 40 * 0.7),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(delay: .7.seconds, duration: .35.seconds)
                    .moveY(),
              ),
              const SizedBox(height: 96),
              // Staggered Grid Layout
              const StaggeredGridLayout(),
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
