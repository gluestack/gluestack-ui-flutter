import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

enum GSInputVariant { rounded, outline, underlined }

enum GSInputSize { sm, md, lg, xl }

enum GSInputPadding { xs, sm, md, lg }

enum GSInputBorderRadius { xs, sm, md, lg }

enum GSInputFontSize { xs, sm, md, lg }

enum Mode { light, dark }

class GSInputCombinationStyle {
  final OutlineInputBorder? border;
  final Color? borderColor;
  final Color? textColor;
  GSInputCombinationStyle(
      {required this.border, required this.borderColor, this.textColor});
}

class GsInputToken {
  static Map<GSInputSize, double> inputSize = {
    GSInputSize.xl: $GSSpace.$12,
    GSInputSize.lg: $GSSpace.$11,
    GSInputSize.md: $GSSpace.$10,
    GSInputSize.sm: $GSSpace.$9,
  };

  static Map<GSInputBorderRadius, BorderRadius?> inputBorderRadius = {
    GSInputBorderRadius.xs: BorderRadius.circular($GSRadii.$xs),
    GSInputBorderRadius.sm: BorderRadius.circular($GSRadii.$sm),
    GSInputBorderRadius.md: BorderRadius.circular($GSRadii.$md),
    GSInputBorderRadius.lg: BorderRadius.circular($GSRadii.$lg),
  };

  static Map<GSInputFontSize, double?> inputFontSize = {
    GSInputFontSize.xs: $GSFontSize.$xs,
    GSInputFontSize.sm: $GSFontSize.$sm,
    GSInputFontSize.md: $GSFontSize.$md,
    GSInputFontSize.lg: $GSFontSize.$lg,
  };
}
