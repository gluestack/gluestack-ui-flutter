import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/tokens.dart';

class StyledButtonTokens {
  static Map<String, Color?> actionColors = {
    'primary': DesignTokens.colors['primary500'],
    'secondary': DesignTokens.colors['secondary500'],
    'positive': DesignTokens.colors['green600'],
    'negative': DesignTokens.colors['rose500']
  };

  static Map<String, EdgeInsetsGeometry?> buttonPadding = {
    'xs': EdgeInsets.symmetric(
        vertical: DesignTokens.space['3']!,
        horizontal: DesignTokens.space['6']!),
    'sm': EdgeInsets.symmetric(
        vertical: DesignTokens.space['3.5']!,
        horizontal: DesignTokens.space['7']!),
    'md': EdgeInsets.symmetric(
        vertical: DesignTokens.space['4']!,
        horizontal: DesignTokens.space['8']!),
    'lg': EdgeInsets.symmetric(
        vertical: DesignTokens.space['5']!,
        horizontal: DesignTokens.space['10']!),
  };
  static Map<String, BorderRadiusGeometry?> buttonRadius = {
    'xs': BorderRadius.circular(DesignTokens.radii['xs']!),
    'sm': BorderRadius.circular(DesignTokens.radii['sm']!),
    'md': BorderRadius.circular(DesignTokens.radii['md']!),
    'lg': BorderRadius.circular(DesignTokens.radii['lg']!),
  };
  static Map<String, BorderRadiusGeometry?> fontSize = {
    'xs': BorderRadius.circular(DesignTokens.fontSizes['xs']!),
    'sm': BorderRadius.circular(DesignTokens.fontSizes['sm']!),
    'md': BorderRadius.circular(DesignTokens.fontSizes['md']!),
    'lg': BorderRadius.circular(DesignTokens.fontSizes['lg']!),
  };
}
