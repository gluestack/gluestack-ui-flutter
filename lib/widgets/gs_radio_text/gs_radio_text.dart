import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/style_data.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_attributes.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_token.dart';
import 'package:provider/provider.dart';

class GSRadioText extends StatelessWidget {
  final String text;
  final StyleData? style;
  const GSRadioText({super.key, this.style, required this.text});

  @override
  Widget build(BuildContext context) {
    final value = GSRadioProvider.of(context);
    final theme = Provider.of<ThemeProvider>(context).currentTheme;
    final textColor = GSRadioAttributes.gsInputCombination[theme]!.labelColor;
    final fontSize = GSRadioToken.radioSize[value?.size];
    var defaultTextStyle = TextStyle(fontSize: fontSize, color: textColor);
    final mergedStyle =
        defaultTextStyle.merge(style != null ? style!.textStyle : null);
    return Text(
      text,
      style: mergedStyle,
    );
  }
}
