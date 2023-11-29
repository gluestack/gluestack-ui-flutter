import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text_style.dart';

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
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsTextConfig.ancestorStyle.first];

    final styler = resolveStyles2(
        context: context,
        styles: [
          buttonTextStyle,
          buttonTextStyle.sizeMap(ancestorStyles?.props?.size),
          ancestorStyles,
        ],
        inlineStyle: style,
        isFrist: true);

    var defaultTextStyle = TextStyle(
        color: styler.color,
        fontWeight: styler.fontWeight,
        fontSize: styler.fontSize,
        decoration: styler.textDecoration,
        height: styler.lineHeight);

    return Text(
      text,
      style: defaultTextStyle,
    );
  }
}
