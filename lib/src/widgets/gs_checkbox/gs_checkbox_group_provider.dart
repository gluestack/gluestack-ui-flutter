import 'package:flutter/widgets.dart';

class GSCheckBoxGroupProvider extends InheritedWidget {
  final List<String> values;
  final void Function(List<String>?)? onChanged;
  final void Function(String value, {bool shouldUpdate}) updateValues;
  final bool isDisabled;
  final bool isInvalid;
  final bool isReadOnly;
  const GSCheckBoxGroupProvider(
      {super.key,
      required super.child,
      required this.values,
      required this.onChanged,
      required this.isDisabled,
      required this.isInvalid,
      required this.isReadOnly,
      required this.updateValues});
  @override
  bool updateShouldNotify(GSCheckBoxGroupProvider oldWidget) {
    return isDisabled != oldWidget.isDisabled ||
        isInvalid != oldWidget.isInvalid ||
        isReadOnly != oldWidget.isReadOnly;
  }

  static GSCheckBoxGroupProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GSCheckBoxGroupProvider>();
  }
}
