// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/provider/font_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:js' as js;

class SmallerContainer extends ConsumerStatefulWidget {
  const SmallerContainer(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imgPath,
      required this.linkUrl});

  final String title;
  final String subtitle;
  final String imgPath;
  final String? linkUrl;

  @override
  ConsumerState<SmallerContainer> createState() => _SmallerContainerState();
}

class _SmallerContainerState extends ConsumerState<SmallerContainer> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final currentFontGroup = ref.watch(fontProvider);
    return InkWell(
      mouseCursor: widget.linkUrl == null
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      onTap: widget.linkUrl == null
          ? null
          : () {
              js.context.callMethod('open', [widget.linkUrl]);
            },
      child: MouseRegion(
          onEnter: (event) {
            setState(() {
              isHover = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHover = false;
            });
          },
          child: AnimatedScale(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
            scale: isHover ? 1.01 : 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.all(40),
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white38),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontFamily: currentFontGroup['body']),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          widget.subtitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontFamily: currentFontGroup['body'],
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutCubic,
                      scale: isHover ? 1.1 : 1,
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
                            image: widget.imgPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
