import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

class GSVariant {
  GSStyle? underlined;
  GSStyle? outline;
  GSStyle? rounded;
  GSStyle? solid;
  GSStyle? link;

  GSVariant({
    this.underlined,
    this.outline,
    this.rounded,
    this.solid,
    this.link,
  });

  factory GSVariant.fromMap({required Map<String, dynamic>? data}) {
    return GSVariant(
      underlined: GSStyle.fromMap(
          data: data?['underlined'], fromVariant: true),
      outline:
          GSStyle.fromMap(data: data?['outline'], fromVariant: true),
      rounded: GSStyle.fromMap(
        data: data?['rounded'],
        fromVariant: true,
      ),
    );
  }
}

class GSSize {
  GSStyle? xs;
  GSStyle? sm;
  GSStyle? md;
  GSStyle? lg;
  GSStyle? xl;

  GSSize({this.xs, this.sm, this.md, this.lg, this.xl});

  factory GSSize.fromMap({required Map<String, dynamic>? data}) {
    return GSSize(
      lg: GSStyle.fromMap(data: data?['lg'], fromVariant: true),
      md: GSStyle.fromMap(data: data?['md'], fromVariant: true),
      sm: GSStyle.fromMap(data: data?['sm'], fromVariant: true),
      xl: GSStyle.fromMap(data: data?['xl'], fromVariant: true),
      xs: GSStyle.fromMap(data: data?['xs'], fromVariant: true),
    );
  }
}

class GSAction {
  GSStyle? primary;
  GSStyle? secondary;
  GSStyle? positive;
  GSStyle? negative;

  GSAction({this.primary, this.secondary, this.positive, this.negative});

  factory GSAction.fromMap({required Map<String, dynamic>? data}) {
    return GSAction(
        primary:
            GSStyle.fromMap(data: data?['primary'], fromVariant: true),
        secondary: GSStyle.fromMap(
            data: data?['secondary'], fromVariant: true),
        positive: GSStyle.fromMap(
            data: data?['positive'], fromVariant: true),
        negative: GSStyle.fromMap(
            data: data?['negative'], fromVariant: true));
  }
}

class Variants {
  GSVariant? variant;
  GSSize? size;
  GSAction? action;

  Variants({
    this.variant,
    this.size,
    this.action,
  });

  factory Variants.fromMap({required Map<String, dynamic>? data}) {
    return Variants(
      size: GSSize.fromMap(
        data: data?['size'],
      ),
      variant: GSVariant.fromMap(
        data: data?['variant'],
      ),
      action: GSAction.fromMap(data: data?['action']),
    );
  }
}

class GSStyle {
  double? borderWidth;
  Color? bg;
  Color? borderColor;
  double? borderRadius;
  EdgeInsetsGeometry? padding;
  double? opacity;
  Color? color;
  double? height;
  double? outlineWidth;
  String? outlineStyle;
  double? borderBottomWidth;
  Color? borderBottomColor;
  TextStyle? textStyle;
  GSStyle? onHover;
  GSStyle? onFocus;
  GSStyle? invaild;
  GSStyle? disabled;
  GSStyle? input;
  GSStyle? icon;
  GSStyle? dark;

  Variants? variants;
  GSStyle({
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.opacity,
    this.color,
    this.invaild,
    this.height,
    this.outlineWidth,
    this.outlineStyle,
    this.borderBottomWidth,
    this.textStyle,
    this.onHover,
    this.onFocus,
    this.disabled,
    this.input,
    this.icon,
    this.dark,
    this.borderBottomColor,
    this.variants,
    this.bg,
  });

  factory GSStyle.fromMap(
      {required Map<String, dynamic>? data, bool fromVariant = false}) {
    return GSStyle(
        height: resolveSpaceFromString(
          data?['h'],
        ),
        bg: resolveColorFromString(data?['bg']),
        borderWidth: data?['borderWidth'] != null
            ? double.tryParse(data!['borderWidth']!.toString())
            : null,
        borderColor: resolveColorFromString(data?['borderColor']),
        borderRadius: data?['borderRadius'] != null
            ? resolveRadiusFromString(data?['borderRadius'].toString())
            : null,
        onHover: GSStyle(
          borderColor: resolveColorFromString(data?[':hover']?['borderColor']),
        ),
        onFocus: GSStyle(
          borderColor: resolveColorFromString(data?[':focus']?['borderColor']),
          onHover: GSStyle(
            borderBottomColor: resolveColorFromString(
              data?[':focus']?[':hover']?['borderColor'],
            ),
          ),
        ),
        disabled: GSStyle(
          opacity: data?[':disabled']?['opacity'],
          onHover: GSStyle(
            borderColor: resolveColorFromString(
              data?[':disabled']?[':hover']?['borderColor'],
            ),
          ),
        ),
        dark: GSStyle(
          borderColor: resolveColorFromString(data?['_dark']?['borderColor']),
          onHover: GSStyle(
            borderColor: resolveColorFromString(
                data?['_dark']?[':hover']?['borderColor']),
          ),
          onFocus: GSStyle(
            borderColor: resolveColorFromString(
              data?['_dark']?[':focus']?['borderColor'],
            ),
            onHover: GSStyle(
              borderColor: resolveColorFromString(
                  data?['_dark']?[':focus']?[':hover']?['borderColor']),
            ),
          ),
          disabled: GSStyle(
            onHover: GSStyle(
              borderColor: resolveColorFromString(
                  data?['_dark']?[':disabled']?[':hover']?['borderColor']),
            ),
          ),
        ),
        variants: fromVariant
            ? null
            : Variants.fromMap(
                data: data?['variants'],
              ));
  }
}

Color? resolveColorFromString(String? color) {
  if (color == null) {
    return null;
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