import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_toast/gs_toast_description_style.dart';

class GSToastDescription extends StatelessWidget {
  final String description;
  final GSStyle? style;
  const GSToastDescription({super.key, required this.description, this.style});

  @override
  Widget build(BuildContext context) {
    final ancestorTextStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gstoastDescriptionConfig.ancestorStyle.first];
    final fontSize = GSToastDescriptionStyle
        .size[toastDescriptionStyle.props?.size]?.textStyle?.fontSize;

    final color = toastDescriptionStyle.color;

    var defaultTextStyle = ancestorTextStyles?.textStyle
        ?.merge(TextStyle(color: color, fontSize: fontSize));

    final mergedStyle =
        defaultTextStyle?.merge(style != null ? style!.textStyle : null);
    return Text(
      description,
      style: mergedStyle,
    );
  }
}
