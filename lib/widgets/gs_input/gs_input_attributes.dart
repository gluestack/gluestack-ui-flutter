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
        borderColor: Colors.transparent,
        textColor: $GSColors.white,
      ),
      GSThemeMode.dark: GSInputCombinationStyle(
        border: null,
        borderColor: Colors.transparent,
        textColor: $GSColors.white,
      )
    },
    GSInputVariant.outline: {
      GSThemeMode.light: GSInputCombinationStyle(
        border: const OutlineInputBorder(),
        borderColor: Colors.transparent,
        textColor: $GSColors.white,
      ),
      GSThemeMode.dark: GSInputCombinationStyle(
        border: const OutlineInputBorder(),
        borderColor: Colors.transparent,
        textColor: $GSColors.white,
      )
    },
    GSInputVariant.rounded: {
      GSThemeMode.light: GSInputCombinationStyle(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular($GSRadii.$2xl))),
        borderColor: Colors.transparent,
        textColor: $GSColors.white,
      ),
      GSThemeMode.dark: GSInputCombinationStyle(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular($GSRadii.$2xl))),
        borderColor: Colors.transparent,
        textColor: $GSColors.white,
      )
    },
  };

  static Map<GSInputSize, double?> inputSize = {

    GSInputSize.sm: GsInputToken.inputSize[GSInputSize.sm]!,
    GSInputSize.md: GsInputToken.inputSize[GSInputSize.md]!,
    GSInputSize.lg: GsInputToken.inputSize[GSInputSize.lg]!,
  };

  static Map<GSInputSize, BorderRadius> inputBorderRadius = {

    GSInputSize.sm: GsInputToken.inputBorderRadius[GSInputBorderRadius.sm]!,
    GSInputSize.md: GsInputToken.inputBorderRadius[GSInputBorderRadius.md]!,
    GSInputSize.lg: GsInputToken.inputBorderRadius[GSInputBorderRadius.lg]!,
  };

  static Map<GSInputSize, double> inputFontSize = {
 
    GSInputSize.sm: GsInputToken.inputFontSize[GSInputFontSize.sm]!,
    GSInputSize.md: GsInputToken.inputFontSize[GSInputFontSize.md]!,
    GSInputSize.lg: GsInputToken.inputFontSize[GSInputFontSize.lg]!,
  };
}
