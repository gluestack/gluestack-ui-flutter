import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge.dart';
import 'package:gluestack_flutter_pro/token/radii_token.dart';
import 'package:gluestack_flutter_pro/utils/resolver.dart';

// GSStyleConfig for the Badge component | needed for descendantStyle
GSStyleConfig gsBadgeConfig =
    GSStyleConfig(componentName: 'Badge', descendantStyle: ['_text', '_icon']);

// GSStyle representing the base style for the Badge
final GSStyle badgeStyle = GSStyle.fromMap(
    data: badgeData, descendantStyle: gsBadgeConfig.descendantStyle);

// Base style for the Badge
GSStyle baseStyle = GSStyle(
  borderRadius: badgeStyle.borderRadius,
);

// Compound variants for the Badge
GSStyle compoundVariants = GSStyle(
  variants: Variants(
    action: GSAction(
      error: GSStyle(
        // Variant styles for the 'error' action
        variants: Variants(
          variant: GSVariant(
            // Solid variant
            solid: baseStyle
                .merge(badgeStyle.variants?.action?.error)
                .merge(badgeStyle.variants?.variant?.solid),
            // Outline variant
            outline: baseStyle
                .merge(badgeStyle.variants?.action?.error)
                .merge(badgeStyle.variants?.variant?.outline),
          ),
        ),
      ),
      warning: GSStyle(
        // Variant styles for the 'warning' action
        variants: Variants(
          variant: GSVariant(
            solid: baseStyle
                .merge(badgeStyle.variants?.action?.warning)
                .merge(badgeStyle.variants?.variant?.solid),
            outline: baseStyle
                .merge(badgeStyle.variants?.action?.warning)
                .merge(badgeStyle.variants?.variant?.outline),
          ),
        ),
      ),
      success: GSStyle(
        // Variant styles for the 'success' action
        variants: Variants(
          variant: GSVariant(
            solid: baseStyle
                .merge(badgeStyle.variants?.action?.success)
                .merge(badgeStyle.variants?.variant?.solid),
            outline: baseStyle
                .merge(badgeStyle.variants?.action?.success)
                .merge(badgeStyle.variants?.variant?.outline),
          ),
        ),
      ),
      info: GSStyle(
        // Variant styles for the 'info' action
        variants: Variants(
          variant: GSVariant(
            solid: baseStyle
                .merge(badgeStyle.variants?.action?.info)
                .merge(badgeStyle.variants?.variant?.solid),
            outline: baseStyle
                .merge(badgeStyle.variants?.action?.info)
                .merge(badgeStyle.variants?.variant?.outline),
          ),
        ),
      ),
      muted: GSStyle(
        // Variant styles for the 'muted' action
        variants: Variants(
          variant: GSVariant(
            solid: baseStyle
                .merge(badgeStyle.variants?.action?.muted)
                .merge(badgeStyle.variants?.variant?.solid),
            outline: baseStyle
                .merge(badgeStyle.variants?.action?.muted)
                .merge(badgeStyle.variants?.variant?.outline),
          ),
        ),
      ),
    ),
    size: badgeStyle.variants?.size,
  ),
);

// GSBadgeStyle class to define badge styles
class GSBadgeStyle {
  // Map of badge combinations for different actions and variants
  static Map<GSActions, Map<GSVariants, GSStyle>> gsBadgeCombination = {
    GSActions.error: {
      GSVariants.solid:
          compoundVariants.variants!.action!.error!.variants!.variant!.solid!,
      GSVariants.outline:
          compoundVariants.variants!.action!.error!.variants!.variant!.outline!,
    },
    GSActions.warning: {
      GSVariants.solid:
          compoundVariants.variants!.action!.warning!.variants!.variant!.solid!,
      GSVariants.outline: compoundVariants
          .variants!.action!.warning!.variants!.variant!.outline!,
    },
    GSActions.success: {
      GSVariants.solid:
          compoundVariants.variants!.action!.success!.variants!.variant!.solid!,
      GSVariants.outline: compoundVariants
          .variants!.action!.success!.variants!.variant!.outline!,
    },
    GSActions.info: {
      GSVariants.solid:
          compoundVariants.variants!.action!.info!.variants!.variant!.solid!,
      GSVariants.outline:
          compoundVariants.variants!.action!.info!.variants!.variant!.outline!,
    },
    GSActions.muted: {
      GSVariants.solid:
          compoundVariants.variants!.action!.muted!.variants!.variant!.solid!,
      GSVariants.outline:
          compoundVariants.variants!.action!.muted!.variants!.variant!.outline!,
    }
  };

