import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_label_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector_proider.dart';

class GSCheckBoxLabel extends StatelessWidget {
  final String text;
  const GSCheckBoxLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ancestorCheckBoxStyle = GSAncestorProvider.of(context)
        ?.decedentStyles?[checkBoxLabelConfig.ancestorStyle.first];

    final styler = resolveStyles(context,
        variantStyle: checkBoxLabelStyle,
        size: GSCheckBoxLabelStyle.size[ancestorCheckBoxStyle?.props?.size]);
    final value = GSCheckBoxProvider.of(context);
    final isChecked = value?.value ?? false;
    final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
    final isDisabled = value?.isDisabled ?? true;

    final currentTextStyle = styler?.textStyle?.copyWith(
        color: _resolveColor(styler,
                isChecked: isChecked,
                isDisabled: isDisabled,
                isHovered: isHovered) ??
            styler.textStyle?.color);


    return Text(
      text,
      style: currentTextStyle,
    );
  }

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