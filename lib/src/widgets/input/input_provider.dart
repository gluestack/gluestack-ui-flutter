import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/widgets/input/input_token.dart';

class InputProvider extends InheritedWidget {
  final GSInputVariant variant;
  final GSInputSize size;

  const InputProvider({
    super.key,
    required this.variant,
    required this.size,
    required super.child,
  });

  @override
  bool updateShouldNotify(InputProvider oldWidget) {
    return variant != oldWidget.variant;
  }

  static InputProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InputProvider>();
  }
}
