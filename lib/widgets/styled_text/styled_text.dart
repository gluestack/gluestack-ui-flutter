import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/tokens.dart';
import 'package:gluestack_flutter_pro/widgets/styled_text/styled_text_variants.dart';

Text StyledText({
  required String text,
  String? fontSize,
  String? letterSpacing,
  String? color,
  TextDecoration? decoration,
}) {
  final textFont = DesignTokens.fontSizes[fontSize] != null ? fontSize : 'md';

  final textColor =
      DesignTokens.colors[color] != null ? color : DesignTokens.colors['white'];
  final textSpacing =
      DesignTokens.letterSpacings[letterSpacing] != null ? letterSpacing : 'md';

  final textStyle = TextStyle(
    fontSize: DesignTokens.fontSizes[textFont],
    color: DesignTokens.colors[textColor],
    decoration: decoration ?? textVariants.variants['decoration'],
    letterSpacing: DesignTokens.letterSpacings[textSpacing],
  );
  return Text(
    text,
    style: textStyle,
  );
}
