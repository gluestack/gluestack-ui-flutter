import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_fab/gs_fab_icon_style.dart';

class GSFabIcon extends StatelessWidget {
  final IconData icon;
  final GSStyle? style;
  const GSFabIcon({
    super.key,
    required this.icon,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsfabIconConfig.ancestorStyle.first];

    final size = GSFabIconStyle.size[ancestorStyles?.props?.size];

    GSStyle styler = resolveStyles(
      context,
      variantStyle: fabIconStyle.merge(ancestorStyles),
      size: size,
      inlineStyle: style,
    )!;

    return Icon(
      icon,
      color: styler.color,
      size: styler.height,
    );
  }
}
