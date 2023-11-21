import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge.dart';
import 'package:gluestack_flutter_pro/token/font_size_token.dart';
import 'package:gluestack_flutter_pro/utils/resolver.dart';

GSStyleConfig gsBadgeConfig =
    GSStyleConfig(componentName: 'Badge', descendantStyle: ['_text', '_icon']);

final GSStyle badgeStyle = GSStyle.fromMap(
    data: badgeData, descendantStyle: gsBadgeConfig.descendantStyle);

GSStyle baseStyle = GSStyle(
  borderRadius: badgeStyle.borderRadius,
);

GSStyle compoundVariants = GSStyle(
  variants: Variants(
    action: GSAction(
      error: GSStyle(
        variants: Variants(
          variant: GSVariant(
            solid: baseStyle
                .merge(badgeStyle.variants?.action?.error)
                .merge(badgeStyle.variants?.variant?.solid),
            outline: baseStyle
                .merge(badgeStyle.variants?.action?.error)
                .merge(badgeStyle.variants?.variant?.outline),
          ),
        ),
      ),
      warning: GSStyle(
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

class GSBadgeStyle {
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

  static Map<GSSizes, GSStyle> size = {
    GSSizes.$sm: compoundVariants.variants!.size!.$sm!,
    GSSizes.$md: compoundVariants.variants!.size!.$md!,
    GSSizes.$lg: compoundVariants.variants!.size!.$lg!,
  };

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
}
