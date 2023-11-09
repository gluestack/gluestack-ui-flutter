import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';

class GSBadgeProvider extends InheritedWidget {
  final GSActions action;
  final GSVariants variant;
  final GSSizes size;
  final GSStyle? textStyle;
  final GSStyle? iconStyle;

  const GSBadgeProvider({
    super.key,
    required this.size,
    required this.action,
    required this.variant,
    required this.textStyle,
    required this.iconStyle,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(GSBadgeProvider oldWidget) {
    return action != oldWidget.action || size != oldWidget.size;
  }

  static GSBadgeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSBadgeProvider>();
  }
}
