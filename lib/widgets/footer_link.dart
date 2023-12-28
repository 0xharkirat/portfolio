import 'package:flutter/material.dart';
import 'dart:js' as js;

import 'package:portfolio/constants/fonts.dart';

class FooterLink extends StatelessWidget {
  const FooterLink({super.key, required this.linkText, required this.url});
  final String linkText;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        js.context.callMethod('open', [url]);
      },
      mouseCursor: SystemMouseCursors.click,
      child: Text(
        linkText,
        style: bodyTextStyle,
      ),
    );
  }
}
