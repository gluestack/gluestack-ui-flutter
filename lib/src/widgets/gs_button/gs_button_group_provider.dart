import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

class GSButtonGroupProvider extends InheritedWidget {
  final bool isDisabled;
  final GSSizes size;
  final bool isAttached;

  const GSButtonGroupProvider({
    super.key,
    required this.isDisabled,
    required this.size,
    required this.isAttached,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(GSButtonGroupProvider oldWidget) {
    return isDisabled != oldWidget.isDisabled ||
        size != oldWidget.size ||
        isAttached != oldWidget.isAttached;
  }

  static GSButtonGroupProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSButtonGroupProvider>();
  }
}
