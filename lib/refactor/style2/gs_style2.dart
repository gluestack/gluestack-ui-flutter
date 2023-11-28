import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/base_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/utils/resolver.dart';

enum GSFlexDirections { row, column }

class GSStyle2 extends BaseStyle<GSStyle2> {
  //all double values
  double? borderRadius;

  // all color values
  Color? backgroundColor;
  Color? borderColor;

  //all string values

  //all textStyle related values
  FontWeight? fontWeight;

  //all flexDirection values
  GSFlexDirections? flexDirection;
  GSAlignments? justifyContent;
  GSAlignments? alignItems;

  //nested styles

  GSStyle2? dark;

  GSStyle2({
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.flexDirection,
    this.fontWeight,
    this.justifyContent,
    this.alignItems,
    this.dark,
  });

  factory GSStyle2.fromMap(
      {required Map<String, dynamic>? data, bool fromSelf = false}) {
    return GSStyle2(
        borderRadius: resolveRadiusFromString(data?['borderRadius']),
        backgroundColor: resolveColorFromString(data?['backgroundColor']),
        borderColor: resolveColorFromString(data?['borderColor']),
        flexDirection: resolveFlexDirectionFromString(data?['flexDirection']),
        justifyContent: resolveAlignmentFromString(data?['justifyContent']),
        alignItems: resolveAlignmentFromString(data?['alignItems']),
        fontWeight: resolveFontWeightFromString(data?['fontWeight']),
        dark: !fromSelf
            ? GSStyle2.fromMap(data: data?['_dark'], fromSelf: true)
            : null);
  }

  @override
  copy() {
    return this;
  }

  @override
  GSStyle2 merge(GSStyle2? overrideStyle) {
    // TODO: implement merge
    throw UnimplementedError();
  }

  @override
  merge2(GSStyle2? overrideStyle) {
    borderRadius = overrideStyle?.borderRadius ?? borderRadius;
    backgroundColor = overrideStyle?.backgroundColor ?? backgroundColor;
    borderColor = overrideStyle?.borderColor ?? borderColor;
    flexDirection = overrideStyle?.flexDirection ?? flexDirection;
    justifyContent = overrideStyle?.justifyContent ?? justifyContent;
    alignItems = overrideStyle?.alignItems ?? alignItems;
    fontWeight = overrideStyle?.fontWeight ?? fontWeight;
    dark =
        dark != null ? dark!.merge2(overrideStyle?.dark) : overrideStyle?.dark;
  }
}
