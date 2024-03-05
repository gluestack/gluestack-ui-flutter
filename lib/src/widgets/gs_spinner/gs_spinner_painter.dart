import 'dart:math' as math;
import 'package:flutter/widgets.dart';

class SpinnerPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;
  final double arcLength;

  SpinnerPainter(
      {required this.progress,
      required this.color,
      required this.strokeWidth,
      required this.arcLength});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - strokeWidth / 2;
    final startAngle = 2 * math.pi * progress - math.pi / 2;
    final sweepAngle = arcLength;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
