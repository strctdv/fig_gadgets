import 'package:flutter/material.dart';

class Blinker extends StatefulWidget {
  final bool flag;
  final Widget child;
  final Duration duration;
  final double begin;
  final double end;

  const Blinker({
    required this.child,
    required this.flag,
    this.duration = const Duration(milliseconds: 500),
    this.begin = .33,
    this.end = 1,
    super.key,
  });

  @override
  State<Blinker> createState() => _BlinkerState();
}

class _BlinkerState extends State<Blinker> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _opacityAnimation =
        Tween<double>(begin: widget.begin, end: widget.end).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(covariant Blinker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.flag != oldWidget.flag) {
      if (widget.flag) {
        _controller.repeat(reverse: true);
      } else {
        _controller.stop();
      }
    }

    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
      if (widget.flag) {
        _controller.repeat(reverse: true);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.flag
        ? FadeTransition(
            opacity: _opacityAnimation,
            child: widget.child,
          )
        : widget.child;
  }
}
