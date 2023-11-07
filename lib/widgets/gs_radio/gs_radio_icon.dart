import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector_proider.dart';

import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_style.dart';

class GSRadioIcon<T> extends StatelessWidget {
  final Color? activeColor;
  final bool autofocus;
  final Color? focusColor;
  final FocusNode? focusNode;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final bool toggleable;
  final VisualDensity? visualDensity;
  const GSRadioIcon(
      {super.key,
      this.activeColor,
      this.autofocus = false,
      this.focusColor,
      this.focusNode,
      this.hoverColor,
      this.overlayColor,
      this.toggleable = false,
      this.visualDensity});

  @override
  Widget build(BuildContext context) {
    final value = GSRadioProvider.of<T>(context);
    final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
    final bool isChecked = value!.value == value.groupValue;
    GSStyle styler = resolveStyles(
      variantStyle: radioIconStyle.merge(radioIndicatorStyle),
      context,
      inlineStyle: value.style,
    )!;

    return Opacity(
      opacity: value.isDisabled ? styler.onDisabled!.opacity! : 1,
      child: Radio(
          activeColor: activeColor,
          autofocus: autofocus,
          focusColor: focusColor,
          focusNode: focusNode,
          hoverColor: hoverColor,
          overlayColor: overlayColor,
          toggleable: toggleable,
          visualDensity: visualDensity,
          mouseCursor: value.isDisabled
              ? SystemMouseCursors.forbidden
              : SystemMouseCursors.click,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fillColor: MaterialStateColor.resolveWith((states) {
            return value.isInvalid
                ? styler.onInvaild!.borderColor!
                : isHovered
                    ? isChecked
                        ? styler.checked!.onHover!.color!
                        : styler.onHover!.borderColor!
                    : isChecked
                        ? styler.checked!.color!
                        : styler.borderColor!;
          }),
          splashRadius: 0.0,
          value: value.value,
          groupValue: value.groupValue,
          onChanged: value.onChanged),
    );
  }
}