import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_fab/gs_fab_label_style.dart';

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
        fontWeight: ancestorStyles?.fontWeight,
        fontSize: ancestorStyles?.textStyle?.fontSize);

    final mergedStyle =
        defaultTextStyle.merge(style != null ? style!.textStyle : null);

    return Text(
      text,
      style: mergedStyle,
    );
  }
}
