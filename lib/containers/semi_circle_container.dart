import 'package:flutter/material.dart';

class SemiCircleContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final Color bgColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? semiCirclePadding;

  const SemiCircleContainer({
    super.key,
    required this.child,
    required this.height,
    required this.bgColor,
    this.padding,
    this.semiCirclePadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: semiCirclePadding ??
          EdgeInsets.symmetric(
            horizontal: height / 2,
          ), // to keep the content out of the semi-circle
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(
            height / 2), // to create the semi-circle effect
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
