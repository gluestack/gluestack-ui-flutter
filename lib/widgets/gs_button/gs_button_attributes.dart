import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/tokens.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';

class GSButtonAttributes {
  static Map<GSButtonAction, Map<GSButtonVariant, GSButtonCombinationStyle>>
      gsButtonCombination = {
    GSButtonAction.primary: {
      GSButtonVariant.solid: GSButtonCombinationStyle(
        bgColor: GSButtonToken.actionColors[GSButtonAction.primary],
        borderColor: Colors.transparent,
        textColor: DesignTokens.colors['white'],
      ),
      GSButtonVariant.outline: GSButtonCombinationStyle(
        bgColor: Colors.transparent,
        borderColor: GSButtonToken.actionColors[GSButtonAction.primary],
        textColor: GSButtonToken.actionColors[GSButtonAction.primary],
      ),
      GSButtonVariant.link: GSButtonCombinationStyle(
        bgColor: Colors.transparent,
        borderColor: Colors.transparent,
        textColor: GSButtonToken.actionColors[GSButtonAction.primary],
        textDecoration: TextDecoration.underline,
      ),
    },
    GSButtonAction.secondary: {
      GSButtonVariant.solid: GSButtonCombinationStyle(
        bgColor: GSButtonToken.actionColors[GSButtonAction.secondary],
        borderColor: Colors.transparent,
        textColor: DesignTokens.colors['white'],
      ),
      GSButtonVariant.outline: GSButtonCombinationStyle(
        bgColor: Colors.transparent,
        borderColor: GSButtonToken.actionColors[GSButtonAction.secondary],
        textColor: GSButtonToken.actionColors[GSButtonAction.secondary],
      ),
      GSButtonVariant.link: GSButtonCombinationStyle(
        bgColor: Colors.transparent,
        borderColor: Colors.transparent,
        textColor: GSButtonToken.actionColors[GSButtonAction.secondary],
        textDecoration: TextDecoration.underline,
      ),
    },
    GSButtonAction.positive: {
      GSButtonVariant.solid: GSButtonCombinationStyle(
        bgColor: GSButtonToken.actionColors[GSButtonAction.positive],
        borderColor: Colors.transparent,
        textColor: DesignTokens.colors['white'],
      ),
      GSButtonVariant.outline: GSButtonCombinationStyle(
        bgColor: Colors.transparent,
        borderColor: GSButtonToken.actionColors[GSButtonAction.positive],
        textColor: GSButtonToken.actionColors[GSButtonAction.positive],
      ),
      GSButtonVariant.link: GSButtonCombinationStyle(
        bgColor: Colors.transparent,
        borderColor: Colors.transparent,
        textColor: GSButtonToken.actionColors[GSButtonAction.positive],
        textDecoration: TextDecoration.underline,
      ),
    },
    GSButtonAction.negative: {
      GSButtonVariant.solid: GSButtonCombinationStyle(
        bgColor: GSButtonToken.actionColors[GSButtonAction.negative],
        borderColor: Colors.transparent,
        textColor: DesignTokens.colors['white'],
      ),
      GSButtonVariant.outline: GSButtonCombinationStyle(
        bgColor: Colors.transparent,
        borderColor: GSButtonToken.actionColors[GSButtonAction.negative],
        textColor: GSButtonToken.actionColors[GSButtonAction.negative],
      ),
      GSButtonVariant.link: GSButtonCombinationStyle(
        bgColor: Colors.transparent,
        borderColor: Colors.transparent,
        textColor: GSButtonToken.actionColors[GSButtonAction.negative],
        textDecoration: TextDecoration.underline,
      ),
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
