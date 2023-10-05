import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/color_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';

class GSButtonAttributes {
  static Map<GSButtonAction,
          Map<GSButtonVariant, Map<GSThemeMode, GSButtonCombinationStyle>>>
      gsButtonCombination = {
    GSButtonAction.primary: {
      GSButtonVariant.solid: {
        GSThemeMode.light: GSButtonCombinationStyle(
          bgColor: GSButtonToken.actionLightColors[GSButtonAction.primary],
          borderColor: Colors.transparent,
          textColor: $GSColors.white,
        ),
        GSThemeMode.dark: GSButtonCombinationStyle(
          bgColor: GSButtonToken.actionDarkColors[GSButtonAction.primary],
          borderColor: Colors.transparent,
          textColor: $GSColors.white,
        ),
      },
      GSButtonVariant.outline: {
        GSThemeMode.light: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: GSButtonToken.actionLightColors[GSButtonAction.primary],
          textColor: GSButtonToken.actionLightColors[GSButtonAction.primary],
        ),
        GSThemeMode.dark: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: GSButtonToken.actionDarkColors[GSButtonAction.primary],
          textColor: GSButtonToken.actionDarkColors[GSButtonAction.primary],
        ),
      },
      GSButtonVariant.link: {
        GSThemeMode.light: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: Colors.transparent,
          textColor: GSButtonToken.actionLightColors[GSButtonAction.primary],
          textDecoration: TextDecoration.underline,
        ),
        GSThemeMode.dark: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: Colors.transparent,
          textColor: GSButtonToken.actionDarkColors[GSButtonAction.primary],
          textDecoration: TextDecoration.underline,
        ),
      }
    },
    GSButtonAction.secondary: {
      GSButtonVariant.solid: {
        GSThemeMode.light: GSButtonCombinationStyle(
          bgColor: GSButtonToken.actionLightColors[GSButtonAction.secondary],
          borderColor: Colors.transparent,
          textColor: $GSColors.white,
        ),
        GSThemeMode.dark: GSButtonCombinationStyle(
          bgColor: GSButtonToken.actionDarkColors[GSButtonAction.secondary],
          borderColor: Colors.transparent,
          textColor: $GSColors.white,
        ),
      },
      GSButtonVariant.outline: {
        GSThemeMode.light: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor:
              GSButtonToken.actionLightColors[GSButtonAction.secondary],
          textColor: GSButtonToken.actionLightColors[GSButtonAction.secondary],
        ),
        GSThemeMode.dark: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: GSButtonToken.actionDarkColors[GSButtonAction.secondary],
          textColor: GSButtonToken.actionDarkColors[GSButtonAction.secondary],
        ),
      },
      GSButtonVariant.link: {
        GSThemeMode.light: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: Colors.transparent,
          textColor: GSButtonToken.actionLightColors[GSButtonAction.secondary],
          textDecoration: TextDecoration.underline,
        ),
        GSThemeMode.dark: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: Colors.transparent,
          textColor: GSButtonToken.actionDarkColors[GSButtonAction.secondary],
          textDecoration: TextDecoration.underline,
        ),
      }
    },
    GSButtonAction.positive: {
      GSButtonVariant.solid: {
        GSThemeMode.light: GSButtonCombinationStyle(
          bgColor: GSButtonToken.actionLightColors[GSButtonAction.positive],
          borderColor: Colors.transparent,
          textColor: $GSColors.white,
        ),
        GSThemeMode.dark: GSButtonCombinationStyle(
          bgColor: GSButtonToken.actionDarkColors[GSButtonAction.positive],
          borderColor: Colors.transparent,
          textColor: $GSColors.white,
        ),
      },
      GSButtonVariant.outline: {
        GSThemeMode.light: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: GSButtonToken.actionLightColors[GSButtonAction.positive],
          textColor: GSButtonToken.actionLightColors[GSButtonAction.positive],
        ),
        GSThemeMode.dark: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: GSButtonToken.actionDarkColors[GSButtonAction.positive],
          textColor: GSButtonToken.actionDarkColors[GSButtonAction.positive],
        ),
      },
      GSButtonVariant.link: {
        GSThemeMode.light: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: Colors.transparent,
          textColor: GSButtonToken.actionLightColors[GSButtonAction.positive],
          textDecoration: TextDecoration.underline,
        ),
        GSThemeMode.dark: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: Colors.transparent,
          textColor: GSButtonToken.actionDarkColors[GSButtonAction.positive],
          textDecoration: TextDecoration.underline,
        ),
      }
    },
    GSButtonAction.negative: {
      GSButtonVariant.solid: {
        GSThemeMode.light: GSButtonCombinationStyle(
          bgColor: GSButtonToken.actionLightColors[GSButtonAction.negative],
          borderColor: Colors.transparent,
          textColor: $GSColors.white,
        ),
        GSThemeMode.dark: GSButtonCombinationStyle(
          bgColor: GSButtonToken.actionDarkColors[GSButtonAction.negative],
          borderColor: Colors.transparent,
          textColor: $GSColors.white,
        ),
      },
      GSButtonVariant.outline: {
        GSThemeMode.light: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: GSButtonToken.actionLightColors[GSButtonAction.negative],
          textColor: GSButtonToken.actionLightColors[GSButtonAction.negative],
        ),
        GSThemeMode.dark: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: GSButtonToken.actionDarkColors[GSButtonAction.negative],
          textColor: GSButtonToken.actionDarkColors[GSButtonAction.negative],
        ),
      },
      GSButtonVariant.link: {
        GSThemeMode.light: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: Colors.transparent,
          textColor: GSButtonToken.actionLightColors[GSButtonAction.negative],
          textDecoration: TextDecoration.underline,
        ),
        GSThemeMode.dark: GSButtonCombinationStyle(
          bgColor: Colors.transparent,
          borderColor: Colors.transparent,
          textColor: GSButtonToken.actionDarkColors[GSButtonAction.negative],
          textDecoration: TextDecoration.underline,
        ),
      }
    }
  };

  static Map<GSButtonSize, EdgeInsetsGeometry> buttonPaddings = {
    GSButtonSize.xs: GSButtonToken.buttonPadding[GSButtonPadding.xs]!,
    GSButtonSize.sm: GSButtonToken.buttonPadding[GSButtonPadding.sm]!,
    GSButtonSize.md: GSButtonToken.buttonPadding[GSButtonPadding.md]!,
    GSButtonSize.lg: GSButtonToken.buttonPadding[GSButtonPadding.lg]!,
  };

  static Map<GSButtonSize, BorderRadiusGeometry> buttonBorderRadius = {
    GSButtonSize.xs: GSButtonToken.buttonBorderRadius[GSButtonBorderRadius.xs]!,
    GSButtonSize.sm: GSButtonToken.buttonBorderRadius[GSButtonBorderRadius.sm]!,
    GSButtonSize.md: GSButtonToken.buttonBorderRadius[GSButtonBorderRadius.md]!,
    GSButtonSize.lg: GSButtonToken.buttonBorderRadius[GSButtonBorderRadius.lg]!,
  };

  static Map<GSButtonSize, double> buttonFontSize = {
    GSButtonSize.xs: GSButtonToken.buttonFontSize[GSButtonFontSize.xs]!,
    GSButtonSize.sm: GSButtonToken.buttonFontSize[GSButtonFontSize.sm]!,
    GSButtonSize.md: GSButtonToken.buttonFontSize[GSButtonFontSize.md]!,
    GSButtonSize.lg: GSButtonToken.buttonFontSize[GSButtonFontSize.lg]!,
  };
}
