// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:js' as js;

class LargerContainer extends StatelessWidget {
  const LargerContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imgPath, required this.linkUrl,
  });
  final String title;
  final String subtitle;
  final String imgPath;
  final String? linkUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        js.context.callMethod('open', [linkUrl]);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
        height: size.width > 600 ? 500 : 400,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white38,
          ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              subtitle,
              style: descriptionTextStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                height: size.width > 600 ? 150 : 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.white30,
                    ),
                    left: BorderSide(
                      color: Colors.white30,
                    ),
                    right: BorderSide(
                      color: Colors.white30,
                    ),
                  ),
                ),
                child: ClipRRect(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imgPath,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
