// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:js' as js;

class LargerContainer extends StatefulWidget {
  const LargerContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imgPath,
    required this.linkUrl,
  });
  final String title;
  final String subtitle;
  final String imgPath;
  final String? linkUrl;

  @override
  State<LargerContainer> createState() => _LargerContainerState();
}

class _LargerContainerState extends State<LargerContainer> {
  bool isHover = false;

  Offset imageMousePos = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        js.context.callMethod('open', [widget.linkUrl]);
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isHover = true;
          });
        },
        onHover: (event) {
          setState(() {
            imageMousePos += event.delta;
            imageMousePos += const Offset(0.012, 0.012);
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
            imageMousePos = const Offset(0,0);
          });
        },
        child: AnimatedScale(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
          scale: isHover ? 1.01 : 1,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
            height: size.width > 600 ? 500 : 400,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white38,
              ),
              color: isHover
                  ? const Color.fromARGB(255, 24, 24, 24)
                  : Colors.black54,
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
                  widget.title,
                  style: titleTextStyle,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  widget.subtitle,
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
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 500),
                        scale: isHover? 1.5:1,
                        curve: Curves.easeOutCubic,
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: widget.imgPath,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ).animate(target: isHover ? 0.05 : 0).move(
                            end: imageMousePos,
                            duration: 1.seconds,
                            curve: Curves.easeOutCubic),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
