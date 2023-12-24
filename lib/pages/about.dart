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
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height / 3),
          child: Column(
            children: [
              Center(
                child: Text(
                  "I'm Harkirat.",
                  style: headlineStyle,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(200.0),
                        topRight: Radius.circular(200.0),
                      ),
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          height: 384,
                          width: 384,
                          
                          
         // Adjust the height as needed
        fit: BoxFit.cover,
                          image: "assets/images/banner.gif")),
                  FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: "assets/images/banner.gif"),
                  // Text("I am Developer living in the land of Kangaroos.",
                  // softWrap: true
                  // , style: headlineStyle2,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
