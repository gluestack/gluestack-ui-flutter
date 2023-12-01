import 'package:flutter/material.dart';

/// GSBadgeProvider is an InheritedWidget used to provide badge-related information to its descendants.
class BadgeProvider extends InheritedWidget {
  // Font size for the badge text.
  final double? fontSize;
  // Icon size for the badge icon.
  final double? iconSize;

  /// Constructor for GSBadgeProvider:
  const BadgeProvider({
    super.key,
    required this.fontSize,
    required this.iconSize,
    required super.child,
  });

  /// Overrides the method to determine whether an update notification is needed.
  @override
  bool updateShouldNotify(BadgeProvider oldWidget) {
    return fontSize != oldWidget.fontSize || iconSize != oldWidget.iconSize;
  }

  /// Static method to obtain the GSBadgeProvider instance from the given context.
  static BadgeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BadgeProvider>();
  }
}
