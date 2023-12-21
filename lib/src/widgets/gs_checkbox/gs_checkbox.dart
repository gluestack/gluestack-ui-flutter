import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_checkbox/gs_checkbox_style.dart';
import 'package:gluestack_ui/src/widgets/gs_form_control/gs_form_provider.dart';

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
    final formProps = GSFormProvider.of(context);
    final checkBoxSize =
        widget.size ?? formProps?.size ?? checkboxStyle.props?.size;
    final styler = resolveStyles2(
      context: context,
      styles: [checkboxStyle, checkboxStyle.sizeMap(checkBoxSize)],
      inlineStyle: widget.style,
      isFirst: true,
    );
    bool? isCheckBoxDisabled = widget.isDisabled ?? groupValue?.isDisabled;
    bool? isCheckBoxInvalid = widget.isInvalid ?? groupValue?.isInvalid;
    bool? isCheckBoxReadOnly = widget.isReadOnly ?? groupValue?.isReadOnly;

    // final isRequired = GSFormProvider.of(context)?.isRequired ?? false; //TODO: is this to be done?

    isCheckBoxDisabled == null
        ? isCheckBoxDisabled = formProps?.isDisabled ?? false
        : null;
    isCheckBoxReadOnly == null
        ? isCheckBoxReadOnly = formProps?.isReadOnly ?? false
        : null;
    isCheckBoxInvalid == null
        ? isCheckBoxInvalid = formProps?.isInvalid ?? false
        : null;

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: GSFocusableActionDetector(
        isFocused: widget.isFocusVisible,
        isHovered: widget.isHovered,
        mouseCursor: isCheckBoxDisabled ? SystemMouseCursors.forbidden : null,
        child: GSCheckBoxProvider(
          isInvalid: isCheckBoxInvalid,
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
                        if (!isCheckBoxReadOnly! && widget.isChecked == null) {
                          groupValue?.updateValues(widget.value);
                        }
                        if (groupValue!.onChanged != null) {
                          groupValue?.onChanged!(groupValue?.values ?? []);
                        }
                      }
                      if (!isCheckBoxReadOnly! && widget.isChecked == null) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      }
                      widget.onChanged!(isChecked);
                    }
                  : null,
              child: Opacity(
                opacity: isCheckBoxDisabled ? 0.5 : 1,
                child: resolveFlexWidget(
                    flexDirection: styler.flexDirection,
                    mainAxisAlignment: styler.justifyContent,
                    crossAxisAlignment: styler.alignItems,
                    children: [
                      widget.icon,
                      if (widget.label != null) widget.label!
                    ]),
              )),
        ),
      ),
    );
  }
}
