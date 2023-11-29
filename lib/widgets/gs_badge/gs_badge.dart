import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor.dart';
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
  final GSBorderRadius? borderRadius;

  /// The variant of the badge (e.g., solid, outline).
  final GSVariants? variant;

  /// The custom style for the badge.
  final GSStyle? style;

  /// The child widget to be displayed inside the badge.
  final Widget? child;

  /// The optional icon data to be displayed in the badge.
  final GSBadgeIcon? icon;

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
    this.icon,
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
    // // Access the badge provider to retrieve badge style information.
    // final value = GSBadgeProvider.of(context);
    final badgeAction = action ?? badgeStyle.props?.action;
    final badgeVariant = variant ?? badgeStyle.props?.variant;
    final badgeSize = size ?? badgeStyle.props?.size;

    // Resolve the style for the badge.
    GSStyle styler = resolveStyles(context,
        variantStyle: GSBadgeStyle.gsBadgeCombination[badgeAction]
            ?[badgeVariant],
        size: GSBadgeStyle.size[badgeSize],
        inlineStyle: style,
        descendantStyles: GSBadgeStyle.badgeDescendantStyles[action]?[variant],
        descendantStyleKeys: gsBadgeConfig.descendantStyle)!;

    // Return the GSBadge with GSAncestor to handle the decedentStyles
    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: GSBadgeProvider(
        fontSize: styler.textStyle?.fontSize,
        iconSize: styler.iconSize,
        child: Container(
          decoration: BoxDecoration(
            color: style == null ? styler.bg : style!.bg ?? styler.bg,
            borderRadius: BorderRadius.circular(
                GSBadgeStyle.radius[borderRadius] ?? styler.borderRadius ?? 0),
            border: Border.all(
                style: badgeVariant == GSVariants.outline
                    ? BorderStyle.solid
                    : BorderStyle.none,
                color: style == null
                    ? styler.borderColor!
                    : style!.borderColor ?? styler.borderColor!),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                text,
                if (icon != null) ...[
                  const SizedBox(width: 2),
                  icon as Widget,
                ],
              ]),
        ),
      ),
    );
  }
}
