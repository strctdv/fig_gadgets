import 'dart:math' as math;
import 'package:flutter/material.dart';

class SinWavePainter extends CustomPainter {
  final double frequency;
  final double lineWidth;
  final Color color;
  final PaintingStyle style;
  final double phase;

  const SinWavePainter({
    this.frequency = 7.5,
    this.lineWidth = 2.0,
    this.color = Colors.blue,
    this.style = PaintingStyle.stroke,
    this.phase = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = lineWidth
      ..style = style;

    final path = Path();
    final halfLineWidth = lineWidth / 2;
    final amplitude = (size.height - (lineWidth)) / 2;
    for (double x = 0; x < size.width; x++) {
      final y = amplitude +
          math.sin((x / frequency) + phase) * amplitude +
          halfLineWidth;
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant SinWavePainter oldDelegate) {
    return frequency != oldDelegate.frequency ||
        lineWidth != oldDelegate.lineWidth ||
        color != oldDelegate.color ||
        phase != oldDelegate.phase;
  }
}
