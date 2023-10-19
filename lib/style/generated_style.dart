import 'package:flutter/material.dart';

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
}

class GSAction {
  GSGeneratedStyle? primary;
  GSGeneratedStyle? secondary;
  GSGeneratedStyle? positive;
  GSGeneratedStyle? negative;

  GSAction({this.primary, this.secondary, this.positive, this.negative});
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
}

class GSGeneratedStyle {
  double? borderWidth;
  Color? borderColor;
  double? borderRadius;
  EdgeInsetsGeometry? padding;
  double? opacity;
  Color? color;
  double? height;
  double? width;
  double? outlineWidth;
  String? outlineStyle;
  double? borderBottomWidth;
  TextStyle? textStyle;
  GSGeneratedStyle? onHover;
  GSGeneratedStyle? onFocus;
  GSGeneratedStyle? disabled;
  GSGeneratedStyle? input;
  GSGeneratedStyle? icon;
  GSGeneratedStyle? dark;
  GSGeneratedStyle? invaild;
  Variants? variants;
  GSGeneratedStyle({
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.opacity,
    this.color,
    this.height,
    this.width,
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
    this.invaild,
    this.variants,
  });
}
