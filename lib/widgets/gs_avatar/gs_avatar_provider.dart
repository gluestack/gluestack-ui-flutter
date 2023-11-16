import 'package:flutter/material.dart';

class GSAvatarProvider extends InheritedWidget {
  final double? badgeRaidus;
  final TextStyle? textStyle;

  const GSAvatarProvider({
    super.key,
    this.badgeRaidus,
    this.textStyle,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(GSAvatarProvider oldWidget) {
    return textStyle?.fontSize != oldWidget.textStyle?.fontSize ||
        textStyle != oldWidget.textStyle ||
        badgeRaidus != oldWidget.badgeRaidus;
  }

  static GSAvatarProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSAvatarProvider>();
  }
}
