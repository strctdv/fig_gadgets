import 'package:flutter/material.dart';

class VideoOverlay extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry padding;

  const VideoOverlay({
    super.key,
    required this.child,
    this.color,
    this.padding = const EdgeInsets.all(4),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: color ?? Theme.of(context).colorScheme.onSurface.withOpacity(.85),
      child: child,
    );
  }
}
