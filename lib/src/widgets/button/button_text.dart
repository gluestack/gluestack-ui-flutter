import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_ui/src/widgets/button/button_provider.dart';
import 'package:gluestack_ui/src/widgets/button/button_text_style.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final GSStyle? style;

  const ButtonText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final ancestorTextStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsTextConfig.ancestorStyle.first];
    final value = ButtonProvider.of(context);
    final fontSize = GSButtonTextStyle.size[value!.size]?.textStyle?.fontSize;

    var defaultTextStyle = TextStyle(
      color: ancestorTextStyles?.color,
      fontWeight: ancestorTextStyles?.fontWeight,
      fontSize: fontSize,
    );
    final styler = resolveStyles(context, inlineStyle: style);

    final mergedStyle = defaultTextStyle.merge(styler?.textStyle);

    return Text(
      text,
      style: mergedStyle,
    );
  }
}
