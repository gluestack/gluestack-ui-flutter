import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_icon_style.dart';


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

    final size =
        GSButtonIconStyle.size[iconSize ?? ancestorIconStyles?.props?.size];
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
