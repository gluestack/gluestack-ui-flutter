import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/base_style.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';

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

enum GSVariants {
  solid,
  outline,
  link,
  underlined,
  rounded,
  accent,
  filled,
  unfilled,
}

enum GSPlacements {
  topLeft,
  topCenter,
  topRight,
  bottomLeft,
  bottomCenter,
  bottomRight
}

enum GSTypes { single, multiple }

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

enum GSOutlineStyle { solid }

enum GSDirection { row, column }

enum GSSpaces { $none, $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $4xl }

enum GSAlignments { start, center, end, spaceBetween, flexEnd, flexStart }

enum GSOrientations { horizontal, vertical }

enum GSFlexDirections { row, column }

enum GSCursors { pointer, notAllowed }

class ShadowOffset {
  final double? height;
  final double? width;

  const ShadowOffset({
    this.height,
    this.width,
  });

  factory ShadowOffset.fromJson({required Map<String, dynamic>? data}) {
    return ShadowOffset(
      height: data?['height'] != null
          ? double.tryParse((data?['height']).toString())
          : null,
      width: data?['width'] != null
          ? double.tryParse((data?['width']).toString())
          : null,
    );
  }
}

class GSPlacement {
  GSStyle? topRight;
  GSStyle? topLeft;
  GSStyle? bottomRight;
  GSStyle? bottomLeft;
  GSStyle? topCenter;
  GSStyle? bottomCenter;
  GSPlacement(
      {this.bottomCenter,
      this.bottomLeft,
      this.bottomRight,
      this.topCenter,
      this.topLeft,
      this.topRight});
  factory GSPlacement.fromMap({required Map<String, dynamic>? data}) {
    return GSPlacement(
      bottomCenter:
          GSStyle.fromMap(data: data?['bottom center'], fromVariant: true),
      bottomLeft:
          GSStyle.fromMap(data: data?['bottom left'], fromVariant: true),
      bottomRight:
          GSStyle.fromMap(data: data?['bottom right'], fromVariant: true),
      topCenter: GSStyle.fromMap(data: data?['top center'], fromVariant: true),
      topLeft: GSStyle.fromMap(data: data?['top left'], fromVariant: true),
      topRight: GSStyle.fromMap(data: data?['top right'], fromVariant: true),
    );
  }
}

