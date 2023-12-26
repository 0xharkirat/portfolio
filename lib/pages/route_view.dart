import 'package:flutter/material.dart';
import 'package:portfolio/widgets/navigation_bar.dart';

class RouteView extends StatelessWidget {
  const RouteView({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          child,
          const Positioned(
            top: 30,
            child: NavigationBarWeb(),),
          
        ],
      ),
    );
  }
}
