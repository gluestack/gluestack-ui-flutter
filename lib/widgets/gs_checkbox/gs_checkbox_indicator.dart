import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_indicator_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector_proider.dart';

class GSCheckBoxIndicator extends StatelessWidget {
  const GSCheckBoxIndicator({super.key});

  Color? _resolvebgColor(GSStyle? styler,
      {bool isHovered = false,
      bool isChecked = false,
      bool isDisabled = false,
      bool isInvalid = false}) {
    if (isHovered && isChecked && isDisabled && isInvalid) {
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
    return styler?.borderColor;
  }

  Color? _resolveborderColor(
    GSStyle? styler, {
    bool isHovered = false,
    isChecked = false,
    isDisabled = false,
    isInvalid = false,
  }) {
    if (isHovered && isChecked && isDisabled && isInvalid) {
      return styler?.onHover?.checked?.onDisabled?.onInvaild?.borderColor;
    } else if (isHovered && isChecked && isDisabled) {
      return styler?.onHover?.checked?.onDisabled?.borderColor;
    } else if (isHovered && isDisabled && isInvalid) {
      return styler?.onHover?.onDisabled?.onInvaild?.borderColor;
    } else if (isInvalid) {
      return styler?.onInvaild?.borderColor;
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

    final styler = resolveStyles(context, variantStyle: checkBoxIndicatorStyle);

    final value = GSCheckBoxProvider.of(context);
    final isChecked = value?.value ?? false;
    final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
    final isDisabled = value?.isDisabled ?? true;
    final isInvalid = value?.isInvalid ?? false;

    final bg = _resolvebgColor(styler,
        isChecked: isChecked,
        isHovered: isHovered,
        isDisabled: isDisabled,
        isInvalid: isInvalid);
    final borderColor = _resolveborderColor(styler,
            isChecked: isChecked,
            isHovered: isHovered,
            isDisabled: isDisabled,
            isInvalid: isInvalid) ??
        const Color(0xFF000000);

    return InkWell(
      mouseCursor: isDisabled ? SystemMouseCursors.forbidden : null,
      onTap: () {
        // if (value != null && value.onChanged != null) {
        //   value.onChanged!(value.value);
        // }
      },
      child: Opacity(
        opacity: isDisabled ? styler?.onDisabled?.opacity ?? 0.0 : 1,
        child: Container(
          width: ancestorCheckBoxStyle?.height,
          height: ancestorCheckBoxStyle?.width,
          decoration: BoxDecoration(
            color: bg,
            border: Border.all(
                width: ancestorCheckBoxStyle?.borderWidth ?? 1.0,
                color: borderColor),
            borderRadius: BorderRadius.circular(styler?.borderRadius ?? 0.0),
          ),
          child:  Center(
            child: isChecked
                ? const Icon(
                    Icons.check,
                    size: 18,
                    color: Colors.white, // Set your check color
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
