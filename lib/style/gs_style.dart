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

enum GSSizes {
  $2xs,
  $xs,
  $sm,
  $md,
  $lg,
  $xl,
  $2xl,
  $3xl,
  $4xl,
  $5xl,
  $6xl,
  $full
}

enum GSDirection { row, column }

enum GSSpaces { $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $4xl }

enum GSAlignments { start, center, end, spaceBetween, flexEnd }

enum GSOrientations { horizontal, vertical }

class GSProps {
  GSActions? action;
  GSVariants? variant;
  GSSizes? size;
  GSSpaces? space;
  GSStyle? style;
  GSOrientations? orientation;

  GSProps({
    this.action,
    this.variant,
    this.size,
    this.space,
    this.style,
    this.orientation,
  });
  factory GSProps.fromMap({required Map<String, dynamic>? data}) {
    return GSProps(
        action: resolveActionFromString(data?['action']),
        variant: resolveVariantFromString(data?['variant']),
        size: resolveSizesFromString(data?['size']),
        space: resolveSpacesFromString(data?['space']),
        style: GSStyle.fromMap(data: data, fromVariant: true),
        orientation: resolveOrientationsFromString(
          data?['orientation'],
        ));
  }
}

class GSOrientation {
  GSStyle? vertical;
  GSStyle? horizontal;
  GSOrientation({this.horizontal, this.vertical});
  factory GSOrientation.fromMap({required Map<String, dynamic>? data}) {
    return GSOrientation(
      vertical: GSStyle.fromMap(data: data?['vertical'], fromVariant: true),
      horizontal: GSStyle.fromMap(data: data?['horizontal'], fromVariant: true),
    );
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
  factory GSVariant.fromMap(
      {required Map<String, dynamic>? data,
      List<String> descendantStyle = const []}) {
    return GSVariant(
      underlined: GSStyle.fromMap(
          data: data?['underlined'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      outline: GSStyle.fromMap(
          data: data?['outline'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      solid: GSStyle.fromMap(
          data: data?['solid'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      rounded: GSStyle.fromMap(
        data: data?['rounded'],
        descendantStyle: descendantStyle,
        fromVariant: true,
      ),
      link: GSStyle.fromMap(
          data: data?['link'],
          descendantStyle: descendantStyle,
          fromVariant: true),
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
  GSStyle? $3xl;
  GSStyle? $4xl;
  GSStyle? $5xl;
  GSStyle? $6xl;
  GSStyle? $full;

  GSSize(
      {this.$xs,
      this.$sm,
      this.$md,
      this.$lg,
      this.$xl,
      this.$2xl,
      this.$2xs,
      this.$3xl,
      this.$4xl,
      this.$5xl,
      this.$6xl,
      this.$full});
  factory GSSize.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
  }) {
    return GSSize(
      $lg: data?['lg'] != null
          ? GSStyle.fromMap(
              data: data?['lg'],
              descendantStyle: descendantStyle,
              fromVariant: true,
            )
          : null,
      $md: data?['md'] != null
          ? GSStyle.fromMap(
              data: data?['md'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $sm: data?['sm'] != null
          ? GSStyle.fromMap(
              data: data?['sm'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $xl: data?['xl'] != null
          ? GSStyle.fromMap(
              data: data?['xl'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $xs: data?['xs'] != null
          ? GSStyle.fromMap(
              data: data?['xs'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $2xl: data?['2xl'] != null
          ? GSStyle.fromMap(
              data: data?['2xl'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $2xs: data?['2xs'] != null
          ? GSStyle.fromMap(
              data: data?['2xs'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $3xl: data?['3xl'] != null
          ? GSStyle.fromMap(
              data: data?['3xl'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $4xl: data?['4xl'] != null
          ? GSStyle.fromMap(
              data: data?['4xl'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $5xl: data?['5xl'] != null
          ? GSStyle.fromMap(
              data: data?['5xl'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $6xl: data?['6xl'] != null
          ? GSStyle.fromMap(
              data: data?['6xl'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $full: data?['full'] != null
          ? GSStyle.fromMap(data: data?['full'], fromVariant: true)
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
  factory GSAction.fromMap(
      {required Map<String, dynamic>? data,
      List<String> descendantStyle = const []}) {
    return GSAction(
      primary: GSStyle.fromMap(
          data: data?['primary'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      secondary: GSStyle.fromMap(
          data: data?['secondary'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      defaultStyle: GSStyle.fromMap(
          data: data?['default'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      positive: GSStyle.fromMap(
          data: data?['positive'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      negative: GSStyle.fromMap(
          data: data?['negative'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      error: GSStyle.fromMap(
          data: data?['error'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      warning: GSStyle.fromMap(
          data: data?['warning'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      success: GSStyle.fromMap(
          data: data?['success'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      info: GSStyle.fromMap(
          data: data?['info'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      muted: GSStyle.fromMap(
          data: data?['muted'],
          descendantStyle: descendantStyle,
          fromVariant: true),
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
  GSStyle? highlight;
  GSOrientation? orientation;
  Variants({
    this.variant,
    this.size,
    this.action,
    this.space,
    this.highlight,
    this.orientation,
  });

  factory Variants.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
  }) {
    return Variants(
        size: GSSize.fromMap(
            data: data?['size'], descendantStyle: descendantStyle),
        variant: GSVariant.fromMap(
            data: data?['variant'], descendantStyle: descendantStyle),
        action: GSAction.fromMap(
            data: data?['action'], descendantStyle: descendantStyle),
        space: GSSpace.fromMap(
          data: data?['space'],
        ),
        highlight: GSStyle.fromMap(
            data: data?['highlight']?[true],
            descendantStyle: descendantStyle,
            fromVariant: true),
        orientation: GSOrientation.fromMap(data: data?['orientation']));
  }
}

/*

after adding decdent style check need for textStyle

*/

class GSStyle extends BaseStyle<GSStyle> {
  double? borderWidth;
  Color? borderColor;
  double? borderRadius;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  double? opacity;
  Color? color;
  FontWeight? fontWeight;
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
  Map<String, GSStyle?>? descendantStyles;
  GSAlignments? alignItems;
  GSAlignments? justifyContent;
  double? contentWidth;
  double? contentMaxWidth;
  AlignmentGeometry? alignment;

  GSStyle(
      {this.borderWidth,
      this.borderColor,
      this.borderRadius,
      this.padding,
      this.opacity,
      this.color,
      this.bg,
      this.borderBottomColor,
      this.height,
      this.margin,
      this.fontWeight,
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
      this.descendantStyles,
      this.alignItems,
      this.justifyContent,
      this.alignment,
      this.contentMaxWidth,
      this.contentWidth});

  @override
  copy() {
    return this;
  }

  @override
  merge(overrideStyle, {List<String> descendantStyleKeys = const []}) {
    return GSStyle(
      borderColor: overrideStyle?.borderColor ?? borderColor,
      borderRadius: overrideStyle?.borderRadius ?? borderRadius,
      borderWidth: overrideStyle?.borderWidth ?? borderWidth,
      color: overrideStyle?.color ?? props?.style?.color ?? color,
      bg: overrideStyle?.bg ?? bg,
      margin: overrideStyle?.margin ?? margin,
      borderBottomColor: overrideStyle?.borderBottomColor ?? borderBottomColor,
      borderBottomWidth: overrideStyle?.borderBottomWidth ?? borderBottomWidth,
      fontWeight: overrideStyle?.fontWeight ?? fontWeight,
      icon: overrideStyle?.icon ?? icon,
      input: overrideStyle?.input ?? input,
      padding: overrideStyle?.padding ?? padding,
      gap: overrideStyle?.gap ?? gap,
      descendantStyles: 
           mergeStyledMaps(
              styleMap: descendantStyles,
              overrideStyleMap: overrideStyle?.descendantStyles,
              keys: descendantStyleKeys,),
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
      opacity: overrideStyle?.opacity ?? opacity,
      checked: checked != null
          ? checked?.merge(overrideStyle?.checked)
          : overrideStyle?.checked,
      outlineStyle: overrideStyle?.outlineStyle ?? outlineStyle,
      outlineWidth: overrideStyle?.outlineWidth ?? outlineWidth,
      textStyle: overrideStyle?.textStyle != null
          ? TextStyle(
              height: overrideStyle?.textStyle?.height ?? textStyle?.height,
              color: overrideStyle?.textStyle?.color ?? textStyle?.color,
              fontSize:
                  overrideStyle?.textStyle?.fontSize ?? textStyle?.fontSize)
          : textStyle,
      variants: overrideStyle?.variants ?? variants,
      props: GSProps(
        action: overrideStyle?.props?.action ?? props?.action,
        size: overrideStyle?.props?.size ?? props?.size,
        space: overrideStyle?.props?.space ?? props?.space,
        variant: overrideStyle?.props?.variant ?? props?.variant,
        style: overrideStyle?.props?.style != null
            ? overrideStyle?.props?.style!.merge(props?.style)
            : props?.style,
      ),
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
      alignItems: overrideStyle?.alignItems ?? alignItems,
      justifyContent: overrideStyle?.justifyContent ?? justifyContent,
      contentWidth: overrideStyle?.contentWidth ?? contentWidth,
      contentMaxWidth: overrideStyle?.contentMaxWidth ?? contentMaxWidth,
    );
  }

  factory GSStyle.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
    bool fromVariant = false,
  }) {
    return GSStyle(
      descendantStyles: resolvedescendantStylesFromMap(data, descendantStyle),
      height: resolveSpaceFromString(
        data?['h'] ?? data?['height'],
      ),
      width: resolveSpaceFromString(data?['w'] ?? data?['width']),
      fontWeight: resolveFontWeightFromString(data?['fontWeight']),
      //To be removed later
      contentWidth: data?['_content']?['w'] != null
          ? data?['_content']?['w']?.contains('%')
              ? double.tryParse(data?['_content']?['w']?.replaceAll('%', ''))! /
                  100
              : 1
          : null,
      //To be removed later
      contentMaxWidth: data?['_content']?['maxWidth']?.toDouble(),
      padding: data?['p'] != null
          ? resolvePaddingFromString(data?['p'], 'all')
          : data?['px'] != null && data?['py'] != null
              ? resolvePaddingFromString(data?['px'], 'symmetric',
                  paddingy: data?['py'])
              : data?['px'] != null
                  ? resolvePaddingFromString(data?['px'], 'horizontal')
                  : data?['py'] != null
                      ? resolvePaddingFromString(data?['py'], 'vertical')
                      : null,
      // resolvePaddingFromString(data?['p'] ?? data?['px'] ?? data?['py'], ),
      textStyle: TextStyle(
        fontSize: resolveFontSizeFromString(data?['fontSize']),
        height:
            resolveLineHeightFromString(data?['lineHeight'], data?['fontSize']),

        // fontSize: resolveFontSizeFromString(data?['_text']?['props']?['size']),
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
              data: data?['variants'], descendantStyle: descendantStyle),
      props: fromVariant
          ? null
          : GSProps.fromMap(
              data: data?['props'] ?? data?['defaultProps'],
            ),
      alignItems: data?['alignItems'] != null
          ? resolveAlignmentFromString(data?['alignItems'])
          : null,
      justifyContent: data?['justifyContent'] != null
          ? resolveAlignmentFromString(data?['justifyContent'])
          : null,

      ///aaa
    );
  }

  GSStyle? actionMap(GSActions? gsActions) {
    if (gsActions == null) {
      return null;
    }
    switch (gsActions) {
      case GSActions.primary:
        return variants?.action?.primary;
      case GSActions.secondary:
        return variants?.action?.secondary;
      case GSActions.positive:
        return variants?.action?.secondary;
      case GSActions.negative:
        return variants?.action?.negative;
      case GSActions.error:
        return variants?.action?.error;
      case GSActions.warning:
        return variants?.action?.warning;
      case GSActions.success:
        return variants?.action?.success;
      case GSActions.info:
        return variants?.action?.info;
      case GSActions.muted:
        return variants?.action?.muted;
      default:
        return null;
    }
  }

  GSStyle? variantMap(GSVariants? gsVariants) {
    if (gsVariants == null) {
      return null;
    }
    switch (gsVariants) {
      case GSVariants.solid:
        return variants?.variant?.solid;
      case GSVariants.outline:
        return variants?.variant?.outline;
      case GSVariants.link:
        return variants?.variant?.link;
      case GSVariants.underlined:
        return variants?.variant?.underlined;
      case GSVariants.rounded:
        return variants?.variant?.rounded;
      default:
        return null;
    }
  }

  GSStyle? sizeMap(GSSizes? gsSizes) {
    if (gsSizes == null) {
      return null;
    }
    switch (gsSizes) {
      case GSSizes.$2xs:
        return variants?.size?.$2xs;
      case GSSizes.$xs:
        return variants?.size?.$xs;
      case GSSizes.$sm:
        return variants?.size?.$sm;
      case GSSizes.$md:
        return variants?.size?.$md;
      case GSSizes.$lg:
        return variants?.size?.$lg;
      case GSSizes.$xl:
        return variants?.size?.$xl;
      case GSSizes.$2xl:
        return variants?.size?.$2xl;
      case GSSizes.$3xl:
        return variants?.size?.$3xl;
      case GSSizes.$4xl:
        return variants?.size?.$4xl;
      case GSSizes.$5xl:
        return variants?.size?.$5xl;
      case GSSizes.$6xl:
        return variants?.size?.$6xl;
      case GSSizes.$full:
        return variants?.size?.$full;
    }
  }
}
