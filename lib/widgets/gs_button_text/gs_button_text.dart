import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_attributes.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';

class GSButtonText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const GSButtonText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final value = GSButtonProvider.of(context);

    final textColor = GSButtonAttributes
        .gsButtonCombination[value?.action]![value?.variant]!.textColor;
    final fontSize = GSButtonAttributes.buttonFontSize[value?.size];

    var defaultTextStyle = TextStyle(color: textColor, fontSize: fontSize);

    final mergedStyle = defaultTextStyle.merge(style);

    return Text(
      text,
      style: mergedStyle,
    );
  }
}
