import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/generated_style.dart';
import 'package:gluestack_flutter_pro/style/style_data.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';

GSGeneratedStyle buttonStyle = GSGeneratedStyle(
  variants: Variants(
    action: GSAction(
      primary: GSGeneratedStyle(
        variants: Variants(
          variant: GSVariant(
            solid: GSGeneratedStyle(
              color: $GSColors.primary500,
              borderColor: $GSColors.primary300,
              textStyle: const TextStyle(color: $GSColors.white),
              dark: GSGeneratedStyle(
                color: $GSColors.primary800,
                borderColor: $GSColors.primary800,
                textStyle: const TextStyle(color: $GSColors.white),
              ),
            ),
            outline: GSGeneratedStyle(
              color: Colors.transparent,
              borderColor: $GSColors.primary500,
              textStyle: const TextStyle(color: $GSColors.primary500),
              dark: GSGeneratedStyle(
                color: Colors.transparent,
                borderColor: $GSColors.primary800,
                textStyle: const TextStyle(color: $GSColors.primary800),
              ),
            ),
            link: GSGeneratedStyle(
              color: Colors.transparent,
              borderColor: Colors.transparent,
              padding: const EdgeInsets.all($GSSpace.$0),
              textStyle: const TextStyle(color: $GSColors.primary500),
              dark: GSGeneratedStyle(
                color: Colors.transparent,
                borderColor: Colors.transparent,
                textStyle: const TextStyle(color: $GSColors.primary800),
                padding: const EdgeInsets.all($GSSpace.$0),
              ),
            ),
          ),
        ),
      ),
      secondary: GSGeneratedStyle(
        variants: Variants(
          variant: GSVariant(
            solid: GSGeneratedStyle(
              color: $GSColors.secondary500,
              borderColor: $GSColors.secondary300,
              textStyle: const TextStyle(color: $GSColors.white),
              dark: GSGeneratedStyle(
                color: $GSColors.secondary800,
                borderColor: $GSColors.secondary800,
                textStyle: const TextStyle(color: $GSColors.white),
              ),
            ),
            outline: GSGeneratedStyle(
              color: Colors.transparent,
              borderColor: $GSColors.secondary500,
              textStyle: const TextStyle(color: $GSColors.secondary500),
              dark: GSGeneratedStyle(
                color: Colors.transparent,
                borderColor: $GSColors.secondary800,
                textStyle: const TextStyle(color: $GSColors.secondary800),
              ),
            ),
            link: GSGeneratedStyle(
              color: Colors.transparent,
              borderColor: Colors.transparent,
              padding: const EdgeInsets.all($GSSpace.$0),
              textStyle: const TextStyle(color: $GSColors.secondary500),
              dark: GSGeneratedStyle(
                color: Colors.transparent,
                borderColor: Colors.transparent,
                textStyle: const TextStyle(color: $GSColors.secondary800),
                padding: const EdgeInsets.all($GSSpace.$0),
              ),
            ),
          ),
        ),
      ),
      positive: GSGeneratedStyle(
        variants: Variants(
          variant: GSVariant(
            solid: GSGeneratedStyle(
              color: $GSColors.success500,
              borderColor: $GSColors.success300,
              textStyle: const TextStyle(color: $GSColors.white),
              dark: GSGeneratedStyle(
                color: $GSColors.success800,
                borderColor: $GSColors.success800,
                textStyle: const TextStyle(color: $GSColors.white),
              ),
            ),
            outline: GSGeneratedStyle(
              color: Colors.transparent,
              borderColor: $GSColors.success500,
              textStyle: const TextStyle(color: $GSColors.success500),
              dark: GSGeneratedStyle(
                color: Colors.transparent,
                borderColor: $GSColors.success800,
                textStyle: const TextStyle(color: $GSColors.success800),
              ),
            ),
            link: GSGeneratedStyle(
              color: Colors.transparent,
              borderColor: Colors.transparent,
              padding: const EdgeInsets.all($GSSpace.$0),
              textStyle: const TextStyle(color: $GSColors.success500),
              dark: GSGeneratedStyle(
                color: Colors.transparent,
                borderColor: Colors.transparent,
                textStyle: const TextStyle(color: $GSColors.success800),
                padding: const EdgeInsets.all($GSSpace.$0),
              ),
            ),
          ),
        ),
      ),
      negative: GSGeneratedStyle(
        variants: Variants(
          variant: GSVariant(
            solid: GSGeneratedStyle(
              color: $GSColors.error500,
              borderColor: $GSColors.error300,
              textStyle: const TextStyle(color: $GSColors.white),
              dark: GSGeneratedStyle(
                color: $GSColors.error800,
                borderColor: $GSColors.error800,
                textStyle: const TextStyle(color: $GSColors.white),
              ),
            ),
            outline: GSGeneratedStyle(
              color: Colors.transparent,
              borderColor: $GSColors.error500,
              textStyle: const TextStyle(color: $GSColors.error500),
              dark: GSGeneratedStyle(
                color: Colors.transparent,
                borderColor: $GSColors.error800,
                textStyle: const TextStyle(color: $GSColors.error800),
              ),
            ),
            link: GSGeneratedStyle(
              color: Colors.transparent,
              borderColor: Colors.transparent,
              padding: const EdgeInsets.all($GSSpace.$0),
              textStyle: const TextStyle(color: $GSColors.error500),
              dark: GSGeneratedStyle(
                color: Colors.transparent,
                borderColor: Colors.transparent,
                textStyle: const TextStyle(color: $GSColors.error800),
                padding: const EdgeInsets.all($GSSpace.$0),
              ),
            ),
          ),
        ),
      ),
    ),
    size: GSSize(
      xs: GSGeneratedStyle(
        padding: const EdgeInsets.symmetric(
            vertical: $GSSpace.$3, horizontal: $GSSpace.$6),
        borderRadius: $GSRadii.$xs,
        textStyle: const TextStyle(fontSize: $GSFontSize.$xs),
      ),
      sm: GSGeneratedStyle(
        padding: const EdgeInsets.symmetric(
            vertical: $GSSpace.$3_5, horizontal: $GSSpace.$7),
        borderRadius: $GSRadii.$sm,
        textStyle: const TextStyle(fontSize: $GSFontSize.$sm),
      ),
      md: GSGeneratedStyle(
        padding: const EdgeInsets.symmetric(
            vertical: $GSSpace.$4, horizontal: $GSSpace.$8),
        borderRadius: $GSRadii.$md,
        textStyle: const TextStyle(fontSize: $GSFontSize.$md),
      ),
      lg: GSGeneratedStyle(
        padding: const EdgeInsets.symmetric(
            vertical: $GSSpace.$5, horizontal: $GSSpace.$10),
        borderRadius: $GSRadii.$lg,
        textStyle: const TextStyle(fontSize: $GSFontSize.$lg),
      ),
    ),
  ),
);

