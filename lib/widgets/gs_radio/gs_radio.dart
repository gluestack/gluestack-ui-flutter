import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor.dart';

import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_style.dart';

/*

what is achieved so far

   1) invaild state
   2) disable state
   3) hover state (default)
   4) support for inline style


what is pending
    
    1) managing hover state on custom inline style
    2) making radio icon circle hoverable
    3) passing props to children

*/

class GSRadio<T> extends StatelessWidget {
  final GSSizes? size;
  final Widget icon;
  final Widget? label;
  final T value;
  final T groupValue;
  final bool isDisabled;
  final bool isInvalid;
  final GSStyle? style;
  final void Function(T?)? onChanged;

  const GSRadio(
      {super.key,
      required this.icon,
      required this.groupValue,
      required this.value,
      required this.onChanged,
      this.style,
      this.isDisabled = false,
      this.isInvalid = false,
      this.label,
      this.size});

  @override
  Widget build(BuildContext context) {
    final radioSize = size ?? radioStyle.props!.size!;

    return GSAncestor(
      decedentStyles: GSRadioStyles.radioDescendantStyles[radioSize]!,
      child: GSFocusableActionDetector(
        child: InkWell(
          hoverColor: Colors.transparent,
          mouseCursor: isDisabled
              ? SystemMouseCursors.forbidden
              : SystemMouseCursors.click,
          onTap: () {
            if (!isDisabled && value != groupValue) {
              onChanged!.call(value);
            }
          },
          child: GSRadioProvider<T>(
              value: value,
              groupValue: groupValue,
              onChanged: null,
              size: radioSize,
              style: style,
              isInvalid: isInvalid,
              isDisabled: isDisabled,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [icon, if (label != null) label!],
              )),
        ),
      ),
    );
  }
}
