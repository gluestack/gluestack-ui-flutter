import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';

class GSRadioProvider<T> extends InheritedWidget {
  final GSSizes size;
  final T value;
  final T groupValue;
  final void Function(T?)? onChanged;
  final bool isHovered;
  final GSStyle? style;
  final bool isDisabled;
  final bool isInvalid;
  const GSRadioProvider({
    super.key,
    required this.size,
    required this.groupValue,
    required this.isHovered,
    required this.value,
    required this.onChanged,
    required this.isDisabled,
    required this.isInvalid,
    required Widget child,
    this.style,
  }) : super(child: child);

  @override
  bool updateShouldNotify(GSRadioProvider oldWidget) {
    return size != oldWidget.size ||
        groupValue != oldWidget.groupValue ||
        isHovered != oldWidget.isHovered ||
        isDisabled != oldWidget.isDisabled || isInvalid!=oldWidget.isInvalid;
  }

  static GSRadioProvider<T>? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSRadioProvider<T>>();
  }
}
