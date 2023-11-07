import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';

class GSBadgeProvider extends InheritedWidget {
  final GSActions action;
  final GSSizes size;
  final Color iconAndTextColor;

  const GSBadgeProvider({
    super.key,
    required this.size,
    required this.action,
    required this.iconAndTextColor,
    required Widget child,

  }) : super(child: child);

  @override
  bool updateShouldNotify(GSBadgeProvider oldWidget) {
    return action != oldWidget.action || size != oldWidget.size || iconAndTextColor != oldWidget.iconAndTextColor;
  }

  static GSBadgeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSBadgeProvider>();
  }
}
