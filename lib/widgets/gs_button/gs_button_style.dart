import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/button/button.dart';
import 'package:gluestack_flutter_pro/utils/resolver.dart';

GSStyleConfig gsButtonConfig = GSStyleConfig(
    componentName: 'Button',
    descendantStyle: ['_text', '_spinner', '_icon'],
    ancestorStyle: ['_button']);

GSStyle buttonStyle = GSStyle.fromMap(
    data: buttonData, descendantStyle: gsButtonConfig.descendantStyle);

GSStyle baseStyle = GSStyle(
  borderRadius: buttonStyle.borderRadius,
  bg: buttonStyle.bg,
  dark: buttonStyle.dark,
  opacity: buttonStyle.onDisabled?.opacity,
);

// List<String> descendant = ['_text', '_icon', '_spinner'];

GSStyle compoundVariants = GSStyle(
  variants: Variants(
    action: GSAction(
      primary: GSStyle(
        variants: Variants(
          variant: GSVariant(
            solid: baseStyle
                .merge(buttonStyle.variants?.action?.primary)
                .merge(buttonStyle.variants?.variant?.solid)
                .merge(GSStyle(
                  textStyle: TextStyle(color: buttonStyle.textStyle?.color),
                  iconColor: buttonStyle.iconColor,
                  spinnerColor: buttonStyle.spinnerColor,
                )),
            outline: baseStyle
                .merge(buttonStyle.variants?.action?.primary)
                .merge(buttonStyle.variants?.variant?.outline),
            link: baseStyle
                .merge(buttonStyle.variants?.action?.primary)
                .merge(buttonStyle.variants?.variant?.link)
                .merge(buttonStyle.variants?.action?.defaultStyle),
          ),
        ),
      ),
      secondary: GSStyle(
        variants: Variants(
          variant: GSVariant(
            solid: baseStyle
                .merge(buttonStyle.variants?.action?.secondary)
                .merge(buttonStyle.variants?.variant?.solid)
                .merge(GSStyle(
                  textStyle: TextStyle(color: buttonStyle.textStyle?.color),
                  iconColor: buttonStyle.iconColor,
                  spinnerColor: buttonStyle.spinnerColor,
                )),
            outline: baseStyle
                .merge(buttonStyle.variants?.action?.secondary)
                .merge(buttonStyle.variants?.variant?.outline),
            link: baseStyle
                .merge(buttonStyle.variants?.action?.secondary)
                .merge(buttonStyle.variants?.variant?.link)
                .merge(buttonStyle.variants?.action?.defaultStyle),
          ),
        ),
      ),
      positive: GSStyle(
        variants: Variants(
          variant: GSVariant(
            solid: baseStyle
                .merge(buttonStyle.variants?.action?.positive)
                .merge(buttonStyle.variants?.variant?.solid)
                .merge(GSStyle(
                  textStyle: TextStyle(color: buttonStyle.textStyle?.color),
                  iconColor: buttonStyle.iconColor,
                  spinnerColor: buttonStyle.spinnerColor,
                )),
            outline: baseStyle
                .merge(buttonStyle.variants?.action?.positive)
                .merge(buttonStyle.variants?.variant?.outline),
            link: baseStyle
                .merge(buttonStyle.variants?.action?.positive)
                .merge(buttonStyle.variants?.variant?.link)
                .merge(buttonStyle.variants?.action?.defaultStyle),
          ),
        ),
      ),
      negative: GSStyle(
        variants: Variants(
          variant: GSVariant(
            solid: baseStyle
                .merge(buttonStyle.variants?.action?.negative)
                .merge(buttonStyle.variants?.variant?.solid)
                .merge(GSStyle(
                  textStyle: TextStyle(color: buttonStyle.textStyle?.color),
                  iconColor: buttonStyle.iconColor,
                  spinnerColor: buttonStyle.spinnerColor,
                )),
            outline: baseStyle
                .merge(buttonStyle.variants?.action?.negative)
                .merge(buttonStyle.variants?.variant?.outline),
            link: baseStyle
                .merge(buttonStyle.variants?.action?.negative)
                .merge(buttonStyle.variants?.variant?.link)
                .merge(buttonStyle.variants?.action?.defaultStyle),
          ),
        ),
      ),
    ),
    size: buttonStyle.variants?.size,
  ),
);

class GSButtonStyle {
  static Map<GSActions, Map<GSVariants, GSStyle>> gsButtonCombination = {
    GSActions.primary: {
      GSVariants.solid:
          compoundVariants.variants!.action!.primary!.variants!.variant!.solid!,
      GSVariants.outline: compoundVariants
          .variants!.action!.primary!.variants!.variant!.outline!,
      GSVariants.link:
          compoundVariants.variants!.action!.primary!.variants!.variant!.link!
    },
    GSActions.secondary: {
      GSVariants.solid: compoundVariants
          .variants!.action!.secondary!.variants!.variant!.solid!,
      GSVariants.outline: compoundVariants
          .variants!.action!.secondary!.variants!.variant!.outline!,
      GSVariants.link:
          compoundVariants.variants!.action!.secondary!.variants!.variant!.link!
    },
    GSActions.positive: {
      GSVariants.solid: compoundVariants
          .variants!.action!.positive!.variants!.variant!.solid!,
      GSVariants.outline: compoundVariants
          .variants!.action!.positive!.variants!.variant!.outline!,
      GSVariants.link:
          compoundVariants.variants!.action!.positive!.variants!.variant!.link!
    },
    GSActions.negative: {
      GSVariants.solid: compoundVariants
          .variants!.action!.negative!.variants!.variant!.solid!,
      GSVariants.outline: compoundVariants
          .variants!.action!.negative!.variants!.variant!.outline!,
      GSVariants.link:
          compoundVariants.variants!.action!.negative!.variants!.variant!.link!
    },
  };

