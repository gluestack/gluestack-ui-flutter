import 'package:flutter/material.dart';

class CheckBoxProvider extends InheritedWidget {
  final String value;
  final bool isChecked;
  final bool isDisabled;
  final bool isInvalid;
  final void Function(bool?)? onChanged;
  const CheckBoxProvider(
      {super.key,
      required super.child,
      required this.value,
      required this.isChecked,
      required this.isDisabled,
      required this.isInvalid,
      required this.onChanged});
  @override
  bool updateShouldNotify(CheckBoxProvider oldWidget) {
    return isChecked != oldWidget.isChecked ||
        isDisabled != oldWidget.isDisabled ||
        isInvalid != oldWidget.isInvalid;
  }

  static CheckBoxProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CheckBoxProvider>();
  }
}
