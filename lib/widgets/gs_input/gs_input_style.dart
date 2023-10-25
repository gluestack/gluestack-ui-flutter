import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_token.dart';

GSStyle inputStyle = GSStyle(
  variants: Variants(
    variant: GSVariant(
      underlined: GSStyle(
        borderColor: $GSColors.backgroundLight300,
        textStyle: const TextStyle(color: $GSColors.white),
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$0),
        onFocus: GSStyle(borderColor: $GSColors.primary700),
        borderWidth: $GSBorderWidth.$1,
        dark: GSStyle(
          borderColor: $GSColors.borderDark400,
          textStyle: const TextStyle(color: $GSColors.white),
          onFocus: GSStyle(borderColor: $GSColors.primary400),
          padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$0),
          borderWidth: $GSBorderWidth.$1,
        ),
      ),
      outline: GSStyle(
        borderColor: $GSColors.backgroundLight300,
        onFocus: GSStyle(borderColor: $GSColors.primary700),
        textStyle: const TextStyle(color: $GSColors.white),
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$3),
        borderWidth: $GSBorderWidth.$1,
        borderRadius: $GSRadii.$sm,
        dark: GSStyle(
          borderColor: $GSColors.borderDark400,
          onFocus: GSStyle(borderColor: $GSColors.primary400),
          textStyle: const TextStyle(color: $GSColors.white),
          padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$3),
          borderWidth: $GSBorderWidth.$1,
          borderRadius: $GSRadii.$sm,
        ),
      ),
      rounded: GSStyle(
        borderWidth: $GSBorderWidth.$1,
        borderRadius: $GSRadii.full,
        borderColor: $GSColors.backgroundLight300,
        onFocus: GSStyle(borderColor: $GSColors.primary700),
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$4),
        textStyle: const TextStyle(color: $GSColors.white),
        dark: GSStyle(
          borderWidth: $GSBorderWidth.$1,
          borderRadius: $GSRadii.full,
          borderColor: $GSColors.borderDark400,
          onFocus: GSStyle(borderColor: $GSColors.primary400),
          padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$4),
          textStyle: const TextStyle(color: $GSColors.white),
        ),
      ),
    ),
    size: GSSize(
      sm: GSStyle(
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$3),
        borderRadius: $GSRadii.$sm,
        height: $GSSpace.$9,
        textStyle: const TextStyle(fontSize: $GSFontSize.$sm),
      ),
      md: GSStyle(
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$3_5),
        borderRadius: $GSRadii.$md,
        height: $GSSpace.$10,
        textStyle: const TextStyle(fontSize: $GSFontSize.$md),
      ),
      lg: GSStyle(
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$4),
        borderRadius: $GSRadii.$lg,
        height: $GSSpace.$11,
        textStyle: const TextStyle(fontSize: $GSFontSize.$lg),
      ),
      xl: GSStyle(
        padding: const EdgeInsets.symmetric(horizontal: $GSSpace.$5),
        borderRadius: $GSRadii.$xl,
        height: $GSSpace.$12,
        textStyle: const TextStyle(fontSize: $GSFontSize.$xl),
      ),
    ),
  ),
);

class GSInputStyle {
  static Map<GSInputVariant, GSStyle> gsInputCombination = {
    GSInputVariant.underlined: inputStyle.variants!.variant!.underlined!,
    GSInputVariant.outline: inputStyle.variants!.variant!.outline!,
    GSInputVariant.rounded: inputStyle.variants!.variant!.rounded!,
  };

  static Map<GSInputSize, GSStyle> inputSize = {
    GSInputSize.sm: inputStyle.variants!.size!.sm!,
    GSInputSize.md: inputStyle.variants!.size!.md!,
    GSInputSize.lg: inputStyle.variants!.size!.lg!,
    GSInputSize.xl: inputStyle.variants!.size!.xl!,
  };
}
