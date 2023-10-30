import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';

import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio_text/gs_radio_text_style.dart';

class GSRadioText<T> extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? hoverColor;
  const GSRadioText(
      {super.key, required this.text, this.textStyle, this.hoverColor});

  @override
  Widget build(BuildContext context) {
    final value = GSRadioProvider.of<T>(context);
    final bool isChecked = value!.value == value.groupValue;
    final fontSize = GSRadioTextStyle.labelSize[value.size];

    GSStyle styler = resolveStyles(
      variantStyle: radioLabelStyle,
      context,
      inlineStyle: value.style,
    )!;


    final fontColor = isChecked ? styler.checked?.color : styler.color;

    final currentHoverColor =
        isChecked ? styler.onHover?.checked?.color : styler.onHover?.color;

    final currentTextStyle = TextStyle(
      fontSize: textStyle?.fontSize ?? fontSize,
      color: value.isHovered
          ? hoverColor ?? currentHoverColor
          : textStyle?.color ?? fontColor,
    );
    return Opacity(
           opacity: value.isDisabled?styler.onDisabled!.opacity! :1,
      child: Text(
        text,
        style: currentTextStyle,
      ),
    );
  }
}
