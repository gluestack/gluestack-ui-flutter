import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/token/line_height.dart';

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
    if (radius.contains('\$')) {
      return $GSRadii.radiiMap[radius.substring(1)]!;
    }
    return $GSRadii.radiiMap[radius]!;
  }
}

double? resolveBorderWidthFromString(String? borderWidth) {
  if (borderWidth == null) {
    return null;
  } else {
    if (borderWidth.contains('\$')) {
      return $GSBorderWidth.borderWidthMap[borderWidth.substring(1)]!;
    }
    return $GSBorderWidth.borderWidthMap[borderWidth]!;
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
  if (fontSzie.contains('\$')) {
    return $GSFontSize.fontMap[fontSzie.substring(1)]!;
  }

  return $GSFontSize.fontMap[fontSzie];
}

double? resolveLineHeightFromString(String? lineHeight,String? fontSize) {
  if (lineHeight == null||fontSize==null) {
    return null;
  }
  if (lineHeight.contains('\$')) {
    return $GSLineHeight.lineHeightMap[lineHeight.substring(1)]!/resolveFontSizeFromString(fontSize)!;
  }

  return $GSLineHeight.lineHeightMap[lineHeight]!/resolveFontSizeFromString(fontSize)!;
}

GSActions? resolveActionFromString(String? action) {
  const actionMap = {
    'primary': GSActions.primary,
    'secondary': GSActions.secondary,
    'positive': GSActions.positive,
    'negative': GSActions.negative,
    'error':GSActions.error,
    'warning':GSActions.warning,
    'success':GSActions.success,
    'info':GSActions.info,
    'muted':GSActions.muted,
  };

  return action != null ? actionMap[action] : null;
}

GSVariants? resolveVariantFromString(String? variant) {
  const variantMap = {
    'solid': GSVariants.solid,
    'outline': GSVariants.outline,
    'rounded': GSVariants.rounded,
    'underlined': GSVariants.underlined,
    'link': GSVariants.link,
  };

  return variant != null ? variantMap[variant] : null;
}

GSSizes? resolveSizesFromString(String? size) {
  const sizeMap = {
    'xs': GSSizes.$xs,
    'sm': GSSizes.$sm,
    'md': GSSizes.$md,
    'lg': GSSizes.$lg,
    'xl': GSSizes.$xl,
  };

  return size != null ? sizeMap[size] : null;
}

GSAlignItems? resolveItemAlignmentFromString(String? itemAlignment) {
  const itemAlignmentMap = {
    'center': GSAlignItems.center,
    'start': GSAlignItems.start,
    'end': GSAlignItems.end,
  };

  return itemAlignment != null ? itemAlignmentMap[itemAlignment] : null;
}

GSJustifyContents? resolveContentJustificationFromString(String? contentJustification) {
  const contentJustificationMap = {
    'center': GSJustifyContents.center,
    'start': GSJustifyContents.start,
    'end': GSJustifyContents.end,
  };

  return contentJustification != null ? contentJustificationMap[contentJustification] : null;
}

GSSpaces? resolveSpacesFromString(String? space) {
  const spaceMap = {
    'xs': GSSpaces.$xs,
    'sm': GSSpaces.$sm,
    'md': GSSpaces.$md,
    'lg': GSSpaces.$lg,
    'xl': GSSpaces.$xl,
    '2xl': GSSpaces.$2xl,
    '3xl': GSSpaces.$3xl,
    '4xl': GSSpaces.$4xl,
  };

  return space != null ? spaceMap[space] : null;
}
