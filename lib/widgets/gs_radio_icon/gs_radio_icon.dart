import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_token.dart';

class GSRadioIcon<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final void Function(T?)? onChanged;
  final Color? activeColor;
  final bool autofocus;
  final Color? focusColor;
  final MaterialStateProperty<Color?>? fillColor;
  final FocusNode? focusNode;
  final Color? hoverColor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final MouseCursor? mouseCursor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final VisualDensity? visualDensity;
  final bool toggleable;
  const GSRadioIcon(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      this.activeColor,
      this.fillColor,
      this.focusColor,
      this.focusNode,
      this.hoverColor,
      this.materialTapTargetSize,
      this.mouseCursor,
      this.overlayColor,
      this.splashRadius,
      this.visualDensity,
      this.toggleable = false,
      this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    final gsRadioProvider = GSRadioProvider.of(context);
    return Transform.scale(
        scale: GSRadioToken.radioSize[gsRadioProvider!.size]! / 24.0,
        child: Radio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: activeColor,
          autofocus: autofocus,
          fillColor: fillColor,
          focusColor: focusColor,
          focusNode: focusNode,
          hoverColor: hoverColor,
          mouseCursor: mouseCursor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          toggleable: false,
          materialTapTargetSize: materialTapTargetSize,
          visualDensity: visualDensity ??
              const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
        ));
  }
}
