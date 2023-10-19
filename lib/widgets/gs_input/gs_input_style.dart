import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/generated_style.dart';
import 'package:gluestack_flutter_pro/style/style_data.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_token.dart';

GSGeneratedStyle inputStyle = GSGeneratedStyle(
  variants: Variants(
    variant: GSVariant(
      underlined: GSGeneratedStyle(
        borderColor: $GSColors.backgroundLight300,
        textStyle: const TextStyle(color: $GSColors.white),
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$0),
        onFocus: GSGeneratedStyle(borderColor: $GSColors.primary700),
        borderWidth: $GSBorderWidth.$1,
        dark: GSGeneratedStyle(
          borderColor: $GSColors.borderDark400,
          textStyle: const TextStyle(color: $GSColors.white),
          onFocus: GSGeneratedStyle(borderColor: $GSColors.primary400),
          padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$0),
          borderWidth: $GSBorderWidth.$1,
        ),
      ),
      outline: GSGeneratedStyle(
        borderColor: $GSColors.backgroundLight300,
        onFocus: GSGeneratedStyle(borderColor: $GSColors.primary700),
        textStyle: const TextStyle(color: $GSColors.white),
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$3),
        borderWidth: $GSBorderWidth.$1,
        borderRadius: $GSRadii.$sm,
        dark: GSGeneratedStyle(
          borderColor: $GSColors.borderDark400,
          onFocus: GSGeneratedStyle(borderColor: $GSColors.primary400),
          textStyle: const TextStyle(color: $GSColors.white),
          padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$3),
          borderWidth: $GSBorderWidth.$1,
          borderRadius: $GSRadii.$sm,
        ),
      ),
      rounded: GSGeneratedStyle(
        borderWidth: $GSBorderWidth.$1,
        borderRadius: $GSRadii.full,
        borderColor: $GSColors.backgroundLight300,
        onFocus: GSGeneratedStyle(borderColor: $GSColors.primary700),
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$4),
        textStyle: const TextStyle(color: $GSColors.white),
        dark: GSGeneratedStyle(
          borderWidth: $GSBorderWidth.$1,
          borderRadius: $GSRadii.full,
          borderColor: $GSColors.borderDark400,
          onFocus: GSGeneratedStyle(borderColor: $GSColors.primary400),
          padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$4),
          textStyle: const TextStyle(color: $GSColors.white),
        ),
      ),
    ),
    size: GSSize(
      sm: GSGeneratedStyle(
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$3),
        borderRadius: $GSRadii.$sm,
        height: $GSSpace.$9,
        textStyle: const TextStyle(fontSize: $GSFontSize.$sm),
      ),
      md: GSGeneratedStyle(
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$3_5),
        borderRadius: $GSRadii.$md,
        height: $GSSpace.$10,
        textStyle: const TextStyle(fontSize: $GSFontSize.$md),
      ),
      lg: GSGeneratedStyle(
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$4),
        borderRadius: $GSRadii.$lg,
        height: $GSSpace.$11,
        textStyle: const TextStyle(fontSize: $GSFontSize.$lg),
      ),
      xl: GSGeneratedStyle(
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$5),
        borderRadius: $GSRadii.$xl,
        height: $GSSpace.$12,
        textStyle: const TextStyle(fontSize: $GSFontSize.$xl),
      ),
    ),
  ),
);

class GSInputStyle {
  static Map<GSInputVariant, GSGeneratedStyle> gsInputCombination = {
    GSInputVariant.underlined: inputStyle.variants!.variant!.underlined!,
    GSInputVariant.outline: inputStyle.variants!.variant!.outline!,
    GSInputVariant.rounded: inputStyle.variants!.variant!.rounded!,
  };

  static Map<GSInputSize, GSGeneratedStyle> inputSize = {
    GSInputSize.sm: inputStyle.variants!.size!.sm!,
    GSInputSize.md: inputStyle.variants!.size!.md!,
    GSInputSize.lg: inputStyle.variants!.size!.lg!,
    GSInputSize.xl: inputStyle.variants!.size!.xl!,
  };
}
