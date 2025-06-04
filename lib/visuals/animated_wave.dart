import 'dart:math' as math;

import 'package:fig_gadgets/visuals/sin_wave_painter.dart';
import 'package:flutter/material.dart';

class AnimatedWave extends StatefulWidget {
  final double wavesPerSecond;
  final double height;
  final double width;
  final double frequency;
  final double lineWidth;
  final Color color;

  const AnimatedWave({
    super.key,
    this.wavesPerSecond = 2.0,
    this.height = 24.0,
    this.width = double.infinity,
    this.frequency = 7.5,
    this.lineWidth = 2.0,
    this.color = Colors.blue,
  });

  @override
  State<AnimatedWave> createState() => _AnimatedWaveState();
}

class _AnimatedWaveState extends State<AnimatedWave>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.width, widget.height),
          painter: SinWavePainter(
            frequency: widget.frequency,
            lineWidth: widget.lineWidth,
            color: widget.color,
            phase: _controller.value *
                widget.wavesPerSecond *
                2 *
                math.pi, // Because pahse is 2 * pi radians for a full wave cycle
          ),
        );
      },
    );
  }
}
