import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/tokens.dart';

enum GSButtonAction { primary, secondary, positive, negative }

enum GSButtonVariant { solid, outline, link }

enum GSButtonSize { xs, sm, md, lg }

enum GSButtonPadding { xs, sm, md, lg }

enum GSButtonBorderRadius { xs, sm, md, lg }

enum GSButtonFontSize { xs, sm, md, lg }

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
  static Map<GSButtonAction, Color?> actionColors = {
    GSButtonAction.primary: DesignTokens.colors['primary500'],
    GSButtonAction.secondary: DesignTokens.colors['secondary500'],
    GSButtonAction.positive: DesignTokens.colors['green600'],
    GSButtonAction.negative: DesignTokens.colors['rose500']
  };

  static Map<GSButtonPadding, EdgeInsetsGeometry?> buttonPadding = {
    GSButtonPadding.xs: EdgeInsets.symmetric(
        vertical: DesignTokens.space['3']!,
        horizontal: DesignTokens.space['6']!),
    GSButtonPadding.sm: EdgeInsets.symmetric(
        vertical: DesignTokens.space['3.5']!,
        horizontal: DesignTokens.space['7']!),
    GSButtonPadding.md: EdgeInsets.symmetric(
        vertical: DesignTokens.space['4']!,
        horizontal: DesignTokens.space['8']!),
    GSButtonPadding.lg: EdgeInsets.symmetric(
        vertical: DesignTokens.space['5']!,
        horizontal: DesignTokens.space['10']!),
  };
  static Map<GSButtonBorderRadius, BorderRadiusGeometry?> buttonBorderRadius = {
    GSButtonBorderRadius.xs: BorderRadius.circular(DesignTokens.radii['xs']!),
    GSButtonBorderRadius.sm: BorderRadius.circular(DesignTokens.radii['sm']!),
    GSButtonBorderRadius.md: BorderRadius.circular(DesignTokens.radii['md']!),
    GSButtonBorderRadius.lg: BorderRadius.circular(DesignTokens.radii['lg']!),
  };
  static Map<GSButtonFontSize, double?> buttonFontSize = {
    GSButtonFontSize.xs: DesignTokens.fontSizes['xs']!,
    GSButtonFontSize.sm: DesignTokens.fontSizes['sm']!,
    GSButtonFontSize.md: DesignTokens.fontSizes['md']!,
    GSButtonFontSize.lg: DesignTokens.fontSizes['lg']!,
  };
}
