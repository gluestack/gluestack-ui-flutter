import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/base_style.dart';

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

class GSGeneratedStyle extends BaseStyle<GSGeneratedStyle> {
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
}
