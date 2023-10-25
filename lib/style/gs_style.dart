import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/base_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/utils/resolver.dart';

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
      underlined: GSStyle.fromMap(data: data?['underlined'], fromVariant: true),
      outline: GSStyle.fromMap(data: data?['outline'], fromVariant: true),
      rounded: GSStyle.fromMap(
        data: data?['rounded'],
        fromVariant: true,
      ),
      link: GSStyle.fromMap(data: data?['link'], fromVariant: true),
    );
  }
}

class GSSize {
  GSStyle? xs;
  GSStyle? sm;
  GSStyle? md;
  GSStyle? lg;
  GSStyle? xl;

  GSSize({
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });
  factory GSSize.fromMap({required Map<String, dynamic>? data}) {
    return GSSize(
      lg: GSStyle.fromMap(
        data: data?['lg'],
        fromVariant: true,
      ),
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
  GSStyle? defaultStyle;
  GSAction({
    this.primary,
    this.secondary,
    this.positive,
    this.negative,
    this.defaultStyle,
  });
  factory GSAction.fromMap({required Map<String, dynamic>? data}) {
    return GSAction(
        primary: GSStyle.fromMap(data: data?['primary'], fromVariant: true),
        secondary: GSStyle.fromMap(data: data?['secondary'], fromVariant: true),
        defaultStyle:
            GSStyle.fromMap(data: data?['default'], fromVariant: true),
        positive: GSStyle.fromMap(data: data?['positive'], fromVariant: true),
        negative: GSStyle.fromMap(data: data?['negative'], fromVariant: true));
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

class GSStyle extends BaseStyle<GSStyle> {
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

  GSStyle({
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
  merge(overrideStyle) {
    return GSStyle(
      borderColor: overrideStyle?.borderColor ?? borderColor,
      borderRadius: overrideStyle?.borderRadius ?? borderRadius,
      borderWidth: overrideStyle?.borderWidth ?? borderWidth,
      color: overrideStyle?.color ?? color,
      bg: overrideStyle?.bg ?? bg,
      borderBottomColor: overrideStyle?.borderBottomColor ?? borderBottomColor,
      borderBottomWidth: overrideStyle?.borderBottomWidth ?? borderBottomWidth,
      disabled: overrideStyle?.disabled ?? disabled,
      icon: overrideStyle?.icon ?? icon,
      input: overrideStyle?.input ?? input,
      padding: overrideStyle?.padding ?? padding,
      invaild: overrideStyle?.invaild ?? invaild,
      onFocus: overrideStyle?.onFocus ?? onFocus,
      onHover: overrideStyle?.onHover ?? onHover,
      opacity: overrideStyle?.opacity ?? opacity,
      outlineStyle: overrideStyle?.outlineStyle ?? outlineStyle,
      outlineWidth: overrideStyle?.outlineWidth ?? outlineWidth,
      textStyle: overrideStyle?.textStyle != null
          ? TextStyle(
              color: overrideStyle?.textStyle?.color ?? textStyle?.color,
              fontSize:
                  overrideStyle?.textStyle?.fontSize ?? textStyle?.fontSize)
          : textStyle,
      variants: overrideStyle?.variants ?? variants,
      width: overrideStyle?.width ?? width,
      height: overrideStyle?.height ?? height,
      dark: overrideStyle?.dark ?? dark,
      lg: overrideStyle?.lg ?? lg,
      md: overrideStyle?.md ?? md,
      sm: overrideStyle?.sm ?? sm,
      xs: overrideStyle?.xs ?? xs,
    );
  }

  factory GSStyle.fromMap({
    required Map<String, dynamic>? data,
    bool fromVariant = false,
  }) {
    return GSStyle(
      height: resolveSpaceFromString(
        data?['h'],
      ),
      textStyle: TextStyle(
        fontSize: resolveFontSizeFromString(data?['_text']?['props']?['size']),
        color: resolveColorFromString(
          data?['_text']?['color'],
        ),
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
        textStyle: TextStyle(
            color: resolveColorFromString(data?['_text']?['_dark']?['color'])),
        borderColor: resolveColorFromString(data?['_dark']?['borderColor']),
        bg: resolveColorFromString(data?['_dark']?['bg']),
        onHover: GSStyle(
          borderColor:
              resolveColorFromString(data?['_dark']?[':hover']?['borderColor']),
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
            ),
    );
  }
}
