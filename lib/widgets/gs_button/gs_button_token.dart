import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

enum GSButtonAction { primary, secondary, positive, negative }

enum GSButtonVariant { solid, outline, link }

enum GSButtonSize { xs, sm, md, lg }

enum GSButtonPadding { xs, sm, md, lg }

enum GSButtonBorderRadius { xs, sm, md, lg }

enum GSButtonFontSize { xs, sm, md, lg }

enum Mode { light, dark }

class GSButtonCombinationStyle {
  final Color? bgColor;
  final Color? borderColor;
  final Color? textColor;
  TextDecoration? textDecoration = TextDecoration.none;

  GSButtonCombinationStyle(
      {required this.bgColor,
      required this.borderColor,
      this.textColor,
      this.textDecoration});
}

class GSButtonToken {
  static Map<GSButtonAction, Color?> actionLightColors = {
    GSButtonAction.primary: $GSColors.primary500,
    GSButtonAction.secondary: $GSColors.secondary500,
    GSButtonAction.positive: $GSColors.green600,
    GSButtonAction.negative: $GSColors.rose500
  };

  static Map<GSButtonAction, Color?> actionDarkColors = {
    GSButtonAction.primary: $GSColors.primary800,
    GSButtonAction.secondary: $GSColors.secondary800,
    GSButtonAction.positive: $GSColors.green800,
    GSButtonAction.negative: $GSColors.rose800
  };

  static Map<GSButtonPadding, EdgeInsetsGeometry?> buttonPadding = {
    GSButtonPadding.xs: const EdgeInsets.symmetric(
        vertical: $GSSpace.$3, horizontal: $GSSpace.$6),
    GSButtonPadding.sm: const EdgeInsets.symmetric(
        vertical: $GSSpace.$3_5, horizontal: $GSSpace.$7),
    GSButtonPadding.md: const EdgeInsets.symmetric(
        vertical: $GSSpace.$4, horizontal: $GSSpace.$8),
    GSButtonPadding.lg: const EdgeInsets.symmetric(
        vertical: $GSSpace.$5, horizontal: $GSSpace.$10),
  };
  static Map<GSButtonBorderRadius, BorderRadiusGeometry?> buttonBorderRadius = {
    GSButtonBorderRadius.xs: BorderRadius.circular($GSRadii.$xs),
    GSButtonBorderRadius.sm: BorderRadius.circular($GSRadii.$sm),
    GSButtonBorderRadius.md: BorderRadius.circular($GSRadii.$md),
    GSButtonBorderRadius.lg: BorderRadius.circular($GSRadii.$lg),
  };
  static Map<GSButtonFontSize, double?> buttonFontSize = {
    GSButtonFontSize.xs: $GSFontSize.$xs,
    GSButtonFontSize.sm: $GSFontSize.$sm,
    GSButtonFontSize.md: $GSFontSize.$md,
    GSButtonFontSize.lg: $GSFontSize.$lg,
  };
}
