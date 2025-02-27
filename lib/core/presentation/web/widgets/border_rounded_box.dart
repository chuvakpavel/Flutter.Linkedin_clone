import 'package:flutter/material.dart';

class BorderRoundedBox extends StatelessWidget {
  const BorderRoundedBox({super.key, this.child, this.constraints, this.padding, this.margin});
  final Widget? child;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      margin: margin,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      constraints: constraints,
      child: child,
    );
  }
}
