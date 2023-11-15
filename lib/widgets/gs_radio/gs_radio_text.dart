import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';

import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector_proider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_text_style.dart';

class GSRadioText<T> extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const GSRadioText({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final value = GSRadioProvider.of<T>(context);
    final ancestorTextStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsRadioLabelConfig.ancestorStyle.first];

    final bool isChecked = value!.value == value.groupValue;

    final fontSize =
        GSRadioTextStyle.labelSize[ancestorTextStyles?.props?.size];

    GSStyle styler = resolveStyles2(
        context: context,
        styles: [radioLabelStyle],
        inlineStyle: GSStyle(textStyle: textStyle));

    final fontColor = isChecked ? styler.checked?.color : styler.color;

    final currentHoverColor =
        isChecked ? styler.checked?.onHover?.color : styler.onHover?.color;
    final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
    final currentTextStyle = TextStyle(
      fontSize: textStyle?.fontSize ?? fontSize,
      color: isHovered ? currentHoverColor : textStyle?.color ?? fontColor,
    );

    print(ancestorTextStyles?.props?.size);

    return Opacity(
      opacity: value.isDisabled ? styler.onDisabled!.opacity! : 1,
      child: Text(
        text,
        style: currentTextStyle,
      ),
    );
  }
}
