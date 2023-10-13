import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

enum GSInputVariant { rounded, outline, underlined }

enum GSInputSize { sm, md, lg, xl }

enum GSInputPadding { sm, md, lg, xl }

enum GSInputBorderRadius { sm, md, lg, xl }

enum GSInputFontSize { sm, md, lg, xl }

enum Mode { light, dark }

class GSInputCombinationStyle {
  final OutlineInputBorder? border;
  final Color? borderColor;
  final Color? focusborderColor;
  final EdgeInsetsGeometry? px;
  final Color? textColor;
  GSInputCombinationStyle(
      {required this.border,
      required this.borderColor,
      required this.focusborderColor,
      this.textColor,
      required this.px});
}

class GsInputToken {
  static Map<GSInputPadding, EdgeInsetsGeometry?> inputPadding = {
    GSInputPadding.sm: const EdgeInsets.symmetric(horizontal: $GSSpace.$3),
    GSInputPadding.md: const EdgeInsets.symmetric(horizontal: $GSSpace.$3_5),
    GSInputPadding.lg: const EdgeInsets.symmetric(horizontal: $GSSpace.$4),
    GSInputPadding.xl: const EdgeInsets.symmetric(horizontal: $GSSpace.$5),
  };

  static Map<GSInputSize, double> inputSize = {
    GSInputSize.xl: $GSSpace.$12,
    GSInputSize.lg: $GSSpace.$11,
    GSInputSize.md: $GSSpace.$10,
    GSInputSize.sm: $GSSpace.$9,
  };

  static Map<GSInputBorderRadius, BorderRadius?> inputBorderRadius = {
    GSInputBorderRadius.sm: BorderRadius.circular($GSRadii.$sm),
    GSInputBorderRadius.md: BorderRadius.circular($GSRadii.$md),
    GSInputBorderRadius.lg: BorderRadius.circular($GSRadii.$lg),
    GSInputBorderRadius.xl: BorderRadius.circular($GSRadii.$xl),
  };

  static Map<GSInputFontSize, double?> inputFontSize = {
    GSInputFontSize.sm: $GSFontSize.$sm,
    GSInputFontSize.md: $GSFontSize.$md,
    GSInputFontSize.lg: $GSFontSize.$lg,
    GSInputFontSize.xl: $GSFontSize.$xl,
  };
}
