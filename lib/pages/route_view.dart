import 'package:flutter/material.dart';
import 'package:portfolio/cursor_animation/animated_cursor.dart';
import 'package:portfolio/widgets/navigation_bar.dart';

class RouteView extends StatefulWidget {
  const RouteView({super.key, required this.child});
  final Widget child;

  @override
  State<RouteView> createState() => _RouteViewState();
}

class _RouteViewState extends State<RouteView>
    with SingleTickerProviderStateMixin {
  late Offset? pointerOffset;

  late AnimationController pointerSizeController;

  late Animation<double> pointerAnimation;

  @override
  void initState() {
    pointerOffset = const Offset(0, 0);
    pointerSizeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    pointerAnimation = CurvedAnimation(
        curve: Curves.easeInOutCubic,
        parent: Tween<double>(begin: 0, end: 1).animate(pointerSizeController));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(31),
        child: MouseRegion(
          opaque: false,
          cursor: SystemMouseCursors.none,
          onHover: (event) {
            setState(() {
              pointerOffset = event.localPosition;
            });
          },
          onExit: (event) {
            setState(() {
              pointerOffset = null;
            });
          },
          child: Stack(
            alignment: Alignment.centerLeft,
            clipBehavior: Clip.none,
            children: [
              widget.child,
              const Positioned(
                left: 0,
                child: NavigationBarWeb(),
              ),
              if (pointerOffset != null) ...[
                AnimatedBuilder(
                  animation: pointerSizeController,
                  builder: (context, child) {
                    return AnimatedPointer(
                      pointerOffset: pointerOffset!,
                      radius: 45 + 100 * pointerAnimation.value,
                    );
                  },
                ),
                AnimatedPointer(
                  pointerOffset: pointerOffset!,
                  movementDuration: const Duration(milliseconds: 200),
                  radius: 10,
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}
