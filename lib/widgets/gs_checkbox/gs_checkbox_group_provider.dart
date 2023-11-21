import 'package:flutter/material.dart';

class GSCheckBoxGroupProvider extends InheritedWidget {
  final List<String> values;
  final void Function(List<String>?)? onChanged;
  final void Function(String value) updateValues;
  const GSCheckBoxGroupProvider(
      {super.key,
      required Widget child,
      required this.values,
      required this.onChanged,
      required this.updateValues})
      : super(child: child);
  @override
  bool updateShouldNotify(GSCheckBoxGroupProvider oldWidget) {
    return true;
  }

  static GSCheckBoxGroupProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GSCheckBoxGroupProvider>();
  }
}
