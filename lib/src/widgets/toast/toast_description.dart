import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_ui/src/widgets/toast/toast_description_style.dart';

class ToastDescription extends StatelessWidget {
  final String description;
  final GSStyle? style;
  const ToastDescription({super.key, required this.description, this.style});

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
