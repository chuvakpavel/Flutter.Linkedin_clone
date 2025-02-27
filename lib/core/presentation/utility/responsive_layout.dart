import 'package:flutter/material.dart';

extension ResponsiveLayout on BuildContext {
  static const double tightLayoutWidth = 852;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  bool get isTightLayout => MediaQuery.of(this).size.width < tightLayoutWidth;

  double get compressedTabsMaxWidth => 425;
}
