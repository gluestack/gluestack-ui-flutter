import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_token.dart';

class GSInputAttributes {
  static Map<GSInputVariant, Map<GSThemeMode, GSInputCombinationStyle>>
      gsInputCombination = {
    GSInputVariant.underlined: {
      GSThemeMode.light: GSInputCombinationStyle(
        border: null,
        focusborderColor: $GSColors.primary700,
        borderColor: $GSColors.backgroundLight300,
        textColor: $GSColors.white,
        px: const EdgeInsets.symmetric(horizontal: $GSSpace.$0),
      ),
      GSThemeMode.dark: GSInputCombinationStyle(
        border: null,
        borderColor: $GSColors.borderDark400,
        textColor: $GSColors.white,
        focusborderColor: $GSColors.primary400,
        px: const EdgeInsets.symmetric(horizontal: $GSSpace.$0),
      )
    },
    GSInputVariant.outline: {
      GSThemeMode.light: GSInputCombinationStyle(
        border: const OutlineInputBorder(),
        borderColor: $GSColors.backgroundLight300,
        focusborderColor: $GSColors.primary700,
        textColor: $GSColors.white,
        px: const EdgeInsets.symmetric(horizontal: $GSSpace.$3),
      ),
      GSThemeMode.dark: GSInputCombinationStyle(
        border: const OutlineInputBorder(),
        borderColor: $GSColors.borderDark400,
        focusborderColor: $GSColors.primary400,
        px: const EdgeInsets.symmetric(horizontal: $GSSpace.$3),
        textColor: $GSColors.white,
      )
    },
    GSInputVariant.rounded: {
      GSThemeMode.light: GSInputCombinationStyle(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular($GSRadii.full))),
        borderColor: $GSColors.backgroundLight300,
        focusborderColor: $GSColors.primary700,
        px: const EdgeInsets.symmetric(horizontal: $GSSpace.$4),
        textColor: $GSColors.white,
      ),
      GSThemeMode.dark: GSInputCombinationStyle(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular($GSRadii.full))),
        borderColor: $GSColors.borderDark400,
        focusborderColor: $GSColors.primary400,
        textColor: $GSColors.white,
        px: const EdgeInsets.symmetric(horizontal: $GSSpace.$4),
      )
    },
  };

  static Map<GSInputSize, EdgeInsetsGeometry> inputPaddings = {
    GSInputSize.sm: GSInputToken.inputPadding[GSInputPadding.sm]!,
    GSInputSize.md: GSInputToken.inputPadding[GSInputPadding.md]!,
    GSInputSize.lg: GSInputToken.inputPadding[GSInputPadding.lg]!,
    GSInputSize.xl: GSInputToken.inputPadding[GSInputPadding.xl]!,
  };

  static Map<GSInputSize, double?> inputSize = {
    GSInputSize.sm: GSInputToken.inputSize[GSInputSize.sm]!,
    GSInputSize.md: GSInputToken.inputSize[GSInputSize.md]!,
    GSInputSize.lg: GSInputToken.inputSize[GSInputSize.lg]!,
    GSInputSize.xl: GSInputToken.inputSize[GSInputSize.xl]!,
  };

  static Map<GSInputSize, BorderRadius> inputBorderRadius = {
    GSInputSize.sm: GSInputToken.inputBorderRadius[GSInputBorderRadius.sm]!,
    GSInputSize.md: GSInputToken.inputBorderRadius[GSInputBorderRadius.md]!,
    GSInputSize.lg: GSInputToken.inputBorderRadius[GSInputBorderRadius.lg]!,
    GSInputSize.xl: GSInputToken.inputBorderRadius[GSInputBorderRadius.xl]!,
  };

  static Map<GSInputSize, double> inputFontSize = {
    GSInputSize.sm: GSInputToken.inputFontSize[GSInputFontSize.sm]!,
    GSInputSize.md: GSInputToken.inputFontSize[GSInputFontSize.md]!,
    GSInputSize.lg: GSInputToken.inputFontSize[GSInputFontSize.lg]!,
    GSInputSize.xl: GSInputToken.inputFontSize[GSInputFontSize.xl]!,
  };
}
