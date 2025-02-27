import 'package:flutter/material.dart';

class PlatformProvider extends InheritedWidget {
  final bool isMobile;

  const PlatformProvider({
    super.key,
    required this.isMobile,
    required super.child,
  });

  static PlatformProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PlatformProvider>();
  }

  @override
  bool updateShouldNotify(covariant PlatformProvider oldWidget) {
    return oldWidget.isMobile != isMobile;
  }
}
