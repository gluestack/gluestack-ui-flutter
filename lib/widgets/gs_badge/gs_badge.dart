import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_text.dart';

/// `GSBadge` is a Flutter widget used to display badges with various styles.
class GSBadge extends StatelessWidget {
  /// The type of action for the badge (e.g., error, warning, success, info, muted).
  final GSActions? action;

  /// The size of the badge (e.g., lg, md, sm).
  final GSSizes? size;

  /// The border radius for the badge container.
  final double? borderRadius;

  /// The variant of the badge (e.g., solid, outline).
  final GSVariants? variant;

  /// The custom style for the badge.
  final GSStyle? style;

  /// The child widget to be displayed inside the badge.
  final Widget? child;

  /// The optional icon data to be displayed in the badge.
  final IconData? iconData;

  /// The text content to be displayed within the badge.
  final GSBadgeText text;

  /// `GSBadge` is a Flutter widget used to display badges with various styles. Constructor for the `GSBadge` widget:
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
    // Access the badge provider to retrieve badge style information.
    final value = GSBadgeProvider.of(context);
    final badgeAction = action ?? badgeStyle.props?.action;
    final badgeVariant = variant ?? badgeStyle.props?.variant;
    final badgeSize = size ?? value?.size ?? badgeStyle.props?.size;

    // Resolve the style for the badge.
    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSBadgeStyle.gsBadgeCombination[badgeAction]![badgeVariant],
      size: GSBadgeStyle.size[badgeSize],
      inlineStyle: style,
    )!;
//for testing purpose | TODO: Remove before reaching production level
    print('----------');
    print(styler.variants?.action?.warning?.bg);
    print('+++++ ${styler.bg}');

    return GSBadgeProvider(
      action: badgeAction!,
      size: badgeSize!,
      iconAndTextColor: resolveIconAndTextColor(badgeAction),
      child: Container(
        decoration: resolveBadgeDecoration(badgeAction, badgeVariant!).copyWith(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            color: style != null ? styler.bg : null),
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

  // Resolve the badge's decoration based on the action and variant provided.
  BoxDecoration resolveBadgeDecoration(
      GSActions badgeAction, GSVariants badgeVariant) {
    // Helper function to create a border.
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
    } else if (badgeAction == GSActions.muted) {
      return BoxDecoration(
        color: badgeStyle.variants?.action?.muted?.bg,
        border: borderHelper(
            borderColor: badgeStyle.variants!.action!.muted!.borderColor!),
      );
    } else {
      //info
      return BoxDecoration(
        color: badgeStyle.variants?.action?.info?.bg,
        border: borderHelper(
            borderColor: badgeStyle.variants!.action!.info!.borderColor!),
      );
    }
  }

  // Resolve the icon and text color based on the badge action provided.
  resolveIconAndTextColor(GSActions badgeAction) {
    if (badgeAction == GSActions.error) {
      return badgeStyle.variants?.action?.error?.textStyle?.color;
    } else if (badgeAction == GSActions.warning) {
      return badgeStyle.variants?.action?.warning?.textStyle?.color;
    } else if (badgeAction == GSActions.success) {
      return badgeStyle.variants?.action?.success?.textStyle?.color;
    } else if (badgeAction == GSActions.muted) {
      return badgeStyle.variants?.action?.muted?.textStyle?.color;
    } else {
      //info
      return badgeStyle.variants?.action?.info?.textStyle?.color;
    }
  }
}
