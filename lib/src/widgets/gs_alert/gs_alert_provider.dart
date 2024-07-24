import 'package:gluestack_ui/gluestack_ui.dart';

/// GSAlertBoxProvider is an InheritedWidget used to provide badge-related information to its descendants.
class GSAlertBoxProvider extends InheritedWidget {
  // Font size for the badge text.
  final double? fontSize;
  // Icon size for the badge icon.
  final GSSizes? iconSize;

  /// Constructor for GSAlertBoxProvider:
  const GSAlertBoxProvider({
    super.key,
    required this.fontSize,
    required this.iconSize,
    required super.child,
  });

  /// Overrides the method to determine whether an update notification is needed.
  @override
  bool updateShouldNotify(GSAlertBoxProvider oldWidget) {
    return fontSize != oldWidget.fontSize || iconSize != oldWidget.iconSize;
  }

  /// Static method to obtain the GSAlertBoxProvider instance from the given context.
  static GSAlertBoxProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSAlertBoxProvider>();
  }
}
