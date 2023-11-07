import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/base_style.dart';
import 'package:gluestack_flutter_pro/utils/resolver.dart';

enum GSActions {
  primary,
  secondary,
  positive,
  negative,
  error,
  warning,
  success,
  info,
  muted
}
enum GSBorderRadius { $none, $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $full }

enum GSVariants { solid, outline, link, underlined, rounded }

enum GSSizes { $2xs, $xs, $sm, $md, $lg, $xl, $2xl }

enum GSDirection { row, column }

enum GSSpaces { $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $4xl }

class GSProps {
  GSActions? action;
  GSVariants? variant;
  GSSizes? size;
  GSSpaces? space;

  GSProps({
    this.action,
    this.variant,
    this.size,
    this.space,
  });
  factory GSProps.fromMap({required Map<String, dynamic>? data}) {
    return GSProps(
        action: resolveActionFromString(data?['action']),
        variant: resolveVariantFromString(data?['variant']),
        size: resolveSizesFromString(data?['size']),
        space: resolveSpacesFromString(data?['space']));
  }
}

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
  GSStyle? $xs;
  GSStyle? $sm;
  GSStyle? $md;
  GSStyle? $lg;
  GSStyle? $xl;
  GSStyle? $2xs;
  GSStyle? $2xl;

  GSSize(
      {this.$xs, this.$sm, this.$md, this.$lg, this.$xl, this.$2xl, this.$2xs});
  factory GSSize.fromMap({required Map<String, dynamic>? data}) {
    return GSSize(
      $lg: data?['lg'] != null
          ? GSStyle.fromMap(
              data: data?['lg'],
              fromVariant: true,
            )
          : null,
      $md: data?['md'] != null
          ? GSStyle.fromMap(data: data?['md'], fromVariant: true)
          : null,
      $sm: data?['sm'] != null
          ? GSStyle.fromMap(data: data?['sm'], fromVariant: true)
          : null,
      $xl: data?['xl'] != null
          ? GSStyle.fromMap(data: data?['xl'], fromVariant: true)
          : null,
      $xs: data?['xs'] != null
          ? GSStyle.fromMap(data: data?['xs'], fromVariant: true)
          : null,
      $2xl: data?['2xl'] != null
          ? GSStyle.fromMap(data: data?['2xl'], fromVariant: true)
          : null,
      $2xs: data?['2xs'] != null
          ? GSStyle.fromMap(data: data?['2xs'], fromVariant: true)
          : null,
    );
  }
}

class GSAction {
  GSStyle? primary;
  GSStyle? secondary;
  GSStyle? positive;
  GSStyle? negative;
  GSStyle? defaultStyle;
  GSStyle? error;
  GSStyle? warning;
  GSStyle? success;
  GSStyle? info;
  GSStyle? muted;
  GSAction(
      {this.primary,
      this.secondary,
      this.positive,
      this.negative,
      this.defaultStyle,
      this.error,
      this.warning,
      this.success,
      this.info,
      this.muted});
  factory GSAction.fromMap({required Map<String, dynamic>? data}) {
    return GSAction(
      primary: GSStyle.fromMap(data: data?['primary'], fromVariant: true),
      secondary: GSStyle.fromMap(data: data?['secondary'], fromVariant: true),
      defaultStyle: GSStyle.fromMap(data: data?['default'], fromVariant: true),
      positive: GSStyle.fromMap(data: data?['positive'], fromVariant: true),
      negative: GSStyle.fromMap(data: data?['negative'], fromVariant: true),
      error: GSStyle.fromMap(data: data?['error'], fromVariant: true),
      warning: GSStyle.fromMap(data: data?['warning'], fromVariant: true),
      success: GSStyle.fromMap(data: data?['success'], fromVariant: true),
      info: GSStyle.fromMap(data: data?['info'], fromVariant: true),
      muted: GSStyle.fromMap(data: data?['muted'], fromVariant: true),
    );
  }
}

class GSSpace {
  GSStyle? $xs;
  GSStyle? $sm;
  GSStyle? $md;
  GSStyle? $lg;
  GSStyle? $xl;
  GSStyle? $2xl;
  GSStyle? $3xl;
  GSStyle? $4xl;

