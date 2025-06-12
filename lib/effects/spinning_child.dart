import 'package:flutter/material.dart';

class SpinningChild extends StatefulWidget {
  final Widget child;
  final Duration rotationSpeed;

  const SpinningChild({
    super.key,
    required this.child,
    this.rotationSpeed = const Duration(seconds: 2),
  });

  @override
  SpinningChildState createState() => SpinningChildState();
}

class SpinningChildState extends State<SpinningChild>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.rotationSpeed,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }
}
