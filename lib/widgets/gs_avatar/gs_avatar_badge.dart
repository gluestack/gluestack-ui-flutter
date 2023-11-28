import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_badge_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/avatar_style_2.dart';

class GSAvatarBadge extends StatelessWidget {
  final GSStyle? style;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  const GSAvatarBadge(
      {super.key, this.style, this.left, this.right, this.top, this.bottom});

  @override
  Widget build(BuildContext context) {
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsAvatarBadgeStyle.ancestorStyle.first];

    GSStyle styler = resolveStyles(
      context,
      variantStyle: avatarBadgeStyle,
      inlineStyle: style,
    )!;

    return Container(
      height: style?.height ?? ancestorStyles?.height ?? styler.height,
      width: style?.width ?? ancestorStyles?.height ?? styler.width,
      decoration: BoxDecoration(
        color: styler.bg,
        shape: BoxShape.circle,
        border: Border.all(
            color: styler.borderColor ?? Colors.white,
            width: styler.borderWidth ?? 2),
      ),
    );
  }
}
