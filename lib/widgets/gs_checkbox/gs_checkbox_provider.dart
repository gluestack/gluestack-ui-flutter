import 'package:flutter/material.dart';

class GSCheckBoxProvider extends InheritedWidget {
  final bool value;
  final bool isDisabled;
  final bool isInvalid;
  final void Function(bool?)? onChanged;
  const GSCheckBoxProvider(
      {super.key,
      required Widget child,
      required this.value,
      required this.isDisabled,
      required this.isInvalid,
      required this.onChanged})
      : super(child: child);
  @override
  bool updateShouldNotify(GSCheckBoxProvider oldWidget) {
    return value != oldWidget.value ||
        isDisabled != oldWidget.isDisabled ||
        isInvalid != oldWidget.isInvalid;
  }

  static GSCheckBoxProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSCheckBoxProvider>();
  }
}
