import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

var fontWeightsInstance = getIt<GSFontWeightsToken>();

class GSFontWeightsToken {
  final FontWeight hairline;
  final FontWeight thin;
  final FontWeight light;
  final FontWeight normal;
  final FontWeight medium;
  final FontWeight semibold;
  final FontWeight bold;
  final FontWeight extrabold;
  final FontWeight black;

  const GSFontWeightsToken({
    this.hairline = FontWeight.w100,
    this.thin = FontWeight.w200,
    this.light = FontWeight.w300,
    this.normal = FontWeight.w400,
    this.medium = FontWeight.w500,
    this.semibold = FontWeight.w600,
    this.bold = FontWeight.w700,
    this.extrabold = FontWeight.w800,
    this.black = FontWeight.w900,
  });
}

class $GSFontWeights {
  static get hairline => fontWeightsInstance.hairline;
  static get thin => fontWeightsInstance.thin;
  static get light => fontWeightsInstance.light;
  static get normal => fontWeightsInstance.normal;
  static get medium => fontWeightsInstance.medium;
  static get semibold => fontWeightsInstance.semibold;
  static get bold => fontWeightsInstance.bold;
  static get extrabold => fontWeightsInstance.extrabold;
  static get black => fontWeightsInstance.black;

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
