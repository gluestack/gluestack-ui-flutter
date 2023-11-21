import 'package:flutter/material.dart';

class GSBadgeProvider extends InheritedWidget {
  final double? fontSize;
  final double? iconSize;

  const GSBadgeProvider({
    super.key,
    required this.fontSize,
    required this.iconSize,
    required Widget child,

  }) : super(child: child);

  @override
  bool updateShouldNotify(GSBadgeProvider oldWidget) {
    return fontSize != oldWidget.fontSize || iconSize != oldWidget.iconSize;
  }

  static GSBadgeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSBadgeProvider>();
  }
}
