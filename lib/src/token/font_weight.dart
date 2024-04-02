import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/provider/gluestack_provider.dart';

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
  static get hairline => getIt<GSFontWeightsToken>().hairline;
  static get thin => getIt<GSFontWeightsToken>().thin;
  static get light => getIt<GSFontWeightsToken>().light;
  static get normal => getIt<GSFontWeightsToken>().normal;
  static get medium => getIt<GSFontWeightsToken>().medium;
  static get semibold => getIt<GSFontWeightsToken>().semibold;
  static get bold => getIt<GSFontWeightsToken>().bold;
  static get extrabold => getIt<GSFontWeightsToken>().extrabold;
  static get black => getIt<GSFontWeightsToken>().black;

  late Map<String, FontWeight> fontWeightMap;
  $GSFontWeights() {
    fontWeightMap = {
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
  Map<String, FontWeight> getFontWeightMap() {
    return fontWeightMap;
  }
}
