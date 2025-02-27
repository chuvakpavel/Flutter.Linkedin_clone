import 'package:flutter/material.dart';

class NavigationItem {
  NavigationItem({
    required this.icon,
    required this.label,
    this.alternativeIcon,
    this.overlay,
    this.imageIcon,
    this.badge,
  });

  final IconData icon;

  final String label;

  final IconData? alternativeIcon;

  final Widget? overlay;

  final String? imageIcon;

  final Widget? badge;
}
