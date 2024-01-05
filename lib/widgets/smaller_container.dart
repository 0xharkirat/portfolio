// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:js' as js;

class SmallerContainer extends StatelessWidget {
  const SmallerContainer(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imgPath, required this.linkUrl});

  final String title;
  final String subtitle;
  final String imgPath;
  final String? linkUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: linkUrl == null? SystemMouseCursors.forbidden: SystemMouseCursors.click,
      onTap: linkUrl == null? null:() {
        js.context.callMethod(
            'open', [linkUrl]);
      },
      child: Container(
          padding: const EdgeInsets.all(40),
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white38),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
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
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(
                      color: Colors.white38, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imgPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
