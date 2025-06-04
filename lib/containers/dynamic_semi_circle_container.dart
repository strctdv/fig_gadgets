import 'package:fig_gadgets/containers/semi_circle_container.dart';
import 'package:flutter/material.dart';

class DynamicSemiCircleContainer extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;

  const DynamicSemiCircleContainer({
    super.key,
    required this.child,
    this.bgColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBgColor =
        bgColor ?? Theme.of(context).colorScheme.surfaceContainerLowest;
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        return SemiCircleContainer(
          height: height,
          bgColor: effectiveBgColor,
          padding: padding,
          child: child,
        );
      },
    );
  }
}
