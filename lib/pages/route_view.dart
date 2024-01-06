import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/widgets/navigation_bar.dart';
import 'dart:js' as js;
import 'dart:math' as math;

class RouteView extends StatefulWidget {
  const RouteView({super.key, required this.child});
  final Widget child;

  @override
  State<RouteView> createState() => _RouteViewState();
}

class _RouteViewState extends State<RouteView> {
  bool isMono = false;

  get fillColor {
    return isMono
        ? MaterialStateProperty.all<Color?>(kTextColor)
        : MaterialStateProperty.all<Color?>(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(31),
        child: Stack(
          alignment: Alignment.centerLeft,
          clipBehavior: Clip.none,
          children: [
            widget.child,
            const Positioned(
              left: 0,
              child: NavigationBarWeb(),
            ),
            Positioned(
                left: 1, // Adjust the left position as needed
                bottom: -10,
                child: Transform.rotate(
                  angle: -90 * 3.1415927 / 180,
                  alignment: Alignment.topLeft,
                  
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    
                    
                    onTap: () {
                        setState(() {
                          if (!isMono) {
                      js.context.callMethod('alertMessage', ["mono"]);
                    } else {
                      js.context.callMethod('alertMessage', ["notMono"]);
                    }

                          isMono = !isMono;
                        });
                      },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width:
                                10, // Adjust the size of the checkbox as needed
                            height:
                                10, // Adjust the size of the checkbox as needed
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color:
                                  isMono ? Colors.white : Colors.transparent,
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Monospaced",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
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
