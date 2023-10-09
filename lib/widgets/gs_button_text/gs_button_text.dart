import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_attributes.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/style/style_data.dart';
import 'package:provider/provider.dart';

class GSButtonText extends StatelessWidget {
  final String text;
  final StyleData? style;

  const GSButtonText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final value = GSButtonProvider.of(context);
    final theme = Provider.of<ThemeProvider>(context).currentTheme;
    final textColor = GSButtonAttributes
        .gsButtonCombination[value?.action]![value?.variant]![theme]!.textColor;
    final fontSize = GSButtonAttributes.buttonFontSize[value?.size];

    var defaultTextStyle = TextStyle(color: textColor, fontSize: fontSize);

    final mergedStyle =
        defaultTextStyle.merge(style != null ? style!.textStyle : null);

    return Text(
      text,
      style: mergedStyle,
    );
  }
}
