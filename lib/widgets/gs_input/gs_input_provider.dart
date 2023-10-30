import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_token.dart';

class GSInputProvider extends InheritedWidget {
  final GSInputVariant variant;
  final GSInputSize size;

  const GSInputProvider({
    super.key,
    required this.variant,
    required this.size,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(GSInputProvider oldWidget) {
    return variant != oldWidget.variant;
  }

  static GSInputProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSInputProvider>();
  }
}
