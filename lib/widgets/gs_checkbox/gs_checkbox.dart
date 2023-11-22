import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/utils/resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_group_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector.dart';

class GSCheckBox extends StatefulWidget {
  final String value;
  final Widget icon;
  final Widget? label;
  final GSSizes? size;
  final bool isDisabled;
  final bool isInvalid;
  
  final GSStyle? style;
  final void Function(bool?)? onChanged;
  const GSCheckBox({
    super.key,
    required this.icon,
    required this.value,
    this.size,
    this.label,
    this.onChanged,
    this.style,
    this.isDisabled = false,
    this.isInvalid = false,
  }) : assert(
            size == GSSizes.$lg ||
                size == GSSizes.$md ||
                size == GSSizes.$sm ||
                size == null,
            "only support sizes of lg,md,sm");

  @override
  State<GSCheckBox> createState() => _GSCheckBoxState();
}

class _GSCheckBoxState extends State<GSCheckBox> {
  late bool isChecked;
  @override
  void initState() {
    isChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final checkBoxSize = widget.size ?? checkboxStyle.props?.size;
    final styler = resolveStyles(context,
        variantStyle: checkboxStyle,
        size: GsCheckBoxStyle.size[checkBoxSize],
        descendantStyleKeys: checkBoxConfig.descendantStyle,
        inlineStyle: widget.style);

    final groupValue = GSCheckBoxGroupProvider.of(context);
    isChecked = groupValue?.values.contains(widget.value) ?? isChecked;
    return GSAncestor(
      decedentStyles: styler?.descendantStyles,
      child: GSFocusableActionDetector(
        mouseCursor: widget.isDisabled ? SystemMouseCursors.forbidden : null,
        child: GSCheckBoxProvider(
          isInvalid: widget.isInvalid,
          isDisabled: widget.isDisabled,
          isChecked: isChecked,
          value: widget.value,
          onChanged: widget.isDisabled ? null : widget.onChanged,
          child: InkWell(
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              mouseCursor:
                  widget.isDisabled ? SystemMouseCursors.forbidden : null,
              onTap: widget.onChanged != null && !widget.isDisabled
                  ? () {
                      if (groupValue != null) {
                        groupValue.updateValues(widget.value);
                        groupValue.onChanged!(groupValue.values);
                      } else {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      }
                      widget.onChanged!(isChecked);
                    }
                  : null,
              child: resolveFlexWidget(
                  flexDirection: styler?.flexDirection,
                  mainAxisAlignment: styler?.justifyContent,
                  crossAxisAlignment: styler?.alignItems,
                  children: [
                    widget.icon,
                    if (widget.label != null) widget.label!
                  ])),
        ),
      ),
    );
  }
}
