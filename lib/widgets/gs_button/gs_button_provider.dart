import 'package:flutter/material.dart';

import '../styled_button/styled_button_variants.dart';

enum ButtonAction { primary, secondary }

class GSButtonProvider extends InheritedWidget {
  final String action;
  final String variant;
  final String size;

  GSButtonProvider({
    required this.action,
    required this.variant,
    required this.size,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(GSButtonProvider oldWidget) {
    return action != oldWidget.action || variant != oldWidget.variant;
  }

  static GSButtonProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSButtonProvider>();
  }
}
