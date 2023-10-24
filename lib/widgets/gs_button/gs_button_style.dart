import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/generated_style.dart';
import 'package:gluestack_flutter_pro/theme/config/button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';

GSStyle buttonStyle = GSStyle.fromMap(data: buttonData);
GSStyle baseStyle = GSStyle(
  borderRadius: buttonStyle.borderRadius,
  bg: buttonStyle.bg,
  dark: buttonStyle.dark,
);

GSStyle compoundVariants = GSStyle(
  variants: Variants(
    action: GSAction(
      primary: GSStyle(
        variants: Variants(
          variant: GSVariant(
              solid: baseStyle
                  .merge(buttonStyle.variants?.action?.primary)
                  .merge(buttonStyle.variants?.variant?.solid)
                  .merge(
                      GSStyle(textStyle: const TextStyle(color: Colors.white))),
              outline: baseStyle
                  .merge(buttonStyle.variants?.action?.primary)
                  .merge(buttonStyle.variants?.variant?.outline)
                  .merge(GSStyle(
                      textStyle: TextStyle(
                          color: buttonStyle.variants?.action?.primary?.bg))),
              link: baseStyle
                  .merge(buttonStyle.variants?.action?.primary)
                  .merge(buttonStyle.variants?.variant?.link)
                  .merge(buttonStyle.variants?.action?.defaultStyle)
                  .merge(GSStyle(
                      textStyle: TextStyle(
                          color: buttonStyle.variants?.action?.primary?.bg)))),
        ),
      ),
      secondary: GSStyle(
        variants: Variants(
          variant: GSVariant(
              solid: baseStyle
                  .merge(buttonStyle.variants?.action?.secondary)
                  .merge(buttonStyle.variants?.variant?.solid)
                  .merge(
                      GSStyle(textStyle: const TextStyle(color: Colors.white))),
              outline: baseStyle
                  .merge(buttonStyle.variants?.action?.secondary)
                  .merge(buttonStyle.variants?.variant?.outline)
                  .merge(GSStyle(
                      textStyle: TextStyle(
                          color: buttonStyle.variants?.action?.secondary?.bg))),
              link: baseStyle
                  .merge(buttonStyle.variants?.action?.secondary)
                  .merge(buttonStyle.variants?.variant?.link)
                  .merge(buttonStyle.variants?.action?.defaultStyle)
                  .merge(GSStyle(
                      textStyle: TextStyle(
                          color:
                              buttonStyle.variants?.action?.secondary?.bg)))),
        ),
      ),
      positive: GSStyle(
        variants: Variants(
          variant: GSVariant(
              solid: baseStyle
                  .merge(buttonStyle.variants?.action?.positive)
                  .merge(buttonStyle.variants?.variant?.solid)
                  .merge(
                      GSStyle(textStyle: const TextStyle(color: Colors.white))),
              outline: baseStyle
                  .merge(buttonStyle.variants?.action?.positive)
                  .merge(buttonStyle.variants?.variant?.outline)
                  .merge(GSStyle(
                      textStyle: TextStyle(
                          color: buttonStyle.variants?.action?.positive?.bg))),
              link: baseStyle
                  .merge(buttonStyle.variants?.action?.positive)
                  .merge(buttonStyle.variants?.variant?.link)
                  .merge(buttonStyle.variants?.action?.defaultStyle)
                  .merge(GSStyle(
                      textStyle: TextStyle(
                          color: buttonStyle.variants?.action?.positive?.bg)))),
        ),
      ),
      negative: GSStyle(
        variants: Variants(
          variant: GSVariant(
              solid: baseStyle
                  .merge(buttonStyle.variants?.action?.negative)
                  .merge(buttonStyle.variants?.variant?.solid)
                  .merge(
                      GSStyle(textStyle: const TextStyle(color: Colors.white))),
              outline: baseStyle
                  .merge(buttonStyle.variants?.action?.negative)
                  .merge(buttonStyle.variants?.variant?.outline)
                  .merge(GSStyle(
                      textStyle: TextStyle(
                          color: buttonStyle.variants?.action?.negative?.bg))),
              link: baseStyle
                  .merge(buttonStyle.variants?.action?.negative)
                  .merge(buttonStyle.variants?.variant?.link)
                  .merge(buttonStyle.variants?.action?.defaultStyle)
                  .merge(GSStyle(
                      textStyle: TextStyle(
                          color: buttonStyle.variants?.action?.negative?.bg)))),
        ),
      ),
    ),
    size: buttonStyle.variants?.size,
  ),
);

class GSButtonStyle {
  static Map<GSButtonAction, Map<GSButtonVariant, GSStyle>>
      gsButtonCombination = {
    GSButtonAction.primary: {
      GSButtonVariant.solid:
          compoundVariants.variants!.action!.primary!.variants!.variant!.solid!,
      GSButtonVariant.outline: compoundVariants
          .variants!.action!.primary!.variants!.variant!.outline!,
      GSButtonVariant.link:
          compoundVariants.variants!.action!.primary!.variants!.variant!.link!
    },
    GSButtonAction.secondary: {
      GSButtonVariant.solid: compoundVariants
          .variants!.action!.secondary!.variants!.variant!.solid!,
      GSButtonVariant.outline: compoundVariants
          .variants!.action!.secondary!.variants!.variant!.outline!,
      GSButtonVariant.link:
          compoundVariants.variants!.action!.secondary!.variants!.variant!.link!
    },
    GSButtonAction.positive: {
      GSButtonVariant.solid: compoundVariants
          .variants!.action!.positive!.variants!.variant!.solid!,
      GSButtonVariant.outline: compoundVariants
          .variants!.action!.positive!.variants!.variant!.outline!,
      GSButtonVariant.link:
          compoundVariants.variants!.action!.positive!.variants!.variant!.link!
    },
    GSButtonAction.negative: {
      GSButtonVariant.solid: compoundVariants
          .variants!.action!.negative!.variants!.variant!.solid!,
      GSButtonVariant.outline: compoundVariants
          .variants!.action!.negative!.variants!.variant!.outline!,
      GSButtonVariant.link:
          compoundVariants.variants!.action!.negative!.variants!.variant!.link!
    },
  };

  static Map<GSButtonSize, GSStyle> size = {
    GSButtonSize.xs: compoundVariants.variants!.size!.xs!,
    GSButtonSize.sm: compoundVariants.variants!.size!.sm!,
    GSButtonSize.md: compoundVariants.variants!.size!.md!,
    GSButtonSize.lg: compoundVariants.variants!.size!.lg!,
  };
}
