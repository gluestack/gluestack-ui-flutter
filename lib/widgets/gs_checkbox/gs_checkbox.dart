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
  final bool defaultIsChecked;
  final bool? isChecked;
  final bool? isDisabled;
  final bool? isReadOnly;
  final bool isFocusVisible;
  final bool? isInvalid;
  final bool isHovered;
  final GSStyle? style;
  final void Function(bool? value)? onChanged;
  const GSCheckBox({
    super.key,
    required this.icon,
    required this.value,
    this.size,
    this.label,
    this.onChanged,
    this.style,
    this.isChecked,
    this.isInvalid,
    this.isDisabled,
    this.isReadOnly,
    this.isFocusVisible = false,
    this.isHovered = false,
    this.defaultIsChecked = false,
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
  late GSCheckBoxGroupProvider? groupValue;
  @override
  void initState() {
    isChecked = widget.defaultIsChecked;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    groupValue = GSCheckBoxGroupProvider.of(context);
    if (widget.defaultIsChecked ||
        (widget.isChecked != null && widget.isChecked!)) {
      groupValue?.updateValues(widget.value, shouldUpdate: false);
    }
    isChecked = groupValue?.values.contains(widget.value) ?? isChecked;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final checkBoxSize = widget.size ?? checkboxStyle.props?.size;
    final styler = resolveStyles(context,
        variantStyle: checkboxStyle,
        size: GsCheckBoxStyle.size[checkBoxSize],
        descendantStyleKeys: checkBoxConfig.descendantStyle,
        inlineStyle: widget.style);
    final isCheckBoxDisabled =
        widget.isDisabled ?? groupValue?.isDisabled ?? false;
    final isCheckBoxInvaild =
        widget.isInvalid ?? groupValue?.isInvalid ?? false;
    final isCheckBoxReadOnly =
        widget.isReadOnly ?? groupValue?.isReadOnly ?? false;
    return GSAncestor(
      decedentStyles: styler?.descendantStyles,
      child: GSFocusableActionDetector(
        isFocused: widget.isFocusVisible,
        isHovered: widget.isHovered,
        mouseCursor: isCheckBoxDisabled ? SystemMouseCursors.forbidden : null,
        child: GSCheckBoxProvider(
          isInvalid: isCheckBoxInvaild,
          isDisabled: isCheckBoxDisabled,
          isChecked: widget.isChecked ?? isChecked,
          value: widget.value,
          onChanged: isCheckBoxDisabled ? null : widget.onChanged,
          child: InkWell(
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              mouseCursor: isCheckBoxDisabled
                  ? SystemMouseCursors.forbidden
                  : SystemMouseCursors.click,
              onTap: widget.onChanged != null && !isCheckBoxDisabled
                  ? () {
                      if (groupValue != null) {
                        if (!isCheckBoxReadOnly && widget.isChecked == null) {
                          groupValue?.updateValues(widget.value);
                        }
                        if (groupValue!.onChanged != null) {
                          groupValue?.onChanged!(groupValue?.values ?? []);
                        }
                      }
                      if (!isCheckBoxReadOnly && widget.isChecked == null) {
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
