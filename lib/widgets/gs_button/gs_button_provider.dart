import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';

class GSButtonProvider extends InheritedWidget {
  final GSActions action;
  final GSVariants variant;
  final GSSizes size;

  const GSButtonProvider({
    super.key,
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
