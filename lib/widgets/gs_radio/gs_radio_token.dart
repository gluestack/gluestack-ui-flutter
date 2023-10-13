import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

enum GSRadioSize { sm, md, lg }

enum GsRadioPadding { sm, md, lg }

enum Mode { light, dark }

class GSRadioToken {
  static Map<GsRadioPadding, EdgeInsetsGeometry?> radioPadding = {
    GsRadioPadding.sm: const EdgeInsets.all($GSSpace.$1),
    GsRadioPadding.md: const EdgeInsets.all($GSSpace.$1_5),
    GsRadioPadding.lg: const EdgeInsets.all($GSSpace.$2),
  };
  static Map<GSRadioSize, double> radioSize = {
    GSRadioSize.lg: $GSSpace.$6,
    GSRadioSize.md: $GSSpace.$5,
    GSRadioSize.sm: $GSSpace.$4,
  };
}
