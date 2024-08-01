import 'package:gluestack_ui/gluestack_ui.dart';

/// GSSelectProvider is an InheritedWidget used to provide badge-related information to its descendants.
class GSSelectProvider extends InheritedWidget {
  // Font size for the badge text.
  final double? fontSize;
  // Icon size for the badge icon.
  final GSSizes? iconSize;
  final GSSizes? headerFontSize;
  final GSVariants? selectVariant;
  final GSSizes? textSize;

  /// Constructor for GSSelectProvider:
  const GSSelectProvider({
    super.key,
    required this.fontSize,
    required this.iconSize,
    required super.child,
    required this.headerFontSize,
    this.selectVariant,
    this.textSize,
  });

  /// Overrides the method to determine whether an update notification is needed.
  @override
  bool updateShouldNotify(GSSelectProvider oldWidget) {
    return fontSize != oldWidget.fontSize ||
        iconSize != oldWidget.iconSize ||
        headerFontSize != oldWidget.headerFontSize ||
        selectVariant != oldWidget.selectVariant ||
        textSize != oldWidget.textSize;
  }

  /// Static method to obtain the GSSelectProvider instance from the given context.
  static GSSelectProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSSelectProvider>();
  }
}
