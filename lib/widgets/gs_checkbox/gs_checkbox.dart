import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector.dart';

class GSCheckBox extends StatelessWidget {
  final bool value;
  final Widget icon;
  final Widget? label;
  final GSSizes? size;
  final bool isDisabled;
  final bool isInvalid;
  final GSStyle? style;
  final void Function(bool?)? onChanged;
  const GSCheckBox(
      {super.key,
      required this.icon,
      this.size,
      this.label,
      this.onChanged,
      this.style,
      this.isDisabled = false,
      this.isInvalid = false,
      this.value = false})
      : assert(
            size == GSSizes.$lg ||
                size == GSSizes.$md ||
                size == GSSizes.$sm ||
                size == null,
            "only support sizes of lg,md,sm");

  @override
  Widget build(BuildContext context) {
    final checkBoxSize = size ?? checkboxStyle.props?.size;
    final styler = resolveStyles(context,
        size: GsCheckBoxStyle.size[checkBoxSize], inlineStyle: style);

    return GSAncestor(
      decedentStyles: styler?.descendantStyles,
      child: GSFocusableActionDetector(
        mouseCursor: isDisabled ? SystemMouseCursors.forbidden : null,
        child: GSCheckBoxProvider(
          isInvalid: isInvalid,
          isDisabled: isDisabled,
          value: isDisabled ? false : value,
          onChanged: isDisabled ? null : onChanged,
          child: InkWell(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            mouseCursor: isDisabled ? SystemMouseCursors.forbidden : null,
            onTap: onChanged != null
                ? () {
                    onChanged!(!value);
                  }
                : null,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [icon, if (label != null) label!],
            ),
          ),
        ),
      ),
    );
  }
}
