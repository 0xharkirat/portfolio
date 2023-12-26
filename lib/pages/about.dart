import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
            Center(
              child: Text(
                "Harkirat Singh.",
                style: headlineStyle,
              ),
            ),
            const SizedBox(
              height: 72,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black54,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.3), // Shadow color
                //     spreadRadius: 2, // How far the shadow should spread
                //     blurRadius: 5, // How blurry the shadow should be
                //     offset: const Offset(0, 2), // Offset of the shadow
                //   ),
                // ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Common Human Uncommon Life.",
                        style: headlineStyle2,
                      ),
                      const SizedBox(height: 24,),
                      Text("Hi, I'm Harkirat.", style: bodyTextStyle,),
                      SizedBox(height: 24,),
                      Text('''I am learning & creating better technologies for the GREATER GOOD of Humanity.
                      I am final year student of Bachelor in Computer Science. Computers are my great friends & worst enemies. \n They give me the immense power to create anything, but also to break the existing.\n
                      My understanding of the world, family & life’s circumstances has made me a very adaptable sapien.''', style: bodyTextStyle, softWrap: true,),
                      
                      
                    ],
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(200.0),
                      topRight: Radius.circular(200.0),
                    ),
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        height: 368,
                        fit: BoxFit.cover,
                        image: "assets/images/hark-portrait.jpg"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
