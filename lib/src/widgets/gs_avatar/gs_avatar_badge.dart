import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_avatar/gs_avatar_badge_style.dart';

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
avatarBadgeStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().avatarBadge);
    GSStyle styler = resolveStyles(
      context: context,
      styles: [avatarBadgeStyle],
      inlineStyle: style,
      isFirst: true,
    );

    return Container(
      height: style?.height ?? ancestorStyles?.height ?? styler.height,
      width: style?.width ?? ancestorStyles?.height ?? styler.width,
      decoration: BoxDecoration(
        color: styler.bg,
        shape: BoxShape.circle,
        border: Border.all(
            color: styler.borderColor ?? const Color(0xFFFFFFFF),
            width: styler.borderWidth ?? 2),
      ),
    );
  }
}
