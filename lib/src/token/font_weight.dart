import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
var fontWeightsInstance = getIt<$GSFontWeights>();

class $GSFontWeights {
  final FontWeight hairlineog;
  final FontWeight thinog;
  final FontWeight lightog;
  final FontWeight normalog;
  final FontWeight mediumog;
  final FontWeight semiboldog;
  final FontWeight boldog;
  final FontWeight extraboldog;
  final FontWeight blackog;

  const $GSFontWeights({
    this.hairlineog = FontWeight.w100,
    this.thinog = FontWeight.w200,
    this.lightog = FontWeight.w300,
    this.normalog = FontWeight.w400,
    this.mediumog = FontWeight.w500,
    this.semiboldog = FontWeight.w600,
    this.boldog = FontWeight.w700,
    this.extraboldog = FontWeight.w800,
    this.blackog = FontWeight.w900,
  });

  static get hairline => fontWeightsInstance.hairlineog;
  static get thin => fontWeightsInstance.thinog;
  static get light => fontWeightsInstance.lightog;
  static get normal => fontWeightsInstance.normalog;
  static get medium => fontWeightsInstance.mediumog;
  static get semibold => fontWeightsInstance.semiboldog;
  static get bold => fontWeightsInstance.boldog;
  static get extrabold => fontWeightsInstance.extraboldog;
  static get black => fontWeightsInstance.blackog;

  static Map<String, FontWeight> fontWeightMap = {
    "hairline": hairline,
    "thin": thin,
    "light": light,
    "normal": normal,
    "medium": medium,
    "semibold": semibold,
    "bold": bold,
    "extrabold": extrabold,
    "black": black,
  };
}