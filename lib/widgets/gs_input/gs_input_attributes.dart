import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_token.dart';

class GsInputAttributes {
  static Map<GSInputVariant, Map<GSThemeMode, GSInputCombinationStyle>>
      gsInputCombination = {
    GSInputVariant.underlined: {
      GSThemeMode.light: GSInputCombinationStyle(
        border: null,
        borderColor: $GSColors.backgroundLight300,
        textColor: $GSColors.white,
        px: const EdgeInsets.symmetric(horizontal: $GSSpace.$0),
      ),
      GSThemeMode.dark: GSInputCombinationStyle(
        border: null,
        borderColor: $GSColors.borderDark400,
        textColor: $GSColors.white,
        px: const EdgeInsets.symmetric(horizontal: $GSSpace.$0),
      )
    },
    GSInputVariant.outline: {
      GSThemeMode.light: GSInputCombinationStyle(
        border: const OutlineInputBorder(),
        borderColor: $GSColors.backgroundLight300,
        textColor: $GSColors.white,
        px: const EdgeInsets.symmetric(horizontal: $GSSpace.$3),
      ),
      GSThemeMode.dark: GSInputCombinationStyle(
        border: const OutlineInputBorder(),
        borderColor: $GSColors.borderDark400,
        px: const EdgeInsets.symmetric(horizontal: $GSSpace.$3),
        textColor: $GSColors.white,
      )
    },
    GSInputVariant.rounded: {
      GSThemeMode.light: GSInputCombinationStyle(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular($GSRadii.full))),
        borderColor: $GSColors.backgroundLight300,
        px: const EdgeInsets.symmetric(horizontal: $GSSpace.$4),
        textColor: $GSColors.white,
      ),
      GSThemeMode.dark: GSInputCombinationStyle(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular($GSRadii.full))),
        borderColor: $GSColors.borderDark400,
        textColor: $GSColors.white,
        px: const EdgeInsets.symmetric(horizontal: $GSSpace.$4),
      )
    },
  };

  static Map<GSInputSize, EdgeInsetsGeometry> inputPaddings = {
    GSInputSize.sm: GsInputToken.inputPadding[GSInputPadding.sm]!,
    GSInputSize.md: GsInputToken.inputPadding[GSInputPadding.md]!,
    GSInputSize.lg: GsInputToken.inputPadding[GSInputPadding.lg]!,
    GSInputSize.xl: GsInputToken.inputPadding[GSInputPadding.xl]!,
  };

  static Map<GSInputSize, double?> inputSize = {
    GSInputSize.sm: GsInputToken.inputSize[GSInputSize.sm]!,
    GSInputSize.md: GsInputToken.inputSize[GSInputSize.md]!,
    GSInputSize.lg: GsInputToken.inputSize[GSInputSize.lg]!,
   GSInputSize.xl: GsInputToken.inputSize[GSInputSize.xl]!,
  };

  static Map<GSInputSize, BorderRadius> inputBorderRadius = {
    GSInputSize.sm: GsInputToken.inputBorderRadius[GSInputBorderRadius.sm]!,
    GSInputSize.md: GsInputToken.inputBorderRadius[GSInputBorderRadius.md]!,
    GSInputSize.lg: GsInputToken.inputBorderRadius[GSInputBorderRadius.lg]!,
    GSInputSize.xl: GsInputToken.inputBorderRadius[GSInputBorderRadius.xl]!,
  };

  static Map<GSInputSize, double> inputFontSize = {
    GSInputSize.sm: GsInputToken.inputFontSize[GSInputFontSize.sm]!,
    GSInputSize.md: GsInputToken.inputFontSize[GSInputFontSize.md]!,
    GSInputSize.lg: GsInputToken.inputFontSize[GSInputFontSize.lg]!,
  };
}
