import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/base_style.dart';
import 'package:gluestack_flutter_pro/token/color_token.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

class GSVariant {
  GSGeneratedStyle? underlined;
  GSGeneratedStyle? outline;
  GSGeneratedStyle? rounded;
  GSGeneratedStyle? solid;
  GSGeneratedStyle? link;

  GSVariant({
    this.underlined,
    this.outline,
    this.rounded,
    this.solid,
    this.link,
  });
  factory GSVariant.fromMap({required Map<String, dynamic>? data}) {
    return GSVariant(
      underlined: GSGeneratedStyle.fromMap(
          data: data?['underlined'], fromVariant: true),
      outline:
          GSGeneratedStyle.fromMap(data: data?['outline'], fromVariant: true),
      rounded: GSGeneratedStyle.fromMap(
        data: data?['rounded'],
        fromVariant: true,
      ),
      link: GSGeneratedStyle.fromMap(data: data?['link'], fromVariant: true),
    );
  }
}

class GSSize {
  GSGeneratedStyle? xs;
  GSGeneratedStyle? sm;
  GSGeneratedStyle? md;
  GSGeneratedStyle? lg;
  GSGeneratedStyle? xl;

  GSSize({
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });
  factory GSSize.fromMap({required Map<String, dynamic>? data}) {
    return GSSize(
      lg: GSGeneratedStyle.fromMap(data: data?['lg'], fromVariant: true),
      md: GSGeneratedStyle.fromMap(data: data?['md'], fromVariant: true),
      sm: GSGeneratedStyle.fromMap(data: data?['sm'], fromVariant: true),
      xl: GSGeneratedStyle.fromMap(data: data?['xl'], fromVariant: true),
      xs: GSGeneratedStyle.fromMap(data: data?['xs'], fromVariant: true),
    );
  }
}

class GSAction {
  GSGeneratedStyle? primary;
  GSGeneratedStyle? secondary;
  GSGeneratedStyle? positive;
  GSGeneratedStyle? negative;
  GSGeneratedStyle? defaultStyle;
  GSAction({
    this.primary,
    this.secondary,
    this.positive,
    this.negative,
    this.defaultStyle,
  });
  factory GSAction.fromMap({required Map<String, dynamic>? data}) {
    return GSAction(
        primary:
            GSGeneratedStyle.fromMap(data: data?['primary'], fromVariant: true),
        secondary: GSGeneratedStyle.fromMap(
            data: data?['secondary'], fromVariant: true),
        defaultStyle:
            GSGeneratedStyle.fromMap(data: data?['default'], fromVariant: true),
        positive: GSGeneratedStyle.fromMap(
            data: data?['positive'], fromVariant: true),
        negative: GSGeneratedStyle.fromMap(
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
        data: data?['variant']['size'],
      ),
      variant: GSVariant.fromMap(
        data: data?['variant'],
      ),
      action: GSAction.fromMap(data: data?['action']),
    );
  }
}

class GSGeneratedStyle extends BaseStyle<GSGeneratedStyle> {
  double? borderWidth;
  Color? borderColor;
  double? borderRadius;
  EdgeInsetsGeometry? padding;
  double? opacity;
  Color? color;
  Color? bg;
  Color? borderBottomColor;
  double? height;
  double? width;
  double? outlineWidth;
  String? outlineStyle;
  double? borderBottomWidth;
  TextStyle? textStyle;
  Variants? variants;

  GSGeneratedStyle({
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.opacity,
    this.color,
    this.bg,
    this.borderBottomColor,
    this.height,
    this.width,
    this.outlineWidth,
    this.outlineStyle,
    this.borderBottomWidth,
    this.textStyle,
    super.onHover,
    super.onFocus,
    super.disabled,
    super.input,
    super.icon,
    super.dark,
    super.xs,
    super.sm,
    super.md,
    super.lg,
    super.invaild,
    this.variants,
  });

  @override
  copy() {
    return this;
  }

  @override
  merge(other) {
    return GSGeneratedStyle(
      borderColor: other?.borderColor ?? borderColor,
      borderRadius: other?.borderRadius ?? borderRadius,
      borderWidth: other?.borderWidth ?? borderWidth,
      color: other?.color ?? color,
      bg: other?.bg ?? bg,
      borderBottomColor: other?.borderBottomColor ?? borderBottomColor,
      borderBottomWidth: other?.borderBottomWidth ?? borderBottomWidth,
      disabled: other?.disabled ?? disabled,
      icon: other?.icon ?? icon,
      input: other?.input ?? input,
      padding: other?.padding ?? padding,
      invaild: other?.invaild ?? invaild,
      onFocus: other?.onFocus ?? onFocus,
      onHover: other?.onHover ?? onHover,
      opacity: other?.opacity ?? opacity,
      outlineStyle: other?.outlineStyle ?? outlineStyle,
      outlineWidth: other?.outlineWidth ?? outlineWidth,
      textStyle: other?.textStyle ?? textStyle,
      variants: other?.variants ?? variants,
      width: other?.width ?? width,
      height: other?.height ?? height,
      dark: other?.dark ?? dark,
      lg: other?.lg ?? lg,
      md: other?.md ?? md,
      sm: other?.sm ?? sm,
      xs: other?.xs ?? xs,
    );
  }

  factory GSGeneratedStyle.fromMap(
      {required Map<String, dynamic>? data, bool fromVariant = false}) {
    return GSGeneratedStyle(
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
      onHover: GSGeneratedStyle(
        borderColor: resolveColorFromString(data?[':hover']?['borderColor']),
      ),
      onFocus: GSGeneratedStyle(
        borderColor: resolveColorFromString(data?[':focus']?['borderColor']),
        onHover: GSGeneratedStyle(
          borderBottomColor: resolveColorFromString(
            data?[':focus']?[':hover']?['borderColor'],
          ),
        ),
      ),
      disabled: GSGeneratedStyle(
        opacity: data?[':disabled']?['opacity'],
        onHover: GSGeneratedStyle(
          borderColor: resolveColorFromString(
            data?[':disabled']?[':hover']?['borderColor'],
          ),
        ),
      ),
      dark: GSGeneratedStyle(
        borderColor: resolveColorFromString(data?['_dark']?['borderColor']),
        bg: resolveColorFromString(data?['_dark']?['bg']),
        onHover: GSGeneratedStyle(
          borderColor:
              resolveColorFromString(data?['_dark']?[':hover']?['borderColor']),
        ),
        onFocus: GSGeneratedStyle(
          borderColor: resolveColorFromString(
            data?['_dark']?[':focus']?['borderColor'],
          ),
          onHover: GSGeneratedStyle(
            borderColor: resolveColorFromString(
                data?['_dark']?[':focus']?[':hover']?['borderColor']),
          ),
        ),
        disabled: GSGeneratedStyle(
          onHover: GSGeneratedStyle(
            borderColor: resolveColorFromString(
                data?['_dark']?[':disabled']?[':hover']?['borderColor']),
          ),
        ),
      ),
      variants: fromVariant
          ? null
          : Variants.fromMap(
              data: data?['variants'],
            ),
    );
  }
}

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
