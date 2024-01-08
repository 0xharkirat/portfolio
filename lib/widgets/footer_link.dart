// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/colors.dart';
import 'dart:js' as js;
import 'package:portfolio/provider/font_provider.dart';

class FooterLink extends ConsumerStatefulWidget {
  const FooterLink({super.key, required this.linkText, required this.url});
  final String linkText;
  final String url;

  @override
  ConsumerState<FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends ConsumerState<FooterLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final currentFontGroup = ref.watch(fontProvider);
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
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: isHovered
                  ? const Color.fromARGB(255, 179, 179, 179)
                  : kTextColor,
                  fontFamily: currentFontGroup['body']),
        ),
      ),
    );
  }
}
