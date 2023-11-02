import 'package:flutter/material.dart';

class GSFocusableActionDetectorProvider extends InheritedWidget {
  final bool isHovered;
  final bool isFocused;

  const GSFocusableActionDetectorProvider(
      {super.key,
      required Widget child,
      required this.isFocused,
      required this.isHovered})
      : super(child: child);

  static GSFocusableActionDetectorProvider? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        GSFocusableActionDetectorProvider>();
  }

  @override
  bool updateShouldNotify(GSFocusableActionDetectorProvider oldWidget) {
    return isFocused != oldWidget.isFocused || isHovered != oldWidget.isHovered;
  }
}
