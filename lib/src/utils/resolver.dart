import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/token/font_weight.dart';
import 'package:gluestack_ui/src/token/line_height.dart';
import 'package:gluestack_ui/src/token/public.dart';

bool parseMap(Map<dynamic, dynamic>? data) {
  return data?.isNotEmpty ?? false;
}

// Map<String, GSStyle?> mergeStyledMaps({
//   required Map<String, GSStyle?>? styleMap,
//   required Map<String, GSStyle?>? overrideStyleMap,
//   required List<String> keys,
// }) {
//   Map<String, GSStyle?> mergedStyleMap = {};
//   for (var element in keys) {
//     mergedStyleMap[element] = styleMap?[element] != null
//         ? styleMap![element]?.merge(overrideStyleMap?[element])
//         : overrideStyleMap?[element];
//   }
//   return mergedStyleMap;
// }

Map<String, GSStyle?> mergeStyledMaps({
  required Map<String, GSStyle?>? styleMap,
  required Map<String, GSStyle?>? overrideStyleMap,
  required List<String> keys,
}) {
  Map<String, GSStyle?> mergedStyleMap = {};
  styleMap?.forEach((key, value) {
    mergedStyleMap[key] = value;
  });
  overrideStyleMap?.forEach((key, value) {
    if (mergedStyleMap.containsKey(key) && value != null) {
      mergedStyleMap[key] = mergedStyleMap[key]?.merge(value) ?? value;
    } else {
      mergedStyleMap[key] = value;
    }
  });

  return mergedStyleMap;
}

Map<String, GSStyle>? resolvedescendantStylesFromMap(
    Map<String, dynamic>? data, List<String> descendantStyles) {
  if (descendantStyles.isEmpty || data == null) {
    return null;
  }
  Map<String, GSStyle> descendantStylesMap = {};
  for (var element in descendantStyles) {
    descendantStylesMap[element] = GSStyle.fromMap(data: data[element]);
  }
  return descendantStylesMap;
}

