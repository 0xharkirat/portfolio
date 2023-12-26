// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/constants/urls.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:js' as js;

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
            const SizedBox(height: 72),
            InkWell(
              onTap: () {
                js.context.callMethod('open', [aboutUrl]);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                height: size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white30, width: 2),
                  color: Colors.black54,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    
                    border: Border(
                        top: BorderSide(color: Colors.white30, width: 2),
                        left: BorderSide(color: Colors.white30, width: 2),
                        right: BorderSide(
                          color: Colors.white30,
                          width: 2,
                        )),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: "assets/images/about.png",
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