  // Map of badge sizes
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$sm: compoundVariants.variants!.size!.$sm!,
    GSSizes.$md: compoundVariants.variants!.size!.$md!,
    GSSizes.$lg: compoundVariants.variants!.size!.$lg!,
  };

  // Map of descendant styles for different actions and variants
  static Map<GSActions, Map<GSVariants, Map<String, GSStyle?>>>
      badgeDescendantStyles = {
    GSActions.error: {
      GSVariants.solid: mergeStyledMaps(
          styleMap: mergeStyledMaps(
              styleMap: badgeStyle.descendantStyles,
              overrideStyleMap:
                  badgeStyle.variants?.action?.error?.descendantStyles,
              keys: gsBadgeConfig.descendantStyle),
          overrideStyleMap:
              badgeStyle.variants?.variant?.solid?.descendantStyles,
          keys: gsBadgeConfig.descendantStyle),
      GSVariants.outline: mergeStyledMaps(
          styleMap: mergeStyledMaps(
              styleMap: badgeStyle.descendantStyles,
              overrideStyleMap:
                  badgeStyle.variants?.action?.error?.descendantStyles,
              keys: gsBadgeConfig.descendantStyle),
          overrideStyleMap:
              badgeStyle.variants?.variant?.outline?.descendantStyles,
          keys: gsBadgeConfig.descendantStyle),
    },
    GSActions.warning: {
      GSVariants.solid: mergeStyledMaps(
          styleMap: mergeStyledMaps(
              styleMap: badgeStyle.descendantStyles,
              overrideStyleMap:
                  badgeStyle.variants?.action?.warning?.descendantStyles,
              keys: gsBadgeConfig.descendantStyle),
          overrideStyleMap:
              badgeStyle.variants?.variant?.solid?.descendantStyles,
          keys: gsBadgeConfig.descendantStyle),
      GSVariants.outline: mergeStyledMaps(
          styleMap: mergeStyledMaps(
              styleMap: badgeStyle.descendantStyles,
              overrideStyleMap:
                  badgeStyle.variants?.action?.warning?.descendantStyles,
              keys: gsBadgeConfig.descendantStyle),
          overrideStyleMap:
              badgeStyle.variants?.variant?.outline?.descendantStyles,
          keys: gsBadgeConfig.descendantStyle),
    },
    GSActions.success: {
      GSVariants.solid: mergeStyledMaps(
          styleMap: mergeStyledMaps(
              styleMap: badgeStyle.descendantStyles,
              overrideStyleMap:
                  badgeStyle.variants?.action?.success?.descendantStyles,
              keys: gsBadgeConfig.descendantStyle),
          overrideStyleMap:
              badgeStyle.variants?.variant?.solid?.descendantStyles,
          keys: gsBadgeConfig.descendantStyle),
      GSVariants.outline: mergeStyledMaps(
          styleMap: mergeStyledMaps(
              styleMap: badgeStyle.descendantStyles,
              overrideStyleMap:
                  badgeStyle.variants?.action?.success?.descendantStyles,
              keys: gsBadgeConfig.descendantStyle),
          overrideStyleMap:
              badgeStyle.variants?.variant?.outline?.descendantStyles,
          keys: gsBadgeConfig.descendantStyle),
    },
    GSActions.info: {
      GSVariants.solid: mergeStyledMaps(
          styleMap: mergeStyledMaps(
              styleMap: badgeStyle.descendantStyles,
              overrideStyleMap:
                  badgeStyle.variants?.action?.info?.descendantStyles,
              keys: gsBadgeConfig.descendantStyle),
          overrideStyleMap:
              badgeStyle.variants?.variant?.solid?.descendantStyles,
          keys: gsBadgeConfig.descendantStyle),
      GSVariants.outline: mergeStyledMaps(
          styleMap: mergeStyledMaps(
              styleMap: badgeStyle.descendantStyles,
              overrideStyleMap:
                  badgeStyle.variants?.action?.info?.descendantStyles,
              keys: gsBadgeConfig.descendantStyle),
          overrideStyleMap:
              badgeStyle.variants?.variant?.outline?.descendantStyles,
          keys: gsBadgeConfig.descendantStyle),
    },
    GSActions.muted: {
      GSVariants.solid: mergeStyledMaps(
          styleMap: mergeStyledMaps(
              styleMap: badgeStyle.descendantStyles,
              overrideStyleMap:
                  badgeStyle.variants?.action?.muted?.descendantStyles,
              keys: gsBadgeConfig.descendantStyle),
          overrideStyleMap:
              badgeStyle.variants?.variant?.solid?.descendantStyles,
          keys: gsBadgeConfig.descendantStyle),
      GSVariants.outline: mergeStyledMaps(
          styleMap: mergeStyledMaps(
              styleMap: badgeStyle.descendantStyles,
              overrideStyleMap:
                  badgeStyle.variants?.action?.muted?.descendantStyles,
              keys: gsBadgeConfig.descendantStyle),
          overrideStyleMap:
              badgeStyle.variants?.variant?.outline?.descendantStyles,
          keys: gsBadgeConfig.descendantStyle),
    },
  };



  static Map<GSBorderRadius, double> radius = {
    GSBorderRadius.$none: $GSRadii.none,
    GSBorderRadius.$xs: $GSRadii.$xs,
    GSBorderRadius.$sm: $GSRadii.$sm,
    GSBorderRadius.$md: $GSRadii.$md,
    GSBorderRadius.$lg: $GSRadii.$lg,
    GSBorderRadius.$xl: $GSRadii.$xl,
    GSBorderRadius.$2xl:$GSRadii.$2xl,
    GSBorderRadius.$3xl:$GSRadii.$3xl,
    GSBorderRadius.$full:$GSRadii.full,
  };
}
