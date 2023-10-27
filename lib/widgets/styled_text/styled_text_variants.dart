import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/tokens.dart';

class TextVariants {
  final Map<String, dynamic> variants;

  const TextVariants({required this.variants});
}

final textVariants = TextVariants(
  variants: {
    'fontSize': DesignTokens.fontSizes['md'],
    'color': DesignTokens.colors['white'],
    'decoration': TextDecoration.none,
    'letterSpacing': DesignTokens.letterSpacings['md'],
  },
);
