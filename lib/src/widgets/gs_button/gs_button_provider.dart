import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

class GSButtonProvider extends InheritedWidget {
  final GSActions action;
  final GSVariants variant;
  final GSSizes size;

  const GSButtonProvider({
    super.key,
    required this.action,
    required this.variant,
    required this.size,
    required super.child,
  });

  @override
  bool updateShouldNotify(GSButtonProvider oldWidget) {
    return action != oldWidget.action || variant != oldWidget.variant;
  }

  static GSButtonProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSButtonProvider>();
  }
}
