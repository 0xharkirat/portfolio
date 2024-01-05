// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'dart:js' as js;

import 'package:portfolio/constants/fonts.dart';

class FooterLink extends StatefulWidget {
  const FooterLink({super.key, required this.linkText, required this.url});
  final String linkText;
  final String url;

  @override
  State<FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<FooterLink> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        js.context.callMethod('open', [widget.url]);
      },
      mouseCursor: SystemMouseCursors.click,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHovered = false;
          });
        },
        child: Text(
          widget.linkText,
          style: bodyTextStyle.copyWith(
            color: isHovered? const Color.fromARGB(255, 179, 179, 179): kTextColor
          ),
        ),
      ),
    );
  }
}