class GSButtonStyle {
  static Map<GSButtonAction, Map<GSButtonVariant, GSGeneratedStyle>>
      gsButtonCombination = {
    GSButtonAction.primary: {
      GSButtonVariant.solid:
          buttonStyle.variants!.action!.primary!.variants!.variant!.solid!,
      GSButtonVariant.outline:
          buttonStyle.variants!.action!.primary!.variants!.variant!.outline!,
      GSButtonVariant.link:
          buttonStyle.variants!.action!.primary!.variants!.variant!.link!
    },
    GSButtonAction.secondary: {
      GSButtonVariant.solid:
          buttonStyle.variants!.action!.secondary!.variants!.variant!.solid!,
      GSButtonVariant.outline:
          buttonStyle.variants!.action!.secondary!.variants!.variant!.outline!,
      GSButtonVariant.link:
          buttonStyle.variants!.action!.secondary!.variants!.variant!.link!
    },
    GSButtonAction.positive: {
      GSButtonVariant.solid:
          buttonStyle.variants!.action!.positive!.variants!.variant!.solid!,
      GSButtonVariant.outline:
          buttonStyle.variants!.action!.positive!.variants!.variant!.outline!,
      GSButtonVariant.link:
          buttonStyle.variants!.action!.positive!.variants!.variant!.link!
    },
    GSButtonAction.negative: {
      GSButtonVariant.solid:
          buttonStyle.variants!.action!.negative!.variants!.variant!.solid!,
      GSButtonVariant.outline:
          buttonStyle.variants!.action!.negative!.variants!.variant!.outline!,
      GSButtonVariant.link:
          buttonStyle.variants!.action!.negative!.variants!.variant!.link!
    },
  };

  static Map<GSButtonSize, GSGeneratedStyle> size = {
    GSButtonSize.xs: buttonStyle.variants!.size!.xs!,
    GSButtonSize.sm: buttonStyle.variants!.size!.sm!,
    GSButtonSize.md: buttonStyle.variants!.size!.md!,
    GSButtonSize.lg: buttonStyle.variants!.size!.lg!,
  };

  static Map<GSButtonAction, StyleData> action = {
    GSButtonAction.primary: StyleData(
      color: $GSColors.primary500,
      borderColor: $GSColors.primary300,
      textStyle: const TextStyle(color: $GSColors.white),
      dark: StyleData(color: $GSColors.primary800),
    ),
    GSButtonAction.secondary: StyleData(
      color: $GSColors.secondary500,
      borderColor: $GSColors.secondary300,
      textStyle: const TextStyle(color: $GSColors.white),
      dark: StyleData(color: $GSColors.secondary800),
    ),
    GSButtonAction.positive: StyleData(
      color: $GSColors.success500,
      borderColor: $GSColors.success300,
      textStyle: const TextStyle(color: $GSColors.white),
      dark: StyleData(color: $GSColors.success800),
    ),
    GSButtonAction.negative: StyleData(
      color: $GSColors.error500,
      borderColor: $GSColors.error300,
      textStyle: const TextStyle(color: $GSColors.white),
      dark: StyleData(color: $GSColors.primary800),
    ),
  };

  static Map<GSButtonVariant, StyleData> variant = {
    GSButtonVariant.solid: StyleData(),
    GSButtonVariant.outline:
        StyleData(color: Colors.transparent, borderWidth: $GSBorderWidth.$1),
    GSButtonVariant.link: StyleData(padding: const EdgeInsets.all($GSSpace.$0)),
  };
}
