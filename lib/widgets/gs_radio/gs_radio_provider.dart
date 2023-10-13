import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_token.dart';

class GSRadioProvider extends InheritedWidget {
  final GSRadioSize size;

  const GSRadioProvider({
    super.key,
    required this.size,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(GSRadioProvider oldWidget) {
    return size != oldWidget.size;
  }

  static GSRadioProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSRadioProvider>();
  }
}
