import 'package:flutter/material.dart';
import 'package:portfolio/widgets/navigation_bar.dart';

class RouteView extends StatelessWidget {
  const RouteView({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.gif"), fit: BoxFit.cover),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            child,
            const Positioned(
              top: 30,
              child: NavigationBarWeb(),),
            
          ],
        ),
      ),
    );
  }
}
