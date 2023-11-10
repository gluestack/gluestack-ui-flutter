import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';


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
    // final value = GSButtonProvider.of(context);
    final ancestorTextStyles =
        GSAncestorProvider.of(context)?.decedentStyles?['_text'];

    // final textColor = GSButtonStyle
    //         .gsButtonCombination[value?.action]![value?.variant]
    //         ?.textStyle
    //         ?.color ??
    //     buttonTextStyle.color;
    // final fontSize = GSButtonStyle.size[value?.size]?.textStyle?.fontSize;

    var defaultTextStyle = TextStyle(
        color: ancestorTextStyles?.color,
        fontWeight: ancestorTextStyles?.fontWeight);

    final mergedStyle =
        defaultTextStyle.merge(style != null ? style!.textStyle : null);

    return Text(
      text,
      style: mergedStyle,
    );
  }
}
