import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_icon_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_style.dart';

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
    final value = GSButtonProvider.of(context);
    final ancestorTextStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsButtonIconStyle.ancestorStyle.first];

    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSStyle(iconColor: ancestorTextStyles?.color),
      size: GSButtonStyle
          .size[iconSize ?? value?.size ?? buttonIconStyle.props?.size],
      inlineStyle: style,
    )!;

    return Icon(
      icon,
      color: styler.iconColor,
      size: styler.iconSize,
    );
  }
}
