import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';

import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_focusableActionDetector/gs_focusable_action_detector_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_radio/gs_radio_text_style.dart';

class GSRadioText<T> extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const GSRadioText({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final value = GSRadioProvider.of<T>(context);
    final ancestorTextStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsRadioTextConfig.ancestorStyle.first];

    final bool isChecked = value!.value == value.groupValue;

    final fontSize = GSRadioTextStyle
        .size[ancestorTextStyles?.props?.size]?.textStyle?.fontSize;


    GSStyle styler = resolveStyles(
      variantStyle: radioLabelStyle,
      context,
      inlineStyle: value.style,
    )!;

    final fontColor = isChecked ? styler.checked?.color : styler.color;

    final currentHoverColor =
        isChecked ? styler.checked?.onHover?.color : styler.onHover?.color;
    final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
    final currentTextStyle = TextStyle(
      fontSize: textStyle?.fontSize ?? fontSize,
      color: isHovered ? currentHoverColor : textStyle?.color ?? fontColor,
    );

    return Opacity(
      opacity: value.isDisabled ? styler.onDisabled!.opacity! : 1,
      child: Text(
        text,
        style: currentTextStyle,
      ),
    );
  }
}