Color? resolveColorFromString(String? color) {
  if (color == null) {
    return null;
  }
  if (color.contains("transparent")) {
    return const Color(0x00000000); //transparent
  }
  if (color.contains("white")) {
    return const Color(0xFFFFFFFF); // white
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

FontWeight? resolveFontWeightFromString(String? fontWeight) {
  if (fontWeight == null) {
    return null;
  }
  if (fontWeight.contains('\$')) {
    return $GSFontWeights.fontWeightMap[fontWeight.substring(1)]!;
  }

  return $GSFontWeights.fontWeightMap[fontWeight];
}

GSFlexDirections? resolveFlexDirectionFromString(String? flexDirection) {
  if (flexDirection == null) {
    return null;
  }
  const flexDirectionMap = {
    'row': GSFlexDirections.row,
    'column': GSFlexDirections.column,
  };
  return flexDirectionMap[flexDirection] ?? GSFlexDirections.row;
}

double? resolveSpaceFromString(String? space) {
  if (space == null) {
    return null;
  }
  if (space.contains('-')) {
    return (double.parse('-${$GSSpace.spaceMap[space.substring(1)]}'));
  }
  if (space == 'px') {
    return $GSSpace.spaceMap[space];
  }
  if (space.contains('\$')) {
    if (space.contains('-')) {
      return (double.parse('-${$GSSpace.spaceMap[space.substring(1)]}'));
    }
    return $GSSpace.spaceMap[space.substring(1)];
  }
  return $GSSpace.spaceMap[space];
}

EdgeInsetsGeometry? resolvePaddingFromString(String? padding, String type,
    {String? paddingy, String? side = 'b'}) {
  if (padding == null) {
    return null;
  }

  if (type == 'all') {
    return EdgeInsets.all(resolveSpaceFromString(padding)!);
  }
  if (type == 'symmetric') {
    return EdgeInsets.symmetric(
        horizontal: resolveSpaceFromString(padding)!,
        vertical: resolveSpaceFromString(paddingy)!);
  }
  if (type == 'horizontal') {
    return EdgeInsets.symmetric(horizontal: resolveSpaceFromString(padding)!);
  }
  if (type == 'vertical') {
    return EdgeInsets.symmetric(vertical: resolveSpaceFromString(padding)!);
  }
  if (type == 'only') {
    if (side == 'b') {
      return EdgeInsets.only(bottom: resolveSpaceFromString(padding)!);
    } else if (side == 'r') {
      return EdgeInsets.only(right: resolveSpaceFromString(padding)!);
    } else if (side == 'l') {
      return EdgeInsets.only(left: resolveSpaceFromString(padding)!);
    } else {
      return EdgeInsets.only(top: resolveSpaceFromString(padding)!);
    }
  }
  return null;
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

double? resolveLineHeightFromString(String? lineHeight, String? fontSize) {
  if (lineHeight == null || fontSize == null) {
    return null;
  }
  if (lineHeight.contains('\$')) {
    return $GSLineHeight.lineHeightMap[lineHeight.substring(1)]! /
        resolveFontSizeFromString(fontSize)!;
  }

  return $GSLineHeight.lineHeightMap[lineHeight]! /
      resolveFontSizeFromString(fontSize)!;
}

double? resolveLetterSpacingFromString(String? letterSpacing) {
  if (letterSpacing == null) {
    return null;
  }
  if (letterSpacing.contains('\$')) {
    return $GSLetterSpacing.letterSpacingMap[letterSpacing.substring(1)]!;
  }

  return $GSLetterSpacing.letterSpacingMap[letterSpacing];
}

TextDecoration? resolveTextDecorationFromString(String? textDecoration) {
  if (textDecoration == null) {
    return null;
  } else if (textDecoration == 'none') {
    return TextDecoration.none;
  } else if (textDecoration == 'underline') {
    return TextDecoration.underline;
  }
  return null;
}

GSActions? resolveActionFromString(String? action) {
  const actionMap = {
    'primary': GSActions.primary,
    'secondary': GSActions.secondary,
    'positive': GSActions.positive,
    'negative': GSActions.negative,
    'error': GSActions.error,
    'warning': GSActions.warning,
    'success': GSActions.success,
    'info': GSActions.info,
    'muted': GSActions.muted,
    'attention': GSActions.attention,
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
    'accent': GSVariants.accent,
    'filled': GSVariants.filled,
    'unfilled': GSVariants.unfilled,
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
    '2xs': GSSizes.$2xs,
  };

  return size != null ? sizeMap[size] : null;
}

GSAlignments? resolveAlignmentFromString(String? itemAlignment) {
  const itemAlignmentMap = {
    'center': GSAlignments.center,
    'start': GSAlignments.start,
    'end': GSAlignments.end,
    'space-between': GSAlignments.spaceBetween,
    'flex-end': GSAlignments.flexEnd,
    'flex-start': GSAlignments.flexStart,
  };

  return itemAlignment != null ? itemAlignmentMap[itemAlignment] : null;
}

MainAxisAlignment resolveAlignmentFromNum(num? alignmentNum) {
  final alignments = {
    -1: MainAxisAlignment.start,
    0: MainAxisAlignment.center,
    1: MainAxisAlignment.end,
  };
  return alignments[alignmentNum] ?? MainAxisAlignment.end;
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

double resolveAlignment(GSAlignments? suppliedAlignment) {
  Map<dynamic, double> alignOrJustifyItems = {
    GSAlignments.start: -1,
    GSAlignments.center: 0,
    GSAlignments.end: 1,
    GSAlignments.spaceBetween: -1,
    GSAlignments.flexEnd: 1,
    GSAlignments.flexStart: 1
  };

  return suppliedAlignment != null
      ? alignOrJustifyItems[suppliedAlignment]!
      : 0;
}

GSOrientations? resolveOrientationsFromString(String? orientation) {
  const orientationMap = {
    'vertical': GSOrientations.vertical,
    'horizontal': GSOrientations.horizontal,
  };

  return orientation != null ? orientationMap[orientation] : null;
}

Widget resolveFlexWidget(
    {required GSFlexDirections? flexDirection,
    required GSAlignments? mainAxisAlignment,
    required GSAlignments? crossAxisAlignment,
    required List<Widget> children}) {
  late MainAxisAlignment resolvedMainAxisAlignment;
  late CrossAxisAlignment resolvedCrossAxisAlignment;

  switch (mainAxisAlignment) {
    case GSAlignments.start:
      resolvedMainAxisAlignment = MainAxisAlignment.start;
      break;
    case GSAlignments.center:
      resolvedMainAxisAlignment = MainAxisAlignment.center;
      break;
    case GSAlignments.end:
      resolvedMainAxisAlignment = MainAxisAlignment.end;
      break;
    case GSAlignments.spaceBetween:
      resolvedMainAxisAlignment = MainAxisAlignment.spaceBetween;
      break;
    case GSAlignments.flexEnd:
      resolvedMainAxisAlignment = MainAxisAlignment.end;
      break;
    case GSAlignments.flexStart:
      resolvedMainAxisAlignment = MainAxisAlignment.start;
      break;
    default:
      resolvedMainAxisAlignment = MainAxisAlignment.start;
  }
  switch (crossAxisAlignment) {
    case GSAlignments.start:
      resolvedCrossAxisAlignment = CrossAxisAlignment.start;
      break;
    case GSAlignments.center:
      resolvedCrossAxisAlignment = CrossAxisAlignment.center;
      break;
    case GSAlignments.end:
      resolvedCrossAxisAlignment = CrossAxisAlignment.end;
      break;
    case GSAlignments.flexEnd:
      resolvedCrossAxisAlignment = CrossAxisAlignment.end;
      break;
    case GSAlignments.flexStart:
      resolvedCrossAxisAlignment = CrossAxisAlignment.end;
      break;
    default:
      resolvedCrossAxisAlignment = CrossAxisAlignment.center;
  }

  switch (flexDirection) {
    case GSFlexDirections.row:
      return Row(
        mainAxisAlignment: resolvedMainAxisAlignment,
        crossAxisAlignment: resolvedCrossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    case GSFlexDirections.column:
      return Column(
        mainAxisAlignment: resolvedMainAxisAlignment,
        crossAxisAlignment: resolvedCrossAxisAlignment,
        children: children,
      );
    default:
      return Row(
        mainAxisAlignment: resolvedMainAxisAlignment,
        crossAxisAlignment: resolvedCrossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
  }
}

GSTextTransform? resolveTextTransformFromString(String? gsTextTransform) {
  const textTransformationMap = {
    'uppercase': GSTextTransform.uppercase,
    'lowercase': GSTextTransform.lowercase,
  };

  return gsTextTransform != null
      ? textTransformationMap[gsTextTransform]
      : null;
}

GSCursors? resolveCursorFromString(String? cursor) {
  const Map<String, GSCursors> cusorMap = {
    'pointer': GSCursors.pointer,
    'not-allowed': GSCursors.notAllowed,
  };

  return cursor != null ? cusorMap[cursor] : null;
}

GSPlacements? resolvePlacementFromString(String? placement) {
  const placementMap = {
    'bottom center': GSPlacements.bottomCenter,
    'top center': GSPlacements.topCenter,
    'bottom left': GSPlacements.bottomLeft,
    'bottom right': GSPlacements.bottomRight,
    'top left': GSPlacements.topLeft,
    'top right': GSPlacements.topRight,
  };

  return placement != null ? placementMap[placement] : null;
}

Map<String, GSStyle>? resolveCompoundVariants(
    {required List<Map<String, dynamic>>? compoundVariants}) {
  if (compoundVariants == null || compoundVariants.isEmpty) {
    return null;
  }
  final Map<String, GSStyle> resolvedCompoundVariants = {};
  for (var element in compoundVariants) {
    final keyName = resolveActionFromString(element['action']).toString() +
        resolveVariantFromString(element['variant']).toString();
    resolvedCompoundVariants[keyName] = GSStyle.fromMap(data: element['value']);
  }
  return resolvedCompoundVariants;
}

GSOutlineStyle? resolveOutlineStyleFromString({required String? outlineStyle}) {
  if (outlineStyle == null) {
    return null;
  }
  Map<String, GSOutlineStyle> outlineStyleMap = {
    'solid': GSOutlineStyle.solid,
  };
  return outlineStyleMap[outlineStyle];
}

TextAlign? resolveTextAlignmentFromString(String? textAlign) {
  const textAlignmentMap = {
    'center': TextAlign.center,
    'start': TextAlign.start,
    'end': TextAlign.end,
    'left': TextAlign.left,
    'right': TextAlign.right,
    'justify': TextAlign.justify,
  };

  return textAlign != null ? textAlignmentMap[textAlign] : null;
}
