import 'package:flutter/material.dart';

class TextWithStrokeAndShadow extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? textColor;
  final Color strokeColor;
  final double strokeWidth;
  final Color shadowColor;
  final Offset shadowOffset;
  final double shadowBlur;

  const TextWithStrokeAndShadow({
    super.key,
    required this.text,
    this.fontSize,
    this.textColor,
    this.strokeColor = Colors.black,
    this.strokeWidth = 4.0,
    this.shadowColor = Colors.black54,
    this.shadowOffset = const Offset(2, 2),
    this.shadowBlur = 4.0,
  }) : assert(strokeWidth >= 0, 'Stroke width must be non-negative');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Stroke + Shadow réteg
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
            shadows: [
              Shadow(
                color: shadowColor,
                offset: shadowOffset,
                blurRadius: shadowBlur,
              ),
            ],
          ),
        ),
        // Töltött szöveg réteg
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            shadows: [
              Shadow(
                color: shadowColor,
                offset: shadowOffset,
                blurRadius: shadowBlur,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
