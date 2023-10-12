import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

enum GSInputVariant { rounded, outline, underlined }

enum GSInputSize { xs, sm, md, lg }

enum GSInputPadding { xs, sm, md, lg }

enum GSInputBorderRadius { xs, sm, md, lg }

enum GSInputFontSize { xs, sm, md, lg }

enum Mode { light, dark }

class GSInputCombinationStyle {
  final InputBorder? border;
  final Color? borderColor;
  final Color? textColor;
  GSInputCombinationStyle(
      {required this.border, required this.borderColor, this.textColor});
}

class GsInputToken {
  static Map<GSInputPadding, EdgeInsetsGeometry?> inputPadding = {
    GSInputPadding.xs: const EdgeInsets.symmetric(
        vertical: $GSSpace.$3, horizontal: $GSSpace.$6),
    GSInputPadding.sm: const EdgeInsets.symmetric(
        vertical: $GSSpace.$3_5, horizontal: $GSSpace.$7),
    GSInputPadding.md: const EdgeInsets.symmetric(
        vertical: $GSSpace.$4, horizontal: $GSSpace.$8),
    GSInputPadding.lg: const EdgeInsets.symmetric(
        vertical: $GSSpace.$5, horizontal: $GSSpace.$10),
  };

  static Map<GSInputBorderRadius, BorderRadiusGeometry?> inputBorderRadius = {
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
