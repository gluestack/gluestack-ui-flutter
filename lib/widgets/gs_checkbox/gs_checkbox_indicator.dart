import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_indicator_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector_proider.dart';

class GSCheckBoxIndicator extends StatelessWidget {
  final Widget child;
  final GSStyle? style;
  const GSCheckBoxIndicator({super.key, required this.child,this.style});

  Color? _resolvebgColor(
    GSStyle? styler, {
    bool isHovered = false,
    bool isChecked = false,
    bool isDisabled = false,
    bool isInvalid = false,
    bool isActive = false,
  }) {
    if (isActive && isChecked) {
      return styler?.onActive?.checked?.bg;
    } else if (isHovered && isChecked && isDisabled && isInvalid) {
      return styler?.onHover?.checked?.onDisabled?.onInvaild?.bg;
    } else if (isHovered && isChecked && isDisabled) {
      return styler?.onHover?.checked?.onDisabled?.bg;
    } else if (isHovered && isDisabled && isInvalid) {
      return styler?.onHover?.onDisabled?.onInvaild?.bg;
    } else if (isHovered && isDisabled) {
      return styler?.onHover?.onDisabled?.bg;
    } else if (isHovered && isChecked) {
      return styler?.onHover?.checked?.bg;
    } else if (isHovered) {
      return styler?.onHover?.bg;
    } else if (isChecked) {
      return styler?.checked?.bg;
    } else if (isInvalid) {
      return styler?.onInvaild?.bg;
    } else if (isDisabled) {
      return styler?.onDisabled?.bg;
    }

    return styler?.bg;
  }

  Color? _resolveborderColor(GSStyle? styler,
      {bool isHovered = false,
      isChecked = false,
      isDisabled = false,
      isInvalid = false,
      isActive = false}) {
    if (isInvalid) {
      return styler?.onInvaild?.borderColor;
    } else if (isActive && isChecked) {
      return styler?.onActive?.checked?.borderColor;
    } else if (isHovered && isChecked && isDisabled && isInvalid) {
      return styler?.onHover?.checked?.onDisabled?.onInvaild?.borderColor;
    } else if (isHovered && isChecked && isDisabled) {
      return styler?.onHover?.checked?.onDisabled?.borderColor;
    } else if (isHovered && isDisabled && isInvalid) {
      return styler?.onHover?.onDisabled?.onInvaild?.borderColor;
    } else if (isHovered && isDisabled) {
      return styler?.onHover?.onDisabled?.borderColor;
    } else if (isHovered && isChecked) {
      return styler?.onHover?.checked?.borderColor;
    } else if (isHovered) {
      return styler?.onHover?.borderColor;
    } else if (isDisabled) {
      return styler?.onDisabled?.borderColor;
    } else if (isChecked) {
      return styler?.checked?.borderColor;
    }

    return styler?.borderColor;
  }

  @override
  Widget build(BuildContext context) {
    final ancestorCheckBoxStyle = GSAncestorProvider.of(context)
        ?.decedentStyles?[checkBoxIndicatorConfig.descendantStyle.first];

    final styler = resolveStyles(context, variantStyle: checkBoxIndicatorStyle,inlineStyle: style);

    final value = GSCheckBoxProvider.of(context);
    final isChecked = value?.value ?? false;
    final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
    final isActive = GSFocusableActionDetectorProvider.isActive(context);
    final isDisabled = value?.isDisabled ?? true;
    final isInvalid = value?.isInvalid ?? false;

    final bg = _resolvebgColor(styler,
        isChecked: isChecked,
        isHovered: isHovered,
        isDisabled: isDisabled,
        isInvalid: isInvalid,
        isActive: isActive);
    final borderColor = _resolveborderColor(styler,
            isChecked: isChecked,
            isHovered: isHovered,
            isDisabled: isDisabled,
            isInvalid: isInvalid,
            isActive: isActive) ??
        const Color(0xFF000000);

    return Opacity(
      opacity: isDisabled ? styler?.onDisabled?.opacity ?? 0.0 : 1,
      child: Container(
        width: ancestorCheckBoxStyle?.height,
        height: ancestorCheckBoxStyle?.width,
        margin: styler?.margin,
        decoration: BoxDecoration(
          color: bg,
          border: Border.all(
              width: ancestorCheckBoxStyle?.borderWidth ?? 1.0,
              color: borderColor),
          borderRadius: BorderRadius.circular(styler?.borderRadius ?? 0.0),
        ),
        child: isChecked ? Center(child: child) : null,
      ),
    );
  }
}
