import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_ui/src/widgets/checkbox/checkbox_label_style.dart';
import 'package:gluestack_ui/src/widgets/checkbox/checkbox_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_focusableActionDetector/gs_focusable_action_detector_provider.dart';

class GSCheckBoxLabel extends StatelessWidget {
  final String text;
  final GSStyle? style;
  const GSCheckBoxLabel({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    final ancestorCheckBoxStyle = GSAncestorProvider.of(context)
        ?.decedentStyles?[checkBoxLabelConfig.ancestorStyle.first];

    final styler = resolveStyles(context,
        variantStyle: checkBoxLabelStyle,
        size: GSCheckBoxLabelStyle.size[ancestorCheckBoxStyle?.props?.size],
        inlineStyle: style);
    final value = CheckBoxProvider.of(context);
    final isChecked = value?.isChecked ?? false;
    final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
    final isDisabled = value?.isDisabled ?? true;

    final currentTextStyle = styler?.textStyle?.copyWith(
        color: style?.textStyle?.color ??
            _resolveColor(styler,
                isChecked: isChecked,
                isDisabled: isDisabled,
                isHovered: isDisabled ? false : isHovered) ??
            styler.textStyle?.color);

    return Text(
      text,
      style: currentTextStyle,
    );
  }


//resolve this with styleResolver in future
  Color? _resolveColor(GSStyle? styler,
      {bool isChecked = false,
      bool isHovered = false,
      bool isDisabled = false}) {
    if (isHovered && isChecked && isDisabled) {
      return styler?.onHover?.checked?.onDisabled?.color;
    } else if (isHovered && isChecked) {
      return styler?.onHover?.checked?.color;
    } else if (isHovered && isDisabled) {
      return styler?.onHover?.onDisabled?.color;
    } else if (isHovered) {
      return styler?.onHover?.color;
    } else if (isChecked) {
      return styler?.checked?.color;
    } else {
      return styler?.color;
    }
  }
}