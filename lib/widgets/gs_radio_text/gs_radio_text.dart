import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_style.dart';

class GSRadioText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const GSRadioText({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final value = GSRadioProvider.of(context);
    final TextStyle? gsTextStyle =
        GSRadioStyle.gsRadioStyle[value?.size]?.textStyle;

    final currentTextStyle = TextStyle(
      fontSize: textStyle?.fontSize ?? gsTextStyle?.fontSize,
      color: textStyle?.color ?? gsTextStyle?.color,
    );
    return Text(
      text,
      style: currentTextStyle,
    );
  }
}
