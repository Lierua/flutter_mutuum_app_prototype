import 'dart:math';
import 'package:flutter/material.dart';

class CircleProgressPainter extends CustomPainter {
  final double progress; // 0.0 → 1.0
  final Color color;
  final double strokeWidth;

  CircleProgressPainter({
    required this.progress,
    required this.color,
    this.strokeWidth = 10,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth / 2;

    final backgroundPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // progress arc
    final sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // start at top
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
