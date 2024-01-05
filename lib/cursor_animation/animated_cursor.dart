import 'package:flutter/material.dart';

class AnimatedPointer extends StatelessWidget {
  const AnimatedPointer({super.key, this.movementDuration = const Duration(milliseconds: 700),
    this.radius = 30, required this.pointerOffset,});

  final Duration movementDuration;
  final Offset pointerOffset;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: movementDuration,
      curve: Curves.easeOutExpo,
      top: pointerOffset.dy,
      left: pointerOffset.dx,
      child: CustomPaint(
        painter: Pointer(radius: radius)
      ),

    );
  }
}


class Pointer extends CustomPainter{

  final double radius;

  Pointer({super.repaint, required this.radius});
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      const Offset(0, 0),
      radius,
      Paint()
      ..color = Colors.white
      ..blendMode = BlendMode.difference
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;

  }

}
