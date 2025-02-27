import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClickableRegion extends StatelessWidget {

  const ClickableRegion({super.key, required this.child, this.onEnter, this.onExit});

  final Widget child;
  final Function(PointerEnterEvent)? onEnter;
  final Function(PointerExitEvent)? onExit;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: onEnter,
      onExit: onExit,
      child: child,
    );
  }
}
