import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';

class SavingsBarGraph extends StatelessWidget {
  final List<double> monthlySavings;
  final double goalAmount; // NEW

  const SavingsBarGraph({
    super.key,
    required this.monthlySavings,
    required this.goalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: CustomPaint(
        painter: _SavingsBarPainter(monthlySavings, goalAmount),
      ),
    );
  }
}

/* =====================================================
   Painter
   ===================================================== */
class _SavingsBarPainter extends CustomPainter {
  final List<double> data;
  final double goal;

  _SavingsBarPainter(this.data, this.goal);

  @override
  void paint(Canvas canvas, Size size) {
    const padding = 10.0;

    final width = size.width - padding * 2;
    final height = size.height - padding * 2;

    final origin = Offset(padding, size.height - padding);

    final barWidth = width / (data.length * 1.5);
    final gap = barWidth / 2;

    // Scale based on GOAL (not max value)
    final scaleY = height / goal;

    /* ---------------- Axis ---------------- */

    final axisPaint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 2;

    // X axis
    canvas.drawLine(origin, Offset(origin.dx + width, origin.dy), axisPaint);

    // Y axis
    canvas.drawLine(origin, Offset(origin.dx, origin.dy - height), axisPaint);

    /* ---------------- Goal line ---------------- */

    final targetY = origin.dy - (height * 0.9);

    final targetPaint = Paint()
      ..color = AppColors.contrastColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Dashed line effect
    const dashWidth = 6.0;
    const dashSpace = 4.0;

    double startX = origin.dx;

    while (startX < origin.dx + width) {
      canvas.drawLine(
        Offset(startX, targetY),
        Offset(startX + dashWidth, targetY),
        targetPaint,
      );

      startX += dashWidth + dashSpace;
    }
    /* ---------------- Bars ---------------- */

    final barPaint = Paint()
      ..color = AppColors.primeColor
      ..style = PaintingStyle.fill;

    for (int i = 0; i < data.length; i++) {
      final value = data[i];

      // Cap at goal (avoid overflow)
      final cappedValue = value > goal ? goal : value;

      final barHeight = cappedValue * scaleY;

      final x = origin.dx + gap + i * (barWidth + gap);
      final y = origin.dy - barHeight;

      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, barWidth, barHeight),
        const Radius.circular(2),
      );

      canvas.drawRRect(rect, barPaint);

      // Month label
      _drawText(canvas, "${i + 1}", Offset(x + barWidth / 3, origin.dy + 6));
    }
  }

  /* ---------------- Helper ---------------- */

  void _drawText(Canvas canvas, String text, Offset offset) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 14, color: Colors.black54),
      ),
      textDirection: TextDirection.ltr,
    );

    tp.layout();
    tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
