import 'package:flutter/material.dart';

class GSStyleBuilderProvider extends InheritedWidget {
  final bool isHovered;
  final bool isActive;
  final bool isFocused;
  final bool isDisabled;
  final bool isInvaild;
  const GSStyleBuilderProvider(
      {super.key,
      required Widget child,
      required this.isActive,
      required this.isDisabled,
      required this.isFocused,
      required this.isInvaild,
      required this.isHovered})
      : super(child: child);

  @override
  bool updateShouldNotify(GSStyleBuilderProvider oldWidget) {
    return isHovered != oldWidget.isHovered ||
        isActive != oldWidget.isActive ||
        isFocused != oldWidget.isFocused ||
        isDisabled != oldWidget.isDisabled ||
        isInvaild != oldWidget.isInvaild;
  }

  static GSStyleBuilderProvider? of(BuildContext context,
          {bool listen = true}) =>
      listen
          ? context.dependOnInheritedWidgetOfExactType<GSStyleBuilderProvider>()
          : context.getInheritedWidgetOfExactType<GSStyleBuilderProvider>();

  static bool hoverStatus(BuildContext context, {bool listen = true}) =>
      GSStyleBuilderProvider.of(context, listen: listen)?.isHovered ?? false;

  static bool activeStatus(BuildContext context, {bool listen = true}) =>
      GSStyleBuilderProvider.of(context, listen: listen)?.isActive ?? false;

  static bool focusedStatus(BuildContext context, {bool listen = true}) =>
      GSStyleBuilderProvider.of(context, listen: listen)?.isFocused ?? false;

  static bool disabledStatus(BuildContext context, {bool listen = true}) =>
      GSStyleBuilderProvider.of(context, listen: listen)?.isDisabled ?? false;

  static bool inVaildStatus(BuildContext context, {bool listen = true}) =>
      GSStyleBuilderProvider.of(context, listen: listen)?.isInvaild ?? false;
}
