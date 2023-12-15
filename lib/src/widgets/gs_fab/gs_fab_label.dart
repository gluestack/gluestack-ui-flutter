import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/widgets/gs_fab/gs_fab_label_style.dart';

class GSFabLabel extends StatelessWidget {
  final String text;
  final GSStyle? style;

  const GSFabLabel({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[fabLabelConfig.ancestorStyle.first];
   
    
    var defaultTextStyle = TextStyle(
        color: ancestorStyles?.color,
        fontWeight: ancestorStyles?.textStyle?.fontWeight,
        fontSize: ancestorStyles?.textStyle?.fontSize);

    final mergedStyle =
        defaultTextStyle.merge(style != null ? style!.textStyle : null);

    return Text(
      text,
      style: mergedStyle,
    );
  }
}
