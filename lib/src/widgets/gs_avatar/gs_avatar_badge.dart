import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
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

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [avatarBadgeStyle],
      inlineStyle: style,
      isFirst: true,
    );

    return Container(
      height: style?.height ?? ancestorStyles?.height ?? styler.height,
      width: style?.width ?? ancestorStyles?.height ?? styler.width,
      decoration: BoxDecoration(
        color: styler.bg?.getColor(context),
        shape: BoxShape.circle,
        border: Border.all(
            color: styler.borderColor?.getColor(context) ??
                const Color(0xFFFFFFFF),
            width: styler.borderWidth ?? 2),
      ),
    );
  }
}