  GSSpace({
    this.$xs,
    this.$sm,
    this.$md,
    this.$lg,
    this.$xl,
    this.$2xl,
    this.$3xl,
    this.$4xl,
  });
  factory GSSpace.fromMap({required Map<String, dynamic>? data}) {
    return GSSpace(
      $xs: data?['xs'] != null
          ? GSStyle.fromMap(data: data?['xs'], fromVariant: true)
          : null,
      $sm: data?['sm'] != null
          ? GSStyle.fromMap(data: data?['sm'], fromVariant: true)
          : null,
      $md: data?['md'] != null
          ? GSStyle.fromMap(data: data?['md'], fromVariant: true)
          : null,
      $lg: data?['lg'] != null
          ? GSStyle.fromMap(
              data: data?['lg'],
              fromVariant: true,
            )
          : null,
      $xl: data?['xl'] != null
          ? GSStyle.fromMap(data: data?['xl'], fromVariant: true)
          : null,
      $2xl: data?['2xl'] != null
          ? GSStyle.fromMap(data: data?['2xl'], fromVariant: true)
          : null,
      $3xl: data?['3xl'] != null
          ? GSStyle.fromMap(data: data?['3xl'], fromVariant: true)
          : null,
      $4xl: data?['4xl'] != null
          ? GSStyle.fromMap(data: data?['4xl'], fromVariant: true)
          : null,
    );
  }
}

class Variants {
  GSVariant? variant;
  GSSize? size;
  GSAction? action;
  GSSpace? space;

  Variants({
    this.variant,
    this.size,
    this.action,
    this.space,
  });

