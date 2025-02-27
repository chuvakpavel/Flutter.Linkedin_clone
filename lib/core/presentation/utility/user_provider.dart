import 'package:flutter/material.dart';

import '../../models/user.dart';


class UserProvider extends InheritedWidget {
  final User user;

  const UserProvider({
    super.key,
    required this.user,
    required super.child,
  });

  static UserProvider of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<UserProvider>();
    assert(provider != null, 'No UserProvider found in context');
    return provider!;
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) => user != oldWidget.user;
}