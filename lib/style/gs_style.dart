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
  muted,
  attention,
}

enum GSTextTransform { uppercase, lowercase }

enum GSBorderRadius { $none, $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $full }

enum GSVariants { solid, outline, link, underlined, rounded, accent }

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

enum GSSpaces { $none, $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $4xl }

enum GSAlignments { start, center, end, spaceBetween, flexEnd, flexStart }

enum GSOrientations { horizontal, vertical }

enum GSFlexDirections { row, column }

enum GSCursors { pointer, notAllowed }

class GSProps {
  GSActions? action;
  GSVariants? variant;
  GSSizes? size;
  GSSpaces? space;
  GSStyle? style;
  GSOrientations? orientation;
  Color? color;

  GSProps({
    this.action,
    this.variant,
    this.size,
    this.space,
    this.style,
    this.orientation,
    this.color,
  });
  factory GSProps.fromMap({required Map<String, dynamic>? data}) {
    return GSProps(
        action: resolveActionFromString(data?['action']),
        variant: resolveVariantFromString(data?['variant']),
        size: resolveSizesFromString(data?['size']),
        space: resolveSpacesFromString(data?['space']),
        style: GSStyle.fromMap(data: data, fromVariant: true),
        color: resolveColorFromString(data?['color']),
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
  GSStyle? accent;

  GSVariant({
    this.underlined,
    this.outline,
    this.rounded,
    this.solid,
    this.link,
    this.accent,
  });
  factory GSVariant.fromMap(
      {required Map<String, dynamic>? data,
      List<String> descendantStyle = const []}) {
    return GSVariant(
      underlined: parseMap(data?['underlined'])
          ? GSStyle.fromMap(
              data: data?['underlined'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      outline: parseMap(data?['outline'])
          ? GSStyle.fromMap(
              data: data?['outline'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      solid: parseMap(data?['solid'])
          ? GSStyle.fromMap(
              data: data?['solid'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      rounded: parseMap(data?['rounded'])
          ? GSStyle.fromMap(
              data: data?['rounded'],
              descendantStyle: descendantStyle,
              fromVariant: true,
            )
          : null,
      link: parseMap(data?['link'])
          ? GSStyle.fromMap(
              data: data?['link'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      accent: parseMap(data?['accent'])
          ? GSStyle.fromMap(
              data: data?['accent'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
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
      $lg: parseMap(data?['lg'])
          ? GSStyle.fromMap(
              data: data?['lg'],
              descendantStyle: descendantStyle,
              fromVariant: true,
            )
          : null,
      $md: parseMap(data?['md'])
          ? GSStyle.fromMap(
              data: data?['md'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $sm: parseMap(data?['sm'])
          ? GSStyle.fromMap(
              data: data?['sm'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $xl: parseMap(data?['xl'])
          ? GSStyle.fromMap(
              data: data?['xl'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $xs: parseMap(data?['xs'])
          ? GSStyle.fromMap(
              data: data?['xs'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $2xl: parseMap(data?['2xl'])
          ? GSStyle.fromMap(
              data: data?['2xl'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $2xs: parseMap(data?['2xs'])
          ? GSStyle.fromMap(
              data: data?['2xs'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $3xl: parseMap(data?['3xl'])
          ? GSStyle.fromMap(
              data: data?['3xl'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $4xl: parseMap(data?['4xl'])
          ? GSStyle.fromMap(
              data: data?['4xl'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $5xl: parseMap(data?['5xl'])
          ? GSStyle.fromMap(
              data: data?['5xl'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $6xl: parseMap(data?['6xl'])
          ? GSStyle.fromMap(
              data: data?['6xl'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      $full: parseMap(data?['full'])
          ? GSStyle.fromMap(
              data: data?['full'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
    );
  }

  GSSize merge(GSSize? overrideStyle) {
    return GSSize(
      $2xl: $2xl?.merge(overrideStyle?.$2xl) ?? overrideStyle?.$2xl,
      $2xs: $2xs?.merge(overrideStyle?.$2xs) ?? overrideStyle?.$2xs,
      $3xl: $3xl?.merge(overrideStyle?.$3xl) ?? overrideStyle?.$3xl,
      $4xl: $4xl?.merge(overrideStyle?.$2xl) ?? overrideStyle?.$4xl,
      $5xl: $5xl?.merge(overrideStyle?.$5xl) ?? overrideStyle?.$5xl,
      $6xl: $6xl?.merge(overrideStyle?.$6xl) ?? overrideStyle?.$6xl,
      $lg: $lg?.merge(overrideStyle?.$lg) ?? overrideStyle?.$lg,
      $md: $md?.merge(overrideStyle?.$md) ?? overrideStyle?.$md,
      $sm: $sm?.merge(overrideStyle?.$sm) ?? overrideStyle?.$sm,
      $xl: $xl?.merge(overrideStyle?.$xl) ?? overrideStyle?.$xl,
      $xs: $xs?.merge(overrideStyle?.$2xl) ?? overrideStyle?.$xs,
      $full: $full?.merge(overrideStyle?.$full) ?? overrideStyle?.$full,
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
  GSStyle? attention;
  GSAction({
    this.primary,
    this.secondary,
    this.positive,
    this.negative,
    this.defaultStyle,
    this.error,
    this.warning,
    this.success,
    this.info,
    this.muted,
    this.attention,
  });
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
      attention: GSStyle.fromMap(
          data: data?['attention'],
          descendantStyle: descendantStyle,
          fromVariant: true),
    );
  }
}

class GSSpace {
  GSStyle? $none;
  GSStyle? $xs;
  GSStyle? $sm;
  GSStyle? $md;
  GSStyle? $lg;
  GSStyle? $xl;
  GSStyle? $2xl;
  GSStyle? $3xl;
  GSStyle? $4xl;

  GSSpace({
    this.$none,
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
      $none: data?['none'] != null
          ? GSStyle.fromMap(data: data?['none'], fromVariant: true)
          : null,
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
  //try to make these properties of heading into a single class
  GSStyle? highlight;
  GSStyle? sub;
  GSOrientation? orientation;
  Variants({
    this.variant,
    this.size,
    this.action,
    this.space,
    this.sub,
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
        sub: GSStyle.fromMap(
            data: data?['sub']?['true'],
            descendantStyle: descendantStyle,
            fromVariant: true),
        highlight: GSStyle.fromMap(
            data: data?['highlight']?['true'],
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
  double? borderLeftWidth;
  TextStyle? textStyle;

  //////textstyle properties ///////////
  TextDecoration? textDecoration;
  double? fontSize;
  double? lineHeight;
  ///////////////////////////////////////
  GSStyle? checked;
  Variants? variants;
  GSProps? props;
  Map<String, GSStyle?>? descendantStyles;
  GSFlexDirections? flexDirection;
  GSAlignments? alignItems;
  GSAlignments? justifyContent;
  double? maxWidth;
  AlignmentGeometry? alignment;

  Color? progressValueColor;
  //for splash n highlight for pressable
  Color? highlightColor;
  Color? splashColor;
  GSStyle? badge;
  GSTextTransform? textTransform;
  double? iconSize;

  //switch props
  Color? trackColorTrue;
  Color? trackColorFalse;
  Color? thumbColor;
  Color? activeThumbColor;
  Color? iosBackgroundColor;
  double? scale;
  Color? outlineColor;
  GSCursors? cursors;

  Map<String, GSStyle>? compoundVariants;

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
    this.margin,
    this.fontWeight,
    this.width,
    this.gap,
    this.outlineWidth,
    this.outlineStyle,
    this.flexDirection,
    this.borderBottomWidth,
    this.borderLeftWidth,
    this.compoundVariants,
    this.textDecoration,
    this.fontSize,
    this.lineHeight,
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
    this.maxWidth,
    this.progressValueColor,
    this.badge,
    this.highlightColor,
    this.splashColor,
    this.textTransform,
    this.trackColorTrue,
    this.trackColorFalse,
    this.thumbColor,
    this.activeThumbColor,
    this.iosBackgroundColor,
    this.scale,
    this.outlineColor,
    this.cursors,
    this.iconSize,
  });

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
      borderLeftWidth: overrideStyle?.borderLeftWidth ?? borderLeftWidth,
      fontWeight: overrideStyle?.fontWeight ?? fontWeight,
      icon: overrideStyle?.icon ?? icon,
      input: overrideStyle?.input ?? input,
      padding: overrideStyle?.padding ?? padding,
      gap: overrideStyle?.gap ?? gap,
      fontSize: overrideStyle?.fontSize ?? fontSize,
      textDecoration: overrideStyle?.textDecoration ?? textDecoration,
      lineHeight: overrideStyle?.lineHeight ?? lineHeight,
      compoundVariants: overrideStyle?.compoundVariants ?? compoundVariants,
      // check if its working with all components,if yes then remove passing keys
      descendantStyles: mergeStyledMaps(
        styleMap: descendantStyles,
        overrideStyleMap: overrideStyle?.descendantStyles,
        keys: descendantStyleKeys,
      ),
      // descendantStyles: descendantStyleKeys.isEmpty
      //     ? overrideStyle?.descendantStyles ?? descendantStyles
      //     : mergeStyledMaps(
      //         styleMap: descendantStyles,
      //         overrideStyleMap: overrideStyle?.descendantStyles,
      //         keys: descendantStyleKeys),
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
      outlineColor: overrideStyle?.outlineColor ?? outlineColor,
      flexDirection: overrideStyle?.flexDirection ?? flexDirection,
      iconSize: overrideStyle?.iconSize ?? iconSize,
      textStyle: overrideStyle?.textStyle != null
          ? TextStyle(
              height: overrideStyle?.textStyle?.height ?? textStyle?.height,
              color: overrideStyle?.textStyle?.color ?? textStyle?.color,
              decoration:
                  overrideStyle?.textStyle?.decoration ?? textStyle?.decoration,
              letterSpacing: overrideStyle?.textStyle?.letterSpacing ??
                  textStyle?.letterSpacing,
              fontWeight:
                  overrideStyle?.textStyle?.fontWeight ?? textStyle?.fontWeight,
              fontSize:
                  overrideStyle?.textStyle?.fontSize ?? textStyle?.fontSize)
          : textStyle,
      // variants: overrideStyle?.variants ?? variants,
      variants: Variants(
        action: overrideStyle?.variants?.action ?? variants?.action,
        highlight: overrideStyle?.variants?.highlight ?? variants?.highlight,
        orientation:
            overrideStyle?.variants?.orientation ?? variants?.orientation,
        // size: overrideStyle?.variants?.size ?? variants?.size,
        size: variants?.size != null
            ? variants?.size!.merge(overrideStyle?.variants?.size)
            : overrideStyle?.variants?.size,
        space: overrideStyle?.variants?.space ?? variants?.space,
        variant: overrideStyle?.variants?.variant ?? variants?.variant,
      ),
      props: GSProps(
        color: overrideStyle?.props?.color ?? props?.color,
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
      badge: overrideStyle?.badge ?? badge,
      dark:
          dark != null ? dark?.merge(overrideStyle?.dark) : overrideStyle?.dark,
      lg: overrideStyle?.lg ?? lg,
      md: overrideStyle?.md ?? md,
      sm: overrideStyle?.sm ?? sm,
      xs: overrideStyle?.xs ?? xs,
      web: overrideStyle?.web ?? web,
      ios: overrideStyle?.ios ?? ios,
      android: overrideStyle?.android ?? android,
      alignItems: overrideStyle?.alignItems ?? alignItems,
      justifyContent: overrideStyle?.justifyContent ?? justifyContent,
      maxWidth: overrideStyle?.maxWidth ?? maxWidth,
      alignment: overrideStyle?.alignment ?? alignment,
      progressValueColor:
          overrideStyle?.progressValueColor ?? progressValueColor,
      highlightColor: overrideStyle?.highlightColor ?? highlightColor,
      splashColor: overrideStyle?.splashColor ?? splashColor,
      textTransform: overrideStyle?.textTransform ?? textTransform,
      trackColorTrue: overrideStyle?.trackColorTrue ?? trackColorTrue,
      trackColorFalse: overrideStyle?.trackColorFalse ?? trackColorFalse,
      thumbColor: overrideStyle?.thumbColor ?? thumbColor,
      activeThumbColor: overrideStyle?.activeThumbColor ?? activeThumbColor,
      scale: overrideStyle?.scale ?? scale,
      cursors: overrideStyle?.cursors ?? cursors,
    );
  }

  factory GSStyle.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
    bool fromSelef = false,
    bool fromVariant = false,
  }) {
    return GSStyle(
      descendantStyles: resolvedescendantStylesFromMap(data, descendantStyle),
      compoundVariants:
          resolveCompoundVariants(compoundVariants: data?['compoundVariants']),
      //check the need of checking wheather data?['borderRadius'] != null
      borderRadius: data?['borderRadius'] != null
          ? resolveRadiusFromString(data?['borderRadius'].toString())
          : null,
      bg: resolveColorFromString(data?['bg']),
      flexDirection: resolveFlexDirectionFromString(data?['flexDirection']),
      justifyContent: resolveAlignmentFromString(data?['justifyContent']),
      alignItems: resolveAlignmentFromString(data?['alignItems']),
      color: resolveColorFromString(data?['color']),
      fontWeight: resolveFontWeightFromString(data?['fontWeight']),
      borderColor: resolveColorFromString(data?['borderColor']),
      borderWidth: resolveBorderWidthFromString(data?['borderWidth']),
      opacity: data?['opacity'],
      height: resolveSpaceFromString(
        data?['h'] ?? data?['height'],
      ),
      //check if the way % is calculated is correct
      width: data?['w'] != null
          ? data!['w']?.contains('%')
              ? double.tryParse(data['w']?.replaceAll('%', ''))! / 100
              : resolveSpaceFromString(data['w'] ?? data['width'])
          : resolveSpaceFromString(data?['w'] ?? data?['width']),
      //check if this logic of calculating line heigth is correct
      lineHeight:
          resolveLineHeightFromString(data?['lineHeight'], data?['fontSize']),
      textDecoration:
          resolveTextDecorationFromString(data?['textDecorationLine']),
      fontSize: resolveFontSizeFromString(data?['fontSize']),
      padding: data?['p'] != null
          ? resolvePaddingFromString(data?['p'].toString(), 'all')
          : data?['px'] != null && data?['py'] != null
              ? resolvePaddingFromString(data?['px'].toString(), 'symmetric',
                  paddingy: data?['py'].toString())
              : data?['px'] != null
                  ? resolvePaddingFromString(
                      data?['px'].toString(), 'horizontal')
                  : data?['py'] != null
                      ? resolvePaddingFromString(
                          data?['py'].toString(), 'vertical')
                      : null,
      onHover: data?[':hover'] == null
          ? null
          : GSStyle.fromMap(
              data: data?[':hover'],
              descendantStyle: descendantStyle,
            ),
      onActive: data?[':active'] == null
          ? null
          : GSStyle.fromMap(
              data: data?[':active'],
              fromSelef: true,
              descendantStyle: descendantStyle,
            ),
      onDisabled: data?[':disabled'] == null
          ? null
          : GSStyle.fromMap(
              data: data?[':disabled'],
              fromSelef: true,
              descendantStyle: descendantStyle,
            ),
      dark: data?[':_dark'] == null
          ? null
          : GSStyle.fromMap(
              data: data?[':_dark'],
              fromSelef: true,
              descendantStyle: descendantStyle,
            ),
      variants: fromVariant
          ? null
          : Variants.fromMap(
              data: data?['variants'],
              descendantStyle: descendantStyle,
            ),
      props: fromVariant
          ? null
          : GSProps.fromMap(
              data: data?['props'] ?? data?['defaultProps'],
            ),
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
        return variants?.action?.positive;
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