  static Map<GSSizes, GSStyle> size = {
    GSSizes.$xs: compoundVariants.variants!.size!.$xs!,
    GSSizes.$sm: compoundVariants.variants!.size!.$sm!,
    GSSizes.$md: compoundVariants.variants!.size!.$md!,
    GSSizes.$lg: compoundVariants.variants!.size!.$lg!,
  };

  static Map<GSActions, Map<GSVariants, Map<String, GSStyle?>>>
      buttonDescendantStyles = {
    GSActions.primary: {
      GSVariants.solid: mergeStyledMaps(
          map1: mergeStyledMaps(
              map1: buttonStyle.descendantStyles,
              map2: buttonStyle.variants?.action?.primary?.descendantStyles,
              keys: gsButtonConfig.descendantStyle),
          map2: buttonStyle.variants?.variant?.solid?.descendantStyles,
          keys: gsButtonConfig.descendantStyle),
      GSVariants.outline: mergeStyledMaps(
          map1: mergeStyledMaps(
              map1: buttonStyle.descendantStyles,
              map2: buttonStyle.variants?.action?.primary?.descendantStyles,
              keys: gsButtonConfig.descendantStyle),
          map2: buttonStyle.variants?.variant?.outline?.descendantStyles,
          keys: gsButtonConfig.descendantStyle),
      GSVariants.link: mergeStyledMaps(
          map1: mergeStyledMaps(
              map1: buttonStyle.descendantStyles,
              map2: buttonStyle.variants?.action?.primary?.descendantStyles,
              keys: gsButtonConfig.descendantStyle),
          map2: buttonStyle.variants?.variant?.link?.descendantStyles,
          keys: gsButtonConfig.descendantStyle),
    },
    GSActions.secondary: {
      GSVariants.solid: mergeStyledMaps(
          map1: mergeStyledMaps(
              map1: buttonStyle.descendantStyles,
              map2: buttonStyle.variants?.action?.secondary?.descendantStyles,
              keys: gsButtonConfig.descendantStyle),
          map2: buttonStyle.variants?.variant?.solid?.descendantStyles,
          keys: gsButtonConfig.descendantStyle),
      GSVariants.outline: mergeStyledMaps(
          map1: mergeStyledMaps(
              map1: buttonStyle.descendantStyles,
              map2: buttonStyle.variants?.action?.secondary?.descendantStyles,
              keys: gsButtonConfig.descendantStyle),
          map2: buttonStyle.variants?.variant?.outline?.descendantStyles,
          keys: gsButtonConfig.descendantStyle),
      GSVariants.link: mergeStyledMaps(
          map1: mergeStyledMaps(
              map1: buttonStyle.descendantStyles,
              map2: buttonStyle.variants?.action?.secondary?.descendantStyles,
              keys: gsButtonConfig.descendantStyle),
          map2: buttonStyle.variants?.variant?.link?.descendantStyles,
          keys: gsButtonConfig.descendantStyle),
    },
    GSActions.positive: {
      GSVariants.solid: mergeStyledMaps(
          map1: mergeStyledMaps(
              map1: buttonStyle.descendantStyles,
              map2: buttonStyle.variants?.action?.positive?.descendantStyles,
              keys: gsButtonConfig.descendantStyle),
          map2: buttonStyle.variants?.variant?.solid?.descendantStyles,
          keys: gsButtonConfig.descendantStyle),
      GSVariants.outline: mergeStyledMaps(
          map1: mergeStyledMaps(
              map1: buttonStyle.descendantStyles,
              map2: buttonStyle.variants?.action?.positive?.descendantStyles,
              keys: gsButtonConfig.descendantStyle),
          map2: buttonStyle.variants?.variant?.outline?.descendantStyles,
          keys: gsButtonConfig.descendantStyle),
      GSVariants.link: mergeStyledMaps(
          map1: mergeStyledMaps(
              map1: buttonStyle.descendantStyles,
              map2: buttonStyle.variants?.action?.positive?.descendantStyles,
              keys: gsButtonConfig.descendantStyle),
          map2: buttonStyle.variants?.variant?.link?.descendantStyles,
          keys: gsButtonConfig.descendantStyle),
    },
    GSActions.negative: {
      GSVariants.solid: mergeStyledMaps(
          map1: mergeStyledMaps(
              map1: buttonStyle.descendantStyles,
              map2: buttonStyle.variants?.action?.negative?.descendantStyles,
              keys: gsButtonConfig.descendantStyle),
          map2: buttonStyle.variants?.variant?.solid?.descendantStyles,
          keys: gsButtonConfig.descendantStyle),
      GSVariants.outline: mergeStyledMaps(
          map1: mergeStyledMaps(
              map1: buttonStyle.descendantStyles,
              map2: buttonStyle.variants?.action?.negative?.descendantStyles,
              keys: gsButtonConfig.descendantStyle),
          map2: buttonStyle.variants?.variant?.outline?.descendantStyles,
          keys: gsButtonConfig.descendantStyle),
      GSVariants.link: mergeStyledMaps(
          map1: mergeStyledMaps(
              map1: buttonStyle.descendantStyles,
              map2: buttonStyle.variants?.action?.negative?.descendantStyles,
              keys: gsButtonConfig.descendantStyle),
          map2: buttonStyle.variants?.variant?.link?.descendantStyles,
          keys: gsButtonConfig.descendantStyle),
    },
  };
}
