import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge_icon.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge_text.dart';
import 'package:gluestack_flutter_pro/token/font_size_token.dart';

final GSStyle badgeStyle = GSStyle.fromMap(data: badgeData);
final GSStyle badgeIconStyle = GSStyle.fromMap(data: badgeIconData);
final GSStyle badgeTextStyle = GSStyle.fromMap(data: badgeTextData);

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

  //TODO: fix this?
  static Map<GSSizes, double?> textSize = {
    GSSizes.$xs: $GSFontSize.$xs,
    GSSizes.$sm: $GSFontSize.$sm,
    GSSizes.$md: $GSFontSize.$md,
    GSSizes.$lg: $GSFontSize.$lg,
    GSSizes.$xl: $GSFontSize.$xl,
  };
}
