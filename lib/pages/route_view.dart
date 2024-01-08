// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/provider/font_provider.dart';

import 'package:portfolio/widgets/navigation_bar.dart';
import 'dart:js' as js;

class RouteView extends ConsumerStatefulWidget {
  const RouteView({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<RouteView> createState() => _RouteViewState();
}

class _RouteViewState extends ConsumerState<RouteView> {
  bool isMono = false;

  get fillColor {
    return isMono
        ? MaterialStateProperty.all<Color?>(kTextColor)
        : MaterialStateProperty.all<Color?>(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    final fontController = ref.read(fontProvider.notifier);
    final currentFontGroup = ref.watch(fontProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(31),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            widget.child,
            const Positioned(
              top: 0,
              child: NavigationBarWeb(),
            ),
            Positioned(
                left: 2, // Adjust the left position as needed
                top: 1,
                child: Container(
                  color: kNewBackgroundcolor,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        isMono = !isMono;
                
                        if (isMono) {
                          js.context.callMethod('alertMessage', ["mono"]);
                        } else {
                          js.context.callMethod('alertMessage', ["notMono"]);
                        }
                        fontController.switchFontGroup();
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:
                              10, // Adjust the size of the checkbox as needed
                          height:
                              10, // Adjust the size of the checkbox as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: isMono ? kTextColor : Colors.transparent,
                            border: Border.all(color: kTextColor),
                          ),
                        ),
                       const SizedBox(
                        width: 5,
                       ),
                        
                        Text("MONOSPACED",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 14, fontFamily: currentFontGroup['body'])),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
