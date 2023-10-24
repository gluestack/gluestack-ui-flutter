import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/generated_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_style.dart';

class GSButtonText extends StatelessWidget {
  final String text;
  final GSStyle? style;

  const GSButtonText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final value = GSButtonProvider.of(context);
    final textColor = GSButtonStyle
        .gsButtonCombination[value?.action]![value?.variant]?.textStyle?.color;
    final fontSize = GSButtonStyle.size[value?.size]?.textStyle?.fontSize;

    var defaultTextStyle = TextStyle(color: textColor, fontSize: fontSize);

    final mergedStyle =
        defaultTextStyle.merge(style != null ? style!.textStyle : null);

    return Text(
      text,
      style: mergedStyle,
    );
  }
}
