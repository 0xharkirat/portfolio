import 'package:flutter/material.dart';
import 'package:portfolio/widgets/navigation_bar.dart';

class RouteView extends StatelessWidget {
  const RouteView({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(29),
        child: Stack(
          alignment: Alignment.centerLeft,
          
          clipBehavior: Clip.none,
          children: [
            child,
            const Positioned(
              left: 0,
              child: NavigationBarWeb(),),
            
          ],
        ),
      ),
    );
  }
}
