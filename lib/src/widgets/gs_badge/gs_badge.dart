import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_ui/src/widgets/gs_badge/gs_badge_icon.dart';
import 'package:gluestack_ui/src/widgets/gs_badge/gs_badge_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_badge/gs_badge_style.dart';
import 'package:gluestack_ui/src/widgets/gs_badge/gs_badge_text.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

enum GSBadgeActions {
  error,
  warning,
  success,
  info,
  muted,
}

enum GSBadgeVariants {
  solid,
  outline,
}

enum GSBadgeSizes {
  $sm,
  $md,
  $lg,
}

enum GSBadgeRadius {
  $none,
  $xs,
  $sm,
  $md,
  $lg,
  $xl,
  $2xl,
  $3xl,
  $full,
}

///
/// `GSBadge` is a Flutter widget used to display badges with various styles.
///
class GSBadge extends StatelessWidget {
  /// The type of action for the badge (e.g., error, warning, success, info, muted).
  final GSBadgeActions? action;

  /// The size of the badge (e.g., lg, md, sm).
  final GSBadgeSizes? size;

  /// The border radius for the badge container.
  final GSBadgeRadius? borderRadius;

  /// The variant of the badge (e.g., solid, outline).
  final GSBadgeVariants? variant;

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
  });

  @override
  Widget build(BuildContext context) {
    final badgeAction = action?.toGSAction ?? badgeStyle.props?.action;
    final badgeVariant = variant?.toGSVariant ?? badgeStyle.props?.variant;
    final badgeSize = size?.toGSSize ?? badgeStyle.props?.size;
    final radius = borderRadius?.toGSBorderRadius ?? GSBorderRadius.$none;

    // Resolve the style for the badge.
    GSStyle styler = resolveStyles(
      context: context,
      styles: [
        badgeStyle,
        badgeStyle.actionMap(badgeAction),
        badgeStyle.variantMap(badgeVariant),
        badgeStyle.sizeMap(badgeSize),
        badgeStyle.compoundVariants?[action.toString() + variant.toString()]
      ],
      inlineStyle: style,
      isFirst: true,
    );
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
                GSBadgeStyle.radius[radius] ?? styler.borderRadius ?? 0),
            border: Border.all(
                style: badgeVariant == GSVariants.outline
                    ? BorderStyle.solid
                    : BorderStyle.none,
                color: styler.borderColor ??
                    styler.outlineColor ??
                    const Color(0x00000000) //transparent
                ),
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
