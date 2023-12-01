import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_ui/src/widgets/button/button_icon_style.dart';
import 'package:gluestack_ui/src/widgets/button/button_provider.dart';

class GSButtonIcon extends StatelessWidget {
  final IconData icon;
  final GSSizes? iconSize;
  final GSStyle? style;

  const GSButtonIcon({
    super.key,
    required this.icon,
    this.style,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final ancestorIconStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsButtonIconStyle.ancestorStyle.first];
    final value = ButtonProvider.of(context);

    final size = GSButtonIconStyle.size[iconSize ?? value?.size];
    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSStyle(color: ancestorIconStyles?.color),
      inlineStyle: style,
    )!;

    return Icon(
      icon,
      color: styler.color,
      size: size,
    );
  }
}