class GSProps {
  GSActions? action;
  GSVariants? variant;
  GSSizes? size;
  GSSpaces? space;
  GSStyle? style;
  GSPlacements? placement;
  GSOrientations? orientation;
  Color? color;
//TODO: add theme default prop - context: accordion theme config, do after theming is taken care of without material
  GSProps({
    this.action,
    this.variant,
    this.size,
    this.space,
    this.style,
    this.orientation,
    this.placement,
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
        placement: resolvePlacementFromString(data?['placement']),
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
  GSStyle? filled;
  GSStyle? unfilled;

  GSVariant({
    this.underlined,
    this.outline,
    this.rounded,
    this.solid,
    this.link,
    this.accent,
    this.filled,
    this.unfilled,
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
      filled: parseMap(data?['filled'])
          ? GSStyle.fromMap(
              data: data?['filled'],
              descendantStyle: descendantStyle,
              fromVariant: true)
          : null,
      unfilled: parseMap(data?['unfilled'])
          ? GSStyle.fromMap(
              data: data?['unfilled'],
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
  GSPlacement? placements;
  Variants({
    this.variant,
    this.size,
    this.action,
    this.space,
    this.sub,
    this.highlight,
    this.placements,
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
        placements: GSPlacement.fromMap(data: data?['placement']),
        orientation: GSOrientation.fromMap(data: data?['orientation']));
  }
}

/*

after adding decdent style check need for textStyle

*/
//TODO: add font family support later on, context accordion theme config
class GSStyle extends BaseStyle<GSStyle> {
  double? borderWidth;
  Color? borderColor;
  double? borderRadius;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  double? opacity;
  Color? color;
  Color? bg;
  double? gap;
  Color? borderBottomColor;
  double? height;
  double? width;
  double? borderBottomWidth;
  double? borderLeftWidth;
  TextStyle? textStyle;
  GSStyle? checked;
  Variants? variants;
  GSProps? props;
  Map<String, GSStyle?>? descendantStyles;
  GSFlexDirections? flexDirection;
  GSAlignments? alignItems;
  GSAlignments? justifyContent;
  double? maxWidth;
  AlignmentGeometry? alignment;

  double? top;
  double? bottom;
  double? right;
  double? left;

  Color? progressValueColor;
  //for splash n highlight for pressable
  // Color? highlightColor;
  // Color? splashColor;
  GSStyle? badge;
  GSTextTransform? textTransform;
  GSSizes? iconSize;

  //switch props
  Color? trackColorTrue;
  Color? trackColorFalse;
  Color? thumbColor;
  Color? activeThumbColor;
  Color? iosBackgroundColor;
  double? scale;
  GSCursors? cursors;
  GSPlacement? placement;

  bool? isVisible;
  Axis? direction;
  double? outlineWidth;
  Color? outlineColor;
  GSOutlineStyle? outlineStyle;
  Map<String, GSStyle>? compoundVariants;

  double indent;
  double endIndent;

  //Accordion
  Color? iconColor;
  GSStyle? item;
  Color? shadowColor;
  double? shadowRadius;
  double? shadowOpacity;
  double? elevation;
  ShadowOffset? shadowOffset;
  TextAlign? textAlign;
  TextStyle? titleTextStyle;
  TextStyle? contentTextStyle;
  TextStyle? selectedLabelTextStyle;
  TextStyle? unselectedLabelTextStyle;
  Color? selectedIconColor;
  Color? unselectedIconColor;

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
      this.placement,
      this.width,
      this.gap,
      this.outlineWidth,
      this.outlineStyle,
      this.flexDirection,
      this.borderBottomWidth,
      this.borderLeftWidth,
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
      super.onInvalid,
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
      // this.highlightColor,
      // this.splashColor,
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
      this.bottom,
      this.left,
      this.right,
      this.top,
      this.isVisible,
      this.direction,
      this.compoundVariants,
      this.indent = 0,
      this.endIndent = 0,
      this.iconColor,
      this.item,
      this.shadowColor,
      this.shadowRadius,
      this.shadowOpacity,
      this.elevation,
      this.shadowOffset,
      this.textAlign,
      this.titleTextStyle,
      this.contentTextStyle,
      this.selectedLabelTextStyle,
      this.unselectedLabelTextStyle,
      this.selectedIconColor,
      this.unselectedIconColor});

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
        borderBottomColor:
            overrideStyle?.borderBottomColor ?? borderBottomColor,
        borderBottomWidth:
            overrideStyle?.borderBottomWidth ?? borderBottomWidth,
        borderLeftWidth: overrideStyle?.borderLeftWidth ?? borderLeftWidth,
        icon: overrideStyle?.icon ?? icon,
        input: overrideStyle?.input ?? input,
        padding: overrideStyle?.padding ?? padding,
        gap: overrideStyle?.gap ?? gap,
        placement: overrideStyle?.placement ?? placement,
        compoundVariants: overrideStyle?.compoundVariants ?? compoundVariants,
        // descendantStyles: descendantStyleKeys.isEmpty
        //     ? overrideStyle?.descendantStyles ?? descendantStyles
        //     : mergeStyledMaps(
        //         styleMap: descendantStyles,
        //         overrideStyleMap: overrideStyle?.descendantStyles,
        //         keys: descendantStyleKeys),
        descendantStyles: mergeStyledMaps(
          styleMap: descendantStyles,
          overrideStyleMap: overrideStyle?.descendantStyles,
          keys: descendantStyleKeys,
        ),
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
        onInvalid: onInvalid != null
            ? onInvalid?.merge(overrideStyle?.onInvalid)
            : overrideStyle?.onInvalid,
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
                decoration: overrideStyle?.textStyle?.decoration ??
                    textStyle?.decoration,
                letterSpacing: overrideStyle?.textStyle?.letterSpacing ??
                    textStyle?.letterSpacing,
                fontWeight: overrideStyle?.textStyle?.fontWeight ??
                    textStyle?.fontWeight,
                fontSize:
                    overrideStyle?.textStyle?.fontSize ?? textStyle?.fontSize,
                fontFamily: overrideStyle?.textStyle?.fontFamily ??
                    textStyle?.fontFamily,
              )
            : textStyle,
        titleTextStyle: overrideStyle?.titleTextStyle != null
            ? TextStyle(
                height: overrideStyle?.titleTextStyle?.height ??
                    titleTextStyle?.height,
                color: overrideStyle?.titleTextStyle?.color ??
                    titleTextStyle?.color,
                decoration: overrideStyle?.titleTextStyle?.decoration ??
                    titleTextStyle?.decoration,
                letterSpacing: overrideStyle?.titleTextStyle?.letterSpacing ??
                    titleTextStyle?.letterSpacing,
                fontWeight: overrideStyle?.titleTextStyle?.fontWeight ??
                    titleTextStyle?.fontWeight,
                fontSize: overrideStyle?.titleTextStyle?.fontSize ??
                    titleTextStyle?.fontSize,
              )
            : titleTextStyle,
        contentTextStyle: overrideStyle?.contentTextStyle != null
            ? TextStyle(
                height: overrideStyle?.contentTextStyle?.height ??
                    contentTextStyle?.height,
                color: overrideStyle?.contentTextStyle?.color ??
                    contentTextStyle?.color,
                decoration: overrideStyle?.contentTextStyle?.decoration ??
                    contentTextStyle?.decoration,
                letterSpacing: overrideStyle?.contentTextStyle?.letterSpacing ??
                    contentTextStyle?.letterSpacing,
                fontWeight: overrideStyle?.contentTextStyle?.fontWeight ??
                    contentTextStyle?.fontWeight,
                fontSize: overrideStyle?.contentTextStyle?.fontSize ??
                    contentTextStyle?.fontSize,
              )
            : contentTextStyle,
        selectedLabelTextStyle: overrideStyle?.selectedLabelTextStyle != null
            ? TextStyle(
                height: overrideStyle?.selectedLabelTextStyle?.height ??
                    selectedLabelTextStyle?.height,
                color: overrideStyle?.selectedLabelTextStyle?.color ??
                    selectedLabelTextStyle?.color,
                decoration: overrideStyle?.selectedLabelTextStyle?.decoration ??
                    selectedLabelTextStyle?.decoration,
                letterSpacing:
                    overrideStyle?.selectedLabelTextStyle?.letterSpacing ??
                        selectedLabelTextStyle?.letterSpacing,
                fontWeight: overrideStyle?.selectedLabelTextStyle?.fontWeight ??
                    selectedLabelTextStyle?.fontWeight,
                fontSize: overrideStyle?.selectedLabelTextStyle?.fontSize ??
                    selectedLabelTextStyle?.fontSize,
              )
            : selectedLabelTextStyle,
        unselectedLabelTextStyle: overrideStyle?.unselectedLabelTextStyle !=
                null
            ? TextStyle(
                height: overrideStyle?.unselectedLabelTextStyle?.height ??
                    unselectedLabelTextStyle?.height,
                color: overrideStyle?.unselectedLabelTextStyle?.color ??
                    unselectedLabelTextStyle?.color,
                decoration:
                    overrideStyle?.unselectedLabelTextStyle?.decoration ??
                        unselectedLabelTextStyle?.decoration,
                letterSpacing:
                    overrideStyle?.unselectedLabelTextStyle?.letterSpacing ??
                        unselectedLabelTextStyle?.letterSpacing,
                fontWeight:
                    overrideStyle?.unselectedLabelTextStyle?.fontWeight ??
                        unselectedLabelTextStyle?.fontWeight,
                fontSize: overrideStyle?.unselectedLabelTextStyle?.fontSize ??
                    unselectedLabelTextStyle?.fontSize,
              )
            : unselectedLabelTextStyle,
        selectedIconColor:
            overrideStyle?.selectedIconColor ?? selectedIconColor,
        unselectedIconColor:
            overrideStyle?.unselectedIconColor ?? unselectedIconColor,
        right: overrideStyle?.right ?? right,
        left: overrideStyle?.left ?? left,
        bottom: overrideStyle?.bottom ?? bottom,
        top: overrideStyle?.top ?? top,
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
        dark: dark != null
            ? dark?.merge(overrideStyle?.dark)
            : overrideStyle?.dark,
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
        // highlightColor: overrideStyle?.highlightColor ?? highlightColor,
        // splashColor: overrideStyle?.splashColor ?? splashColor,
        textTransform: overrideStyle?.textTransform ?? textTransform,
        trackColorTrue: overrideStyle?.trackColorTrue ?? trackColorTrue,
        trackColorFalse: overrideStyle?.trackColorFalse ?? trackColorFalse,
        thumbColor: overrideStyle?.thumbColor ?? thumbColor,
        activeThumbColor: overrideStyle?.activeThumbColor ?? activeThumbColor,
        scale: overrideStyle?.scale ?? scale,
        cursors: overrideStyle?.cursors ?? cursors,
        isVisible: overrideStyle?.isVisible ?? isVisible,
        direction: overrideStyle?.direction ?? direction,
        iconColor: overrideStyle?.iconColor ?? iconColor,
        shadowColor: overrideStyle?.shadowColor ?? shadowColor,
        shadowRadius: overrideStyle?.shadowRadius ?? shadowRadius,
        shadowOpacity: overrideStyle?.shadowOpacity ?? shadowOpacity,
        elevation: overrideStyle?.elevation ?? elevation,
        textAlign: overrideStyle?.textAlign ?? textAlign,
        item: item != null
            ? item?.merge(overrideStyle?.item)
            : overrideStyle?.item,
        shadowOffset: ShadowOffset(
          height: overrideStyle?.shadowOffset?.height ?? shadowOffset?.height,
          width: overrideStyle?.shadowOffset?.width ?? shadowOffset?.width,
        ));
  }

