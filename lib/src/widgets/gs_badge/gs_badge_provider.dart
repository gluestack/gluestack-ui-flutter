import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

/// GSBadgeProvider is an InheritedWidget used to provide badge-related information to its descendants.
class GSBadgeProvider extends InheritedWidget {
  // Font size for the badge text.
  final double? fontSize;
  // Icon size for the badge icon.
  final GSSizes? iconSize;

  /// Constructor for GSBadgeProvider:
  const GSBadgeProvider({
    super.key,
    required this.fontSize,
    required this.iconSize,
    required super.child,
  });

  /// Overrides the method to determine whether an update notification is needed.
  @override
  bool updateShouldNotify(GSBadgeProvider oldWidget) {
    return fontSize != oldWidget.fontSize || iconSize != oldWidget.iconSize;
  }

  /// Static method to obtain the GSBadgeProvider instance from the given context.
  static GSBadgeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSBadgeProvider>();
  }
}
