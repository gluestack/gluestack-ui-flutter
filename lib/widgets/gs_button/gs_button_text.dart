import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
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
    final ancestorTextStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsTextConfig.ancestorStyle.first];
    final value = GSButtonProvider.of(context);
    final fontSize = GSButtonTextStyle.size[value!.size]?.textStyle?.fontSize;

    var defaultTextStyle = TextStyle(
      color: ancestorTextStyles?.color,
      fontWeight: ancestorTextStyles?.fontWeight,
      fontSize: fontSize,
    );

    final mergedStyle =
        defaultTextStyle.merge(style != null ? style!.textStyle : null);

    return Text(
      text,
      style: mergedStyle,
    );
  }
}