  factory GSStyle.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
    bool fromVariant = false,
  }) {
    // print(data?['_content']);
    return GSStyle(
      descendantStyles: resolvedescendantStylesFromMap(data, descendantStyle),
      compoundVariants:
          resolveCompoundVariants(compoundVariants: data?['compoundVariants']),
      flexDirection: resolveFlexDirectionFromString(data?['flexDirection']),
      height: data?['h'] is int
          ? double.parse('${data?['h']}.0')
          : resolveSpaceFromString(
              data?['h'].toString() ?? data?['height'].toString(),
            ),
      width: data?['w'] != null
          ? data!['w']?.contains('100%')
              ? double.infinity
              : data['w']?.contains('%')
                  ? double.tryParse(data['w']?.replaceAll('%', ''))! / 100
                  : resolveSpaceFromString(data['w'] ?? data['width'])
          : resolveSpaceFromString(data?['w'] ?? data?['width']),
      badge: GSStyle(
        height: resolveSpaceFromString(
          data?['_badge']?['h'],
        ),
        width: resolveSpaceFromString(
          data?['_badge']?['w'],
        ),
      ),
      textTransform: resolveTextTransformFromString(data?['textTransform']),
      maxWidth: data?['maxWidth'] != null
          ? double.tryParse(data?['maxWidth']?.toString() ?? "")
          : null,
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
                      : data?['pb'] != null
                          ? resolvePaddingFromString(
                              data?['pb'].toString(), 'only')
                          : null,
      margin: data?['m'] != null
          ? resolvePaddingFromString(data?['m'].toString(), 'all')
          : data?['mx'] != null && data?['my'] != null
              ? resolvePaddingFromString(data?['mx'].toString(), 'symmetric',
                  paddingy: data?['my'].toString())
              : data?['mx'] != null
                  ? resolvePaddingFromString(
                      data?['mx'].toString(), 'horizontal')
                  : data?['my'] != null
                      ? resolvePaddingFromString(
                          data?['my'].toString(), 'vertical')
                      : data?['mb'] != null
                          ? resolvePaddingFromString(
                              data?['mb'].toString(), 'only')
                          : data?['mt'] != null
                              ? resolvePaddingFromString(
                                  data?['mt'].toString(), 'only')
                              : null,
      bottom: resolveSpaceFromString(data?['bottom'].toString()),
      left: resolveSpaceFromString(data?['left'].toString()),
      right: resolveSpaceFromString(data?['right'].toString()),
      top: resolveSpaceFromString(data?['top'].toString()),
      iconSize: resolveSizesFromString(data?['_icon']?['props']?['size']),
      // resolvePaddingFromString(data?['p'] ?? data?['px'] ?? data?['py'], ),
      textStyle: TextStyle(
        fontWeight: resolveFontWeightFromString(data?['fontWeight'] ??
                data?['_titleText']?['fontWeight'] ??
                data?['_subtitleText']?['fontWeight']) ??
            data?['_contentText']?['fontWeight'],
        fontFamily: resolveFontFamilyTokenFromString(data?['fontFamily']),
        fontSize: resolveFontSizeFromString(data?['fontSize'] ??
            data?['_titleText']?['fontSize'] ??
            data?['_subtitleText']?['fontSize'] ??
            data?['props']?['size'].toString() ??
            data?['_contentText']?['fontSize'] ??
            data?['_input']?['props']?['size'].toString()),
        height: resolveLineHeightFromString(
          data?['lineHeight'] ??
              data?['_titleText']?['lineHeight'] ??
              data?['_subtitleText']?['lineHeight'] ??
              data?['_contentText']?['lineHeight'],
          data?['fontSize'] ??
              data?['_titleText']?['fontSize'] ??
              data?['_subtitleText']?['fontSize'] ??
              data?['_contentText']?['fontSize'],
        ),
        decoration:
            resolveTextDecorationFromString(data?['textDecorationLine']),
        letterSpacing: resolveLetterSpacingFromString(data?['letterSpacing']),
        // fontSize: resolveFontSizeFromString(data?['_text']?['props']?['size']),
        color: resolveColorFromString(data?['_text']?['color'] ??
            data?['_titleText']?['color'] ??
            data?['_subtitleText']?['color'] ??
            data?['_contentText']?['color'] ??
            data?['_selectedLabelText']?['color'] ??
            data?['_unselectedLabelText']?['color'] ??
            data?['color']),
      ),
      titleTextStyle: TextStyle(
        fontWeight:
            resolveFontWeightFromString(data?['_titleText']?['fontWeight']),
        fontSize: resolveFontSizeFromString(data?['_titleText']?['fontSize']),
        height: resolveLineHeightFromString(data?['_titleText']?['lineHeight'],
            data?['_titleText']?['fontSize']),
        decoration:
            resolveTextDecorationFromString(data?['textDecorationLine']),
        letterSpacing: resolveLetterSpacingFromString(data?['letterSpacing']),
        // fontSize: resolveFontSizeFromString(data?['_text']?['props']?['size']),
        color: resolveColorFromString(
            data?['_titleText']?['color'] ?? data?['color']),
      ),

      contentTextStyle: TextStyle(
        fontWeight:
            resolveFontWeightFromString(data?['_contentText']?['fontWeight']),
        fontSize: resolveFontSizeFromString(data?['_contentText']?['fontSize']),
        height: resolveLineHeightFromString(
            data?['_contentText']?['lineHeight'],
            data?['_contentText']?['fontSize']),
        decoration:
            resolveTextDecorationFromString(data?['textDecorationLine']),
        letterSpacing: resolveLetterSpacingFromString(data?['letterSpacing']),
        // fontSize: resolveFontSizeFromString(data?['_text']?['props']?['size']),
        color: resolveColorFromString(
            data?['_contentText']?['color'] ?? data?['color']),
      ),

      selectedLabelTextStyle: TextStyle(
        fontWeight: resolveFontWeightFromString(
            data?['_selectedLabelText']?['fontWeight']),
        fontSize:
            resolveFontSizeFromString(data?['_selectedLabelText']?['fontSize']),
        height: resolveLineHeightFromString(
            data?['_selectedLabelText']?['lineHeight'],
            data?['_selectedLabelText']?['fontSize']),
        decoration:
            resolveTextDecorationFromString(data?['textDecorationLine']),
        letterSpacing: resolveLetterSpacingFromString(data?['letterSpacing']),
        // fontSize: resolveFontSizeFromString(data?['_text']?['props']?['size']),
        color: resolveColorFromString(
            data?['_selectedLabelText']?['color'] ?? data?['color']),
      ),
      unselectedLabelTextStyle: TextStyle(
        fontWeight: resolveFontWeightFromString(
            data?['_unselectedLabelText']?['fontWeight']),
        fontSize: resolveFontSizeFromString(
            data?['_unselectedLabelText']?['fontSize']),
        height: resolveLineHeightFromString(
            data?['_unselectedLabelText']?['lineHeight'],
            data?['_unselectedLabelText']?['fontSize']),
        decoration:
            resolveTextDecorationFromString(data?['textDecorationLine']),
        letterSpacing: resolveLetterSpacingFromString(data?['letterSpacing']),
        // fontSize: resolveFontSizeFromString(data?['_text']?['props']?['size']),
        color: resolveColorFromString(
            data?['_unselectedLabelText']?['color'] ?? data?['color']),
      ),

      selectedIconColor: resolveColorFromString(
        data?['_selectedIcon']?['color'],
      ),
      unselectedIconColor: resolveColorFromString(
        data?['_unselectedIcon']?['color'],
      ),
      color: resolveColorFromString(data?['color']),
      bg: resolveColorFromString(data?['bg'] ?? data?['backgroundColor']),
      borderWidth: data?['borderWidth'] != null
          ? double.tryParse(data!['borderWidth']!.toString()) ??
              resolveBorderWidthFromString(data['borderWidth'])
          : null,
      gap: resolveSpaceFromString(
          data?['gap'] ?? data?['_avatar']?['ml'].toString()),
      borderColor: resolveColorFromString(data?['borderColor']),
      borderRadius: data?['borderRadius'] != null
          ? double.tryParse(data!['borderRadius'].toString()) ??
              resolveRadiusFromString(data['borderRadius'].toString())
          : data?['rounded'] != null
              ? resolveRadiusFromString(data?['rounded'])
              : null,
      borderBottomWidth: data?['borderBottomWidth'] != null
          ? resolveBorderWidthFromString(data?['borderBottomWidth'].toString())
          : null,
      borderLeftWidth: data?['borderLeftWidth'] != null
          ? resolveBorderWidthFromString(data?['borderLeftWidth'].toString())
          : null,
      item: GSStyle(
        bg: resolveColorFromString(data?['_item']?['backgroundColor']),
      ),
      shadowOffset: ShadowOffset.fromJson(data: data?['shadowOffset']),
      checked: GSStyle(
        thumbColor:
            resolveColorFromString(data?[':checked']?['props']?['thumbColor']),
        color: resolveColorFromString(data?[':checked']?['color']),
        bg: resolveColorFromString(data?[':checked']?['bg']),
        borderColor: resolveColorFromString(data?[':checked']?['borderColor']),
        onHover: GSStyle(
          color: resolveColorFromString(data?[':checked']?[':hover']?['color']),
        ),
      ),
      onHover: GSStyle(
        color: resolveColorFromString(data?[':hover']?['color']),
        textStyle: TextStyle(
          decoration: resolveTextDecorationFromString(
              data?[':hover']?['textDecorationLine']),
        ),
        // checked: GSStyle(
        //     color:
        //         resolveColorFromString(data?[':hover']?[':checked']?['color'])),
        bg: resolveColorFromString(data?[':hover']?['bg']),
        borderColor: resolveColorFromString(data?[':hover']?['borderColor']),
        borderBottomColor:
            resolveColorFromString(data?[':hover']?['borderColor']),
        trackColorTrue: resolveColorFromString(
            data?[':hover']?['props']?['trackColor']?['true']),
        trackColorFalse: resolveColorFromString(
            data?[':hover']?['props']?['trackColor']?['false']),

        iosBackgroundColor: resolveColorFromString(
            data?[':hover']?['props']?['ios_backgroundColor']),
        onInvalid: GSStyle(
          borderColor: resolveColorFromString(
              data?[':hover']?['invalid']?['borderColor']),
          trackColorTrue: resolveColorFromString(
              data?[':hover']?[':invalid']?['props']?['trackColor']?['true']),
          trackColorFalse: resolveColorFromString(
              data?[':hover']?[':invalid']?['props']?['trackColor']?['false']),
        ),
        onDisabled: GSStyle(
          bg: resolveColorFromString(data?[':hover']?[':disabled']?['bg']),
          onInvalid: GSStyle(
            borderColor: resolveColorFromString(
              data?[':hover']?[':disabled']?[':invalid']?['borderColor'],
            ),
          ),
        ),
        checked: GSStyle(
          onHover: GSStyle(
            color: resolveColorFromString(data?[':checked']?[':hover']
                    ?['color'] ??
                data?[':hover']?[':checked']?['color']),
          ),
          bg: resolveColorFromString(
              data?[':hover']?[':checked']?['bg'] ?? data?[':hover']?['bg']),
          borderColor: resolveColorFromString(data?[':hover']?[':checked']
                  ?['borderColor'] ??
              data?[':hover']?['borderColor']),
          color: resolveColorFromString(data?[':hover']?[':checked']?['color']),
          onDisabled: GSStyle(
            bg: resolveColorFromString(
                data?[':hover']?[':checked']?[':disabled']?['bg']),
            borderColor: resolveColorFromString(
                data?[':hover']?[':checked']?[':disabled']?['borderColor']),
            onInvalid: GSStyle(
                borderColor: resolveColorFromString(data?[':hover']?[':checked']
                    ?[':disabled']?['invalid']?['borderColor'])),
          ),
        ),
      ),
      onFocus: GSStyle(
        borderColor: kIsWeb
            ? resolveColorFromString(data?['_web']?[':focusVisible']
                    ?['outlineColor'] ??
                data?[':focus']?['borderColor'])
            : resolveColorFromString(data?[':focus']?['borderColor']),
        borderWidth: kIsWeb
            ? resolveSpaceFromString(
                data?['_web']?[':focusVisible']?['outlineWidth'].toString())
            : null,
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
        color: resolveColorFromString(data?[':active']?['color']),
        bg: resolveColorFromString(data?[':active']?['bg']),
        borderColor: resolveColorFromString(data?[':active']?['borderColor']),
        borderBottomColor:
            resolveColorFromString(data?[':active']?['borderBottomColor']),
        checked: GSStyle(
          bg: resolveColorFromString(data?[':active']?[":checked"]?['bg']),
          borderColor: resolveColorFromString(
              data?[':active']?[":checked"]?['borderColor']),
        ),
        onInvalid: GSStyle(
          borderColor: resolveColorFromString(
              data?[':active']?[":invalid"]?['borderColor']),
        ),
      ),
      onInvalid: GSStyle(
        textStyle: TextStyle(
          color: resolveColorFromString(data?[':invalid']?['color']),
        ),
        bg: resolveColorFromString(data?[':invalid']?['bg']),
        borderColor: resolveColorFromString(data?['variants']?['variant']
                ?['default']?[':invalid']?['borderColor'] ??
            data?[':invalid']?['borderColor']),
        borderBottomColor:
            resolveColorFromString(data?[':invalid']?['borderBottomColor']),
        borderRadius: data?[':invalid']?['borderRadius'] != null
            ? double.tryParse(data![':invalid']!['borderRadius']!.toString())
            : null,
        borderWidth: data?[':invalid']?['borderWidth'] != null
            ? double.tryParse(data![':invalid']!['borderWidth']!.toString())
            : null,
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
        textStyle: TextStyle(
          color: resolveColorFromString(data?[':disabled']?['color']),
        ),
        web: GSStyle(
          cursors:
              resolveCursorFromString(data?[':disabled']?['_web']?['cursor']),
          onDisabled: GSStyle(
            cursors: resolveCursorFromString(
                data?[':disabled']?['_web']?[':disabled']?['cursor']),
          ),
        ),
        trackColorTrue:
            resolveColorFromString(data?[':disabled']?['trackColor']?['true']),
        trackColorFalse:
            resolveColorFromString(data?[':disabled']?['trackColor']?['false']),
        iosBackgroundColor:
            resolveColorFromString(data?[':disabled']?['ios_backgroundColor']),
        borderColor: data?[':disabled']?['borderColor'],
        onInvalid: GSStyle(
            borderColor: data?[':disabled']?['invalid']?['borderColor']),
        onHover: GSStyle(
          borderColor: resolveColorFromString(
            data?[':disabled']?[':hover']?['borderColor'],
          ),
          trackColorTrue: resolveColorFromString(
              data?[':disabled']?[':hover']?['props']?['trackColor']?['true']),
          trackColorFalse: resolveColorFromString(
              data?[':disabled']?[':hover']?['props']?['trackColor']['false']),
        ),
      ),
      dark: GSStyle(
        iconColor: resolveColorFromString(
          data?['_icon']?['_dark']?['color'] ??
              data?['_selectedIcon']?['_dark']?['color'] ??
              data?['_unselectedIcon']?['_dark']?['color'],
        ),
        item: GSStyle(
          bg: resolveColorFromString(
              data?['_dark']?['_item']?['backgroundColor']),
        ),
        web: GSStyle(
          onFocus: GSStyle(
            outlineColor: resolveColorFromString(
                data?['_web']?[':focus']?['_dark']?['outlineColor']),
            outlineWidth:
                data?['_web']?[':focus']?['_dark']?['outlineWidth'] != null
                    ? double.tryParse(
                        data!['_web']![':focus']!['_dark']!['outlineWidth']
                            .toString())
                    : null,
            // outlineStyle: data?['_web']?[':focus']?['_dark']
            //     ?['outlineStyle'],
            outlineStyle: resolveOutlineStyleFromString(
                outlineStyle: data?['outlineStyle']),
          ),
        ),
        color: resolveColorFromString((data?['_dark']?['color'])),
        textStyle: TextStyle(
          fontWeight: resolveFontWeightFromString(data?['fontWeight']),
          color: resolveColorFromString(data?['_text']?['_dark']?['color'] ??
              data?['_selectedLabelText']?['_dark']?['color'] ??
              data?['_unselectedLabelText']?['_dark']?['color'] ??
              data?['_dark']?['color']),
        ),
        contentTextStyle: TextStyle(
          color: resolveColorFromString(data?['_contentText']?['_dark']
                  ?['color'] ??
              data?['_dark']?['color']),
        ),
        titleTextStyle: TextStyle(
          color: resolveColorFromString(data?['_titleText']?['_dark']
                  ?['color'] ??
              data?['_dark']?['color']),
        ),
        selectedLabelTextStyle: TextStyle(
          color: resolveColorFromString(data?['_selectedLabelText']?['_dark']
                  ?['color'] ??
              data?['_dark']?['color']),
        ),
        unselectedLabelTextStyle: TextStyle(
          color: resolveColorFromString(data?['_unselectedLabelText']?['_dark']
                  ?['color'] ??
              data?['_dark']?['color']),
        ),
        selectedIconColor: resolveColorFromString(
          data?['_selectedIcon']?['_dark']?['color'],
        ),
        unselectedIconColor: resolveColorFromString(
          data?['_unselectedIcon']?['_dark']?['color'],
        ),
        borderColor: resolveColorFromString(data?['_dark']?['borderColor']),
        bg: resolveColorFromString(
            data?['_dark']?['bg'] ?? data?['_dark']?['backgroundColor']),
        onActive: GSStyle(
          bg: resolveColorFromString(data?['_dark']?[':active']?['bg']),
          borderColor: resolveColorFromString(
              data?['_dark']?[':active']?['borderColor']),
          borderBottomColor: resolveColorFromString(
              data?['_dark']?[':active']?['borderBottomColor']),
          checked: GSStyle(
            bg: resolveColorFromString(
                data?['_dark']?[':active']?[":checked"]?['bg']),
            borderColor: resolveColorFromString(
                data?['_dark']?[':active']?[":checked"]?['borderColor']),
          ),
          onInvalid: GSStyle(
            borderColor: resolveColorFromString(
                data?['_dark']?[':active']?[":invalid"]?['borderColor']),
          ),
        ),
        checked: GSStyle(
            color:
                resolveColorFromString(data?['_dark']?[':checked']?['color']),
            onHover: GSStyle(
                color: resolveColorFromString(
                    data?['_dark']?[':checked']?[':hover']?['color']))),
        onHover: GSStyle(
            color: resolveColorFromString(data?['_dark']?[':hover']?['color']),
            trackColorTrue: resolveColorFromString(
                data?['_dark']?[':hover']?['props']?['trackColor']?['true']),
            trackColorFalse: resolveColorFromString(
                data?['_dark']?[':hover']?['props']?['trackColor']?['false']),
            iosBackgroundColor: resolveColorFromString(
                data?['_dark']?[':hover']?['props']?['ios_backgroundColor']),
            checked: GSStyle(
              color: resolveColorFromString(
                  data?['_dark']?[':hover']?[':checked']?['color']),
              bg: resolveColorFromString(
                  data?['_dark']?[':hover']?[':checked']?['bg']),
              borderColor: resolveColorFromString(
                  data?['_dark']?[':hover']?[':checked']?['borderColor']),
              onDisabled: GSStyle(
                bg: resolveColorFromString(data?['_dark']?[':hover']
                    ?[':checked']?[':disabled']?['bg']),
                borderColor: resolveColorFromString(data?['_dark']?[':hover']
                    ?[':checked']?[':disabled']?['borderColor']),
                onInvalid: GSStyle(
                  borderColor: resolveColorFromString(data?['_dark']?[':hover']
                      ?[':checked']?[':disabled']?['borderColor']),
                ),
              ),
            ),
            borderColor: resolveColorFromString(
                data?['_dark']?[':hover']?['borderColor']),
            bg: resolveColorFromString(data?['_dark']?[':hover']?['bg']),
            onInvalid: GSStyle(
              trackColorTrue: resolveColorFromString(data?['_dark']?[':hover']
                  ?[':invalid']?['props']?['trackColor']?['true']),
              trackColorFalse: resolveColorFromString(data?['_dark']?[':hover']
                  ?[':invalid']?['props']?['trackColor']?['false']),
            )),
        onFocus: GSStyle(
          borderColor: kIsWeb
              ? resolveColorFromString(
                  data?['_web']?[':focusVisible']?['_dark']?['outlineColor'])
              : resolveColorFromString(
                  data?['_dark']?[':focus']?['borderColor']),
          borderWidth: kIsWeb
              ? resolveSpaceFromString(
                  data?['_web']?[':focusVisible']?['outlineWidth'].toString())
              : null,
          onHover: GSStyle(
            borderColor: resolveColorFromString(
                data?['_dark']?[':focus']?[':hover']?['borderColor']),
          ),
        ),
        onDisabled: GSStyle(
          borderColor: resolveColorFromString(
              data?['_dark']?[':disabled']?['borderColor']),
          trackColorTrue: resolveColorFromString(
              data?['_dark']?[':disabled']?['trackColor']?['true']),
          trackColorFalse: resolveColorFromString(
              data?['_dark']?[':disabled']?['trackColor']?['false']),
          iosBackgroundColor: resolveColorFromString(
              data?['_dark']?[':disabled']?['ios_backgroundColor']),
          opacity: data?['_dark']?[':disabled']?['opacity'],
          textStyle: TextStyle(
            color:
                resolveColorFromString(data?[':disabled']?['_dark']?['color']),
          ),
          web: GSStyle(
            cursors: resolveCursorFromString(
                data?['_dark']?[':disabled']?['_web']?['cursor']),
            onDisabled: GSStyle(
              cursors: resolveCursorFromString(data?['_dark']?[':disabled']
                  ?['_web']?[':disabled']?['cursor']),
            ),
          ),
          onHover: GSStyle(
            borderColor: resolveColorFromString(
                data?['_dark']?[':disabled']?[':hover']?['borderColor']),
            trackColorTrue: resolveColorFromString(data?['_dark']?[':disabled']
                ?[':hover']?[':props']?['trackColor']?['true']),
            trackColorFalse: resolveColorFromString(data?['_dark']?[':disabled']
                ?[':hover']?[':props']?['trackColor']?['false']),
          ),
        ),
        onInvalid: GSStyle(
          textStyle: TextStyle(
            color:
                resolveColorFromString(data?[':invalid']?['_dark']?['color']),
          ),
          bg: resolveColorFromString(data?['_dark']?[':invalid']?['bg']),
          borderRadius: data?['_dark']?[':invalid']?['borderRadius'] != null
              ? double.tryParse(data![':invalid']!['borderRadius']!.toString())
              : null,
          borderWidth: data?['_dark']?[':invalid']?['borderWidth'] != null
              ? double.tryParse(data![':invalid']!['borderWidth']!.toString())
              : null,
          borderColor: resolveColorFromString(
              data?['_dark']?[':invalid']?['borderColor']),
          borderBottomColor: resolveColorFromString(
              data?['_dark']?[':invalid']?['borderBottomColor']),
          onHover: GSStyle(
            borderColor: resolveColorFromString(
                data?['_dark']?[':invalid']?[':hover']?['borderColor']),
            borderBottomColor: resolveColorFromString(
                data?['_dark']?[':invalid']?[':hover']?['borderBottomColor']),
          ),
          onFocus: GSStyle(
            borderColor: resolveColorFromString(
                data?['_dark']?[':invalid']?[':focus']?['borderColor']),
            borderBottomColor: resolveColorFromString(
                data?['_dark']?[':invalid']?[':focus']?['borderBottomColor']),
          ),
          onDisabled: GSStyle(
            borderColor: resolveColorFromString(data?['_dark']?[':invalid']
                ?[':disabled']?[':hover']?['borderColor']),
            borderBottomColor: resolveColorFromString(data?['_dark']
                ?[':invalid']?[':disabled']?[':hover']?['borderBottomColor']),
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
      trackColorTrue:
          data?['props'] != null && data?['props']?['trackColor'] != null
              ? resolveColorFromString(data?['props']?['trackColor']?['true'])
              : null,
      trackColorFalse:
          data?['props'] != null && data?['props']?['trackColor'] != null
              ? resolveColorFromString(data?['props']?['trackColor']?['false'])
              : null,
      thumbColor:
          data?['props'] != null && data?['props']?['thumbColor'] != null
              ? resolveColorFromString(data?['props']?['thumbColor'])
              : null,
      activeThumbColor:
          data?['props'] != null && data?['props']?['activeThumbColor'] != null
              ? resolveColorFromString(data?['props']?['activeThumbColor'])
              : null,
      iosBackgroundColor: data?['props'] != null &&
              data?['props']?['ios_backgroundColor'] != null
          ? resolveColorFromString(data?['props']?['ios_backgroundColor'])
          : null,
      scale: data?['transform'] != null
          ? (data?['transform'].first as Map).isNotEmpty
              ? (data?['transform'].first as Map)['scale']
              : null
          : null,
      iconColor: resolveColorFromString(
        data?['_icon']?['color'] ?? data?['_selectedIcon']?['color'],
      ),
      shadowColor: resolveColorFromString(data?['shadowColor']),
      shadowRadius: data?['shadowRadius'] != null
          ? double.tryParse(data!['shadowRadius'].toString())
          : null,
      shadowOpacity: data?['shadowOpacity'] != null
          ? double.tryParse(data!['shadowOpacity'].toString())
          : null,
      elevation: data?['elevation'] != null
          ? double.tryParse(data!['elevation'].toString())
          : null,
      textAlign: resolveTextAlignmentFromString(data?['textAlign']),
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
      case GSActions.attention:
        return variants?.action?.attention;
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
      case GSVariants.accent:
        return variants?.variant?.accent;
      case GSVariants.filled:
        return variants?.variant?.filled;
      case GSVariants.unfilled:
        return variants?.variant?.unfilled;
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
      default:
        return null;
    }
  }

  GSStyle? spaceMap(GSSpaces? gsSpaces) {
    if (gsSpaces == null) return null;

    switch (gsSpaces) {
      case GSSpaces.$none:
        return variants?.space?.$none;
      case GSSpaces.$xs:
        return variants?.space?.$xs;
      case GSSpaces.$sm:
        return variants?.space?.$sm;
      case GSSpaces.$md:
        return variants?.space?.$md;
      case GSSpaces.$lg:
        return variants?.space?.$lg;
      case GSSpaces.$xl:
        return variants?.space?.$xl;
      case GSSpaces.$2xl:
        return variants?.space?.$2xl;
      case GSSpaces.$3xl:
        return variants?.space?.$3xl;
      case GSSpaces.$4xl:
        return variants?.space?.$4xl;
      default:
        return null;
    }
  }
}
