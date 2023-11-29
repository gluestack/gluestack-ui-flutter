import 'package:flutter/material.dart';

class GSCheckBoxProvider extends InheritedWidget {
  final String value;
  final bool isChecked;
  final bool isDisabled;
  final bool isInvalid;
  final void Function(bool?)? onChanged;
  const GSCheckBoxProvider(
      {super.key,
      required super.child,
      required this.value,
      required this.isChecked,
      required this.isDisabled,
      required this.isInvalid,
      required this.onChanged});
  @override
  bool updateShouldNotify(GSCheckBoxProvider oldWidget) {
    return isChecked != oldWidget.isChecked ||
        isDisabled != oldWidget.isDisabled ||
        isInvalid != oldWidget.isInvalid;
  }

  static GSCheckBoxProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSCheckBoxProvider>();
  }
}
