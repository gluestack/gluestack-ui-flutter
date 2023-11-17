import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_badge_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_provider.dart';
import 'package:provider/provider.dart';

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
    GSStyle styler = resolveStyles(
      context,
      variantStyle: avatarBadgeStyle,
      inlineStyle: style,
    )!;
    GSStyle value = GSAvatarProvider.of(context)!.avatarStyle;

    return Container(
      height: style?.height ?? value.badgeHeight ?? styler.height,
      width: style?.width ?? value.badgeWidth ?? styler.width,
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
