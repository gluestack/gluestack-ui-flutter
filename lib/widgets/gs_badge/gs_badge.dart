import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_text.dart';

class GSBadge extends StatelessWidget {
  final GSActions? action;
  final GSSizes? size;
  final double? borderRadius;
  final GSVariants? variant;
  final GSStyle? style;
  final Widget? child;
  final IconData? iconData;
  final GSBadgeText text;

  const GSBadge({
    super.key,
    this.action,
    this.variant,
    this.size,
    this.child,
    this.style,
    this.iconData,
    required this.text,
    this.borderRadius,
  })  : assert(
          action == null ||
              action == GSActions.error ||
              action == GSActions.warning ||
              action == GSActions.success ||
              action == GSActions.info ||
              action == GSActions.muted,
          'Badges can only have the types: error, warning, success, info and muted!\n'
          'To resolve this error, ensure only the above mentioned GSActions is specified.',
        ),
        assert(
          size == null ||
              size == GSSizes.$lg ||
              size == GSSizes.$md ||
              size == GSSizes.$sm,
          'Badges can only have the sizes: \$lg, \$md and \$sm\n'
          'To resolve this error, ensure only the above mentioned GSSizes is specified.',
        ),
        assert(
          variant == null ||
              variant == GSVariants.outline ||
              variant == GSVariants.solid,
          'Badges can only have the vairants: solid and outline\n'
          'To resolve this error, ensure only the above mentioned GSVariants is specified.',
        );

  @override
  Widget build(BuildContext context) {
    final value = GSBadgeProvider.of(context);
    final badgeAction = action ?? badgeStyle.props?.action;
    final badgeVariant = variant ?? badgeStyle.props?.variant;
    final badgeSize = size ?? value?.size ?? badgeStyle.props?.size;

    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSBadgeStyle.gsBadgeCombination[badgeAction]![badgeVariant],
      size: GSBadgeStyle.size[badgeSize],
      inlineStyle: style,
    )!;
    print('----------');
    print(styler.variants?.action?.warning?.bg);

    return GSBadgeProvider(
      action: badgeAction!,
      size: badgeSize!,
      iconAndTextColor: resolveIconAndTextColor(badgeAction),
      child: Container(
        decoration: resolveBadgeDecoration(badgeAction, badgeVariant!).copyWith(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              text,
              if (iconData != null) ...[
                const SizedBox(width: 2),
                GSBadgeIcon(
                  iconData: iconData!,
                )
              ],
            ]),
      ),
    );
  }

  BoxDecoration resolveBadgeDecoration(
      GSActions badgeAction, GSVariants badgeVariant) {
    BoxBorder borderHelper({required Color borderColor}) {
      if (badgeVariant == GSVariants.outline) {
        return Border.all(
            style: BorderStyle.solid, width: 1, color: borderColor);
      } else {
        return Border.all(style: BorderStyle.none);
      }
    }

    if (badgeAction == GSActions.error) {
      return BoxDecoration(
        color: badgeStyle.variants?.action?.error?.bg,
        border: borderHelper(
            borderColor: badgeStyle.variants!.action!.error!.borderColor!),
      );
    } else if (badgeAction == GSActions.warning) {
      return BoxDecoration(
        color: badgeStyle.variants?.action?.warning?.bg,
        border: borderHelper(
            borderColor: badgeStyle.variants!.action!.warning!.borderColor!),
      );
    } else if (badgeAction == GSActions.success) {
      return BoxDecoration(
        color: badgeStyle.variants?.action?.success?.bg,
        border: borderHelper(
            borderColor: badgeStyle.variants!.action!.success!.borderColor!),
      );
    } else if (badgeAction == GSActions.info) {
      return BoxDecoration(
        color: badgeStyle.variants?.action?.info?.bg,
        border: borderHelper(
            borderColor: badgeStyle.variants!.action!.info!.borderColor!),
      );
    } else {
      //muted
      return BoxDecoration(
        color: badgeStyle.variants?.action?.muted?.bg,
        border: borderHelper(
            borderColor: badgeStyle.variants!.action!.muted!.borderColor!),
      );
    }
  }

  resolveIconAndTextColor(GSActions badgeAction) {
    if (badgeAction == GSActions.error) {
      return badgeStyle.variants?.action?.error?.textStyle?.color;
    } else if (badgeAction == GSActions.warning) {
      return badgeStyle.variants?.action?.warning?.textStyle?.color;
    } else if (badgeAction == GSActions.success) {
      return badgeStyle.variants?.action?.success?.textStyle?.color;
    } else if (badgeAction == GSActions.info) {
      return badgeStyle.variants?.action?.info?.textStyle?.color;
    } else {
      //muted
      return badgeStyle.variants?.action?.muted?.textStyle?.color;
    }
  }
}