  factory Variants.fromMap({required Map<String, dynamic>? data}) {
    return Variants(
      size: GSSize.fromMap(data: data?['size']),
      variant: GSVariant.fromMap(data: data?['variant']),
      action: GSAction.fromMap(data: data?['action']),
      space: GSSpace.fromMap(data: data?['space']),
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
  double? gap;
  Color? borderBottomColor;
  double? height;
  double? width;
  double? outlineWidth;
  String? outlineStyle;
  double? borderBottomWidth;
  TextStyle? textStyle;
  GSStyle? checked;
  Variants? variants;
  GSProps? props;

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
    this.gap,
    this.outlineWidth,
    this.outlineStyle,
    this.borderBottomWidth,
    this.textStyle,
    this.checked,
    super.onHover,
    super.onFocus,
    super.onActive,
    super.onDisabled,
    super.input,
    super.icon,
    super.dark,
    super.xs,
    super.sm,
    super.md,
    super.lg,
    super.onInvaild,
    super.web,
    super.ios,
    super.android,
    this.variants,
    this.props,
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
      icon: overrideStyle?.icon ?? icon,
      input: overrideStyle?.input ?? input,
      padding: overrideStyle?.padding ?? padding,
      gap: overrideStyle?.gap ?? gap,
      onFocus: onFocus != null
          ? onFocus?.merge(overrideStyle?.onFocus)
          : overrideStyle?.onFocus,
      onHover: onHover != null
          ? onHover?.merge(overrideStyle?.onHover)
          : overrideStyle?.onHover,
      onActive: onActive != null
          ? onActive?.merge(overrideStyle?.onActive)
          : overrideStyle?.onActive,
      onDisabled: onDisabled != null
          ? onDisabled?.merge(overrideStyle?.onDisabled)
          : overrideStyle?.onDisabled,
      onInvaild: onInvaild != null
          ? onInvaild?.merge(overrideStyle?.onInvaild)
          : overrideStyle?.onInvaild,
      // onDisabled: overrideStyle?.onDisabled ?? onDisabled,
      // onInvaild: overrideStyle?.onInvaild ?? onInvaild,
      // onFocus: overrideStyle?.onFocus?.merge(onFocus) ?? onFocus,
      // onHover: overrideStyle?.onHover?.merge(onHover) ?? onHover,
      // onActive: overrideStyle?.onActive ?? onActive,
      opacity: overrideStyle?.opacity ?? opacity,
      checked: checked != null
          ? checked?.merge(overrideStyle?.checked)
          : overrideStyle?.checked,
      // checked: overrideStyle?.checked ?? checked,
      outlineStyle: overrideStyle?.outlineStyle ?? outlineStyle,
      outlineWidth: overrideStyle?.outlineWidth ?? outlineWidth,
      textStyle: overrideStyle?.textStyle != null
          ? TextStyle(
              color: overrideStyle?.textStyle?.color ?? textStyle?.color,
              fontSize:
                  overrideStyle?.textStyle?.fontSize ?? textStyle?.fontSize)
          : textStyle,
      variants: overrideStyle?.variants ?? variants,
      props: overrideStyle?.props ?? props,
      width: overrideStyle?.width ?? width,
      height: overrideStyle?.height ?? height,
      dark: overrideStyle?.dark ?? dark,
      lg: overrideStyle?.lg ?? lg,
      md: overrideStyle?.md ?? md,
      sm: overrideStyle?.sm ?? sm,
      xs: overrideStyle?.xs ?? xs,
      web: overrideStyle?.web ?? web,
      ios: overrideStyle?.ios ?? ios,
      android: overrideStyle?.android ?? android,
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
      width: resolveSpaceFromString(data?['w']),
      textStyle: TextStyle(
        fontSize: resolveFontSizeFromString(data?['_text']?['props']?['size']),
        color: resolveColorFromString(
          data?['_text']?['color'],
        ),
      ),
      color: resolveColorFromString(data?['color']),
      bg: resolveColorFromString(data?['bg']),
      borderWidth: data?['borderWidth'] != null
          ? double.tryParse(data!['borderWidth']!.toString())
          : null,
      gap: resolveSpaceFromString(data?['gap']),
      borderColor: resolveColorFromString(data?['borderColor']),
      borderRadius: data?['borderRadius'] != null
          ? resolveRadiusFromString(data?['borderRadius'].toString())
          : null,
      borderBottomWidth: data?['borderBottomWidth'] != null
          ? resolveBorderWidthFromString(data?['borderBottomWidth'].toString())
          : null,
      checked: GSStyle(
          color: resolveColorFromString(data?[':checked']?['color']),
          onHover: GSStyle(
              color: resolveColorFromString(
                  data?[':checked']?[':hover']?['color']))),
      onHover: GSStyle(
        color: resolveColorFromString(data?[':hover']?['color']),
        checked: GSStyle(
            color:
                resolveColorFromString(data?[':hover']?[':checked']?['color'])),
        bg: resolveColorFromString(data?[':hover']?['bg']),
        borderColor: resolveColorFromString(
          data?[':hover']?['borderColor'],
        ),
      ),
      onFocus: GSStyle(
        borderColor: resolveColorFromString(data?[':focus']?['borderColor']),
        bg: resolveColorFromString(data?[':focus']?['bg']),
        borderBottomColor:
            resolveColorFromString(data?[':focus']?['borderBottomColor']),
        onHover: GSStyle(
          borderBottomColor: resolveColorFromString(
            data?[':focus']?[':hover']?['borderColor'],
          ),
        ),
      ),
      onActive: GSStyle(
        bg: resolveColorFromString(data?[':active']?['bg']),
        borderColor: resolveColorFromString(data?[':active']?['borderColor']),
        borderBottomColor:
            resolveColorFromString(data?[':active']?['borderBottomColor']),
      ),
      onInvaild: GSStyle(
        bg: resolveColorFromString(data?[':invalid']?['bg']),
        borderColor: resolveColorFromString(data?[':invalid']?['borderColor']),
        borderBottomColor:
            resolveColorFromString(data?[':invalid']?['borderBottomColor']),
        onHover: GSStyle(
          borderColor: resolveColorFromString(
              data?[':invalid']?[':hover']?['borderColor']),
          borderBottomColor: resolveColorFromString(
              data?[':invalid']?[':hover']?['borderBottomColor']),
        ),
        onFocus: GSStyle(
          borderColor: resolveColorFromString(
              data?[':invalid']?[':focus']?['borderColor']),
          borderBottomColor: resolveColorFromString(
              data?[':invalid']?[':focus']?['borderBottomColor']),
        ),
        onDisabled: GSStyle(
          borderColor: resolveColorFromString(
              data?[':invalid']?[':disabled']?[':hover']?['borderColor']),
          borderBottomColor: resolveColorFromString(
              data?[':invalid']?[':disabled']?[':hover']?['borderBottomColor']),
        ),
      ),
      onDisabled: GSStyle(
        opacity: data?[':disabled']?['opacity'],
        onHover: GSStyle(
          borderColor: resolveColorFromString(
            data?[':disabled']?[':hover']?['borderColor'],
          ),
        ),
      ),
      dark: GSStyle(
        color: resolveColorFromString((data?['_dark']?['color'])),
        textStyle: TextStyle(
            color: resolveColorFromString(data?['_text']?['_dark']?['color'])),
        borderColor: resolveColorFromString(data?['_dark']?['borderColor']),
        bg: resolveColorFromString(data?['_dark']?['bg']),
        checked: GSStyle(
            color:
                resolveColorFromString(data?['_dark']?[':checked']?['color']),
            onHover: GSStyle(
                color: resolveColorFromString(
                    data?['_dark']?[':checked']?[':hover']?['color']))),
        onHover: GSStyle(
          color: resolveColorFromString(data?['_dark']?[':hover']?['color']),
          checked: GSStyle(
            color: resolveColorFromString(
                data?['_dark']?[':hover']?[':checked']?['color']),
          ),
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
        onDisabled: GSStyle(
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
      props: fromVariant
          ? null
          : GSProps.fromMap(
              data: data?['props'] ?? data?['defaultProps'],
            ),
    );
  }
}
