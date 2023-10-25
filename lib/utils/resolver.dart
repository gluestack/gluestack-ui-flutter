import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

Color? resolveColorFromString(String? color) {
  if (color == null) {
    return null;
  }
  if (color.contains("transparent")) {
    return Colors.transparent;
  }
  return $GSColors.colorMap[color.substring(1)];
}

double? resolveRadiusFromString(String? radius) {
  if (radius == null) {
    return null;
  }
  if (radius == '0') {
    return $GSRadii.none;
  }
  if (radius == '999') {
    return $GSRadii.full;
  }
  if (radius == 'full' || radius == 'none') {
    return $GSRadii.radiiMap[radius]!;
  } else {
    return $GSRadii.radiiMap[radius.substring(1)]!;
  }
}

double? resolveSpaceFromString(String? space) {
  if (space == null) {
    return null;
  }
  if (space == 'px') {
    return $GSSpace.spaceMap[space];
  }
  return $GSSpace.spaceMap[space.substring(1)];
}

double? resolveFontSizeFromString(String? fontSzie) {
  if (fontSzie == null) {
    return null;
  }

  return $GSFontSize.fontMap[fontSzie];
}
