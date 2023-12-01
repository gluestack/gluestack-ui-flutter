import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

class ButtonProvider extends InheritedWidget {
  final GSActions action;
  final GSVariants variant;
  final GSSizes size;

  const ButtonProvider({
    super.key,
    required this.action,
    required this.variant,
    required this.size,
    required super.child,
  });

  @override
  bool updateShouldNotify(ButtonProvider oldWidget) {
    return action != oldWidget.action || variant != oldWidget.variant;
  }

  static ButtonProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ButtonProvider>();
  }
}
