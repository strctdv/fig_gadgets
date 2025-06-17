import 'dart:math' as math;
import 'package:flutter/material.dart';

class ZRotator extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool reverse;

  const ZRotator({
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.reverse = true,
    super.key,
  });

  @override
  ZRotatorState createState() => ZRotatorState();
}

class ZRotatorState extends State<ZRotator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: widget.reverse);
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
        final angle = _controller.value * math.pi; // 0..pi
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // perspective distortion
            ..rotateY(angle),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
