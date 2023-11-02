import 'package:flutter/material.dart';

class GSFocusableActionDetectorProvider extends InheritedWidget {
  final bool hoverStatus;
  final bool focusStatus;

  const GSFocusableActionDetectorProvider(
      {super.key,
      required Widget child,
      required this.focusStatus,
      required this.hoverStatus})
      : super(child: child);

  static GSFocusableActionDetectorProvider? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        GSFocusableActionDetectorProvider>();
  }

  static bool isHovered(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<
                GSFocusableActionDetectorProvider>()
            ?.hoverStatus ??
        false;
  }

  static bool isFocused(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<
                GSFocusableActionDetectorProvider>()
            ?.focusStatus ??
        false;
  }

  @override
  bool updateShouldNotify(GSFocusableActionDetectorProvider oldWidget) {
    return focusStatus != oldWidget.focusStatus ||
        hoverStatus != oldWidget.hoverStatus;
  }
}
