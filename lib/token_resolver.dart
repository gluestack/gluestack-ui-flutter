import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/tokens.dart';

Color color(String identifier) =>
    DesignTokens.colors[identifier] ?? DesignTokens.colors["primary500"]!;

double space(String identifier) =>
    DesignTokens.space[identifier] ?? DesignTokens.space["px"]!;

double borderWidth(String identifier) =>
    DesignTokens.borderWidths[identifier] ?? DesignTokens.borderWidths["1"]!;

double radius(String identifier) =>
    DesignTokens.radii[identifier] ?? DesignTokens.radii["none"]!;

double fontSize(String identifier) =>
    DesignTokens.fontSizes[identifier] ?? DesignTokens.fontSizes["sm"]!;

double letterSpacing(String identifier) =>
    DesignTokens.letterSpacings[identifier] ??
    DesignTokens.letterSpacings["md"]!;
