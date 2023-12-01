import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

class ButtonGroupProvider extends InheritedWidget {
  final bool isDisabled;
  final GSSizes size;
  final bool isAttached;

  const ButtonGroupProvider({
    super.key,
    required this.isDisabled,
    required this.size,
    required this.isAttached,
    required super.child,
  });

  @override
  bool updateShouldNotify(ButtonGroupProvider oldWidget) {
    return isDisabled != oldWidget.isDisabled ||
        size != oldWidget.size ||
        isAttached != oldWidget.isAttached;
  }

  static ButtonGroupProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ButtonGroupProvider>();
  }
}
