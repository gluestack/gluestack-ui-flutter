import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
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

GSActions? resolveActionFromString(String? action) {
  if (action == null) {
    return null;
  }
  switch (action) {
    case 'primary':
      return GSActions.primary;
    case 'secondary':
      return GSActions.secondary;
    case 'positive':
      return GSActions.positive;
    case 'negative':
      return GSActions.negative;
    default:
      return null;
  }
}

GSVariants? resolveVariantFromString(String? variant) {
  if (variant == null) {
    return null;
  }
  switch (variant) {
    case 'solid':
      return GSVariants.solid;
    case 'outline':
      return GSVariants.outline;
    case 'rounded':
      return GSVariants.rounded;
    case 'underlined':
      return GSVariants.underlined;
    case 'link':
      return GSVariants.link;
    default:
      return null;
  }
}

GSSizes? resolveSizesFromString(String? size) {
  if (size == null) {
    return null;
  }
  switch (size) {
    case 'xs':
      return GSSizes.xs;
    case 'sm':
      return GSSizes.sm;
    case 'md':
      return GSSizes.md;
    case 'lg':
      return GSSizes.lg;
    case 'xl':
      return GSSizes.xl;
    default:
      return null;
  }
}
