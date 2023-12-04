import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

class GSFormProvider extends InheritedWidget {
  final bool? isInvalid;
  final bool? isDisabled;
  final bool? isReadOnly;
  final bool? isRequired;

  const GSFormProvider({
    super.key,
    this.isInvalid = false,
    this.isDisabled = false,
    this.isReadOnly = false,
    this.isRequired = false,
    required super.child,
  });

  @override
  bool updateShouldNotify(GSFormProvider oldWidget) {
    return isInvalid != oldWidget.isInvalid ||
        isDisabled != oldWidget.isDisabled ||
        isRequired != oldWidget.isRequired ||
        isReadOnly != oldWidget.isReadOnly;
  }

  static GSFormProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSFormProvider>();
  }
}
