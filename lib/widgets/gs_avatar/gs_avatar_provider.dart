import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';

class GSAvatarProvider extends InheritedWidget {
  final double? badgeRaidus;
  final TextStyle? textStyle;
  final GSStyle avatarStyle;

  const GSAvatarProvider({
    super.key,
    this.badgeRaidus,
    this.textStyle,
    required this.avatarStyle,
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
