import 'package:flutter/foundation.dart';
import 'package:gluestack_ui/src/provider/provider.dart';
import 'package:gluestack_ui/src/style/base_style.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';

//for ease in export | No need to import from provider everywhere else.
export 'package:gluestack_ui/src/provider/provider.dart';
export 'package:gluestack_ui/src/utils/extension.dart';
export 'gs_inline_style.dart';

enum GSTextTransform { uppercase, lowercase }

enum GSBorderRadius { $none, $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $full }

enum GSTypes { single, multiple }

enum GSOutlineStyle { solid }

enum GSDirection { row, column }

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

// class GSPlacement {
//   GSStyle? topRight;
//   GSStyle? topLeft;
//   GSStyle? bottomRight;
//   GSStyle? bottomLeft;
//   GSStyle? topCenter;
//   GSStyle? bottomCenter;
//   GSPlacement(
//       {this.bottomCenter,
//       this.bottomLeft,
//       this.bottomRight,
//       this.topCenter,
//       this.topLeft,
//       this.topRight});
//   factory GSPlacement.fromMap({required Map<String, dynamic>? data}) {
//     return GSPlacement(
//       bottomCenter:
//           GSStyle.fromMap(data: data?['bottom center'], fromVariant: true),
//       bottomLeft:
//           GSStyle.fromMap(data: data?['bottom left'], fromVariant: true),
//       bottomRight:
//           GSStyle.fromMap(data: data?['bottom right'], fromVariant: true),
//       topCenter: GSStyle.fromMap(data: data?['top center'], fromVariant: true),
//       topLeft: GSStyle.fromMap(data: data?['top left'], fromVariant: true),
//       topRight: GSStyle.fromMap(data: data?['top right'], fromVariant: true),
//     );
//   }
// }

class GSProps {
  GSActions? action;
  GSVariants? variant;
  GSSizes? size;
  GSSpaces? space;
  GSConfigStyle? style;
  GSPlacements? placement;
  GSOrientations? orientation;
  String? color;
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
        style: GSConfigStyle.fromMap(data: data, fromVariant: true),
        color: resolveColorTokenFromString(data?['color']),
        placement: resolvePlacementFromString(data?['placement']),
        orientation: resolveOrientationsFromString(
          data?['orientation'],
        ));
  }
}

class GSOrientation {
  GSConfigStyle? vertical;
  GSConfigStyle? horizontal;
  GSOrientation({this.horizontal, this.vertical});
  factory GSOrientation.fromMap({required Map<String, dynamic>? data}) {
    return GSOrientation(
      vertical:
          GSConfigStyle.fromMap(data: data?['vertical'], fromVariant: true),
      horizontal:
          GSConfigStyle.fromMap(data: data?['horizontal'], fromVariant: true),
    );
  }
}

class GSVariant {
  Map<GSVariants, GSConfigStyle?> styles;
  GSVariant({this.styles = const {}});

  factory GSVariant.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
  }) {
    var variantStyles = <GSVariants, GSConfigStyle?>{};
    for (GSVariants enumValue in GSVariants.values) {
      var key = enumValue.name;
      if (data?[key] is Map<String, dynamic> &&
          (data?.containsKey(key) ?? false)) {
        variantStyles[enumValue] = GSConfigStyle.fromMap(
          data: data![key],
          descendantStyle: descendantStyle,
          fromVariant: true,
        );
      }
    }

    return GSVariant(styles: variantStyles);
  }
}

class GSAction {
  Map<GSActions, GSConfigStyle?> styles;
  GSAction({this.styles = const {}});

  factory GSAction.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
  }) {
    var actionStyles = <GSActions, GSConfigStyle?>{};
    for (GSActions enumValue in GSActions.values) {
      var key = enumValue.name;
      if (data?[key] is Map<String, dynamic> &&
          (data?.containsKey(key) ?? false)) {
        actionStyles[enumValue] = GSConfigStyle.fromMap(
          data: data![key],
          descendantStyle: descendantStyle,
          fromVariant: true,
        );
      }
    }

    return GSAction(styles: actionStyles);
  }
}

class GSPlacement {
  Map<GSPlacements, GSConfigStyle?> styles;
  GSPlacement({this.styles = const {}});

  factory GSPlacement.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
  }) {
    String convertToConfigKey(String input) {
      List<String> words = input.split(RegExp(r"(?=[A-Z])"));
      String result = words.map((word) {
        if (word.isNotEmpty) {
          return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
        } else {
          return "";
        }
      }).join(" ");
      return result.toLowerCase();
    }

    var placementStyles = <GSPlacements, GSConfigStyle?>{};
    for (GSPlacements enumValue in GSPlacements.values) {
      var key = enumValue.name;
      key = convertToConfigKey(key);

      if (data?[key] is Map<String, dynamic> &&
          (data?.containsKey(key) ?? false)) {
        // configKey = key.split('').join(' ').toLowerCase();

        placementStyles[enumValue] = GSConfigStyle.fromMap(
          data: data![key],
          descendantStyle: descendantStyle,
          fromVariant: true,
        );
      }
    }

    return GSPlacement(styles: placementStyles);
  }
}

class GSSpace {
  Map<GSSpaces, GSConfigStyle?> styles;
  GSSpace({this.styles = const {}});

  factory GSSpace.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
  }) {
    var spaceStyles = <GSSpaces, GSConfigStyle?>{};
    for (GSSpaces enumValue in GSSpaces.values) {
      //cuz of $ sign
      var key = enumValue.name.substring(1);

      if (data?[key] is Map<String, dynamic> &&
          (data?.containsKey(key) ?? false)) {
        spaceStyles[enumValue] = GSConfigStyle.fromMap(
          data: data![key],
          descendantStyle: descendantStyle,
          fromVariant: true,
        );
      }
    }

    return GSSpace(styles: spaceStyles);
  }
}

class GSSize {
  Map<GSSizes, GSConfigStyle?> styles;
  GSSize({this.styles = const {}});

  factory GSSize.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
  }) {
    var sizeStyles = <GSSizes, GSConfigStyle?>{};
    for (GSSizes enumValue in GSSizes.values) {
      //cuz of $ sign
      var key = enumValue.name.substring(1);

      if (data?[key] is Map<String, dynamic> &&
          (data?.containsKey(key) ?? false)) {
        //to handle edge case where values were being list n stuff

        sizeStyles[enumValue] = GSConfigStyle.fromMap(
          data: data![key],
          descendantStyle: descendantStyle,
          fromVariant: true,
        );
      }
    }
    return GSSize(styles: sizeStyles);
  }

  GSSize merge(GSSize? overrideSize) {
    var mergedStyles = Map.of(styles);
    if (overrideSize?.styles != null) {
      for (var entry in overrideSize!.styles.entries) {
        mergedStyles[entry.key] = entry.value;
      }
    }

    return GSSize(styles: mergedStyles);
  }
}

class Variants {
  GSVariant? variant;
  GSSize? size;
  GSAction? action;
  GSSpace? space;
  //try to make these properties of heading into a single class
  GSConfigStyle? highlight;
  GSConfigStyle? sub;
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
      size:
          GSSize.fromMap(data: data?['size'], descendantStyle: descendantStyle),
      variant: GSVariant.fromMap(
          data: data?['variant'], descendantStyle: descendantStyle),
      action: GSAction.fromMap(
          data: data?['action'], descendantStyle: descendantStyle),
      space: GSSpace.fromMap(
        data: data?['space'],
      ),
      sub: GSConfigStyle.fromMap(
          data: data?['sub']?['true'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      highlight: GSConfigStyle.fromMap(
          data: data?['highlight']?['true'],
          descendantStyle: descendantStyle,
          fromVariant: true),
      placements: GSPlacement.fromMap(data: data?['placement']),
      orientation: GSOrientation.fromMap(data: data?['orientation']),
    );
  }
}

/*

after adding decdent style check need for textStyle

*/
//TODO: add font family support later on, context accordion theme config
class GSConfigStyle extends BaseStyle<GSConfigStyle> {
  double? borderWidth;
  String? borderColor;
  double? borderRadius;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  double? opacity;
  String? color;
  String? bg;
  double? gap;
  String? borderBottomColor;
  double? height;
  double? width;
  double? borderBottomWidth;
  double? borderLeftWidth;
  TextStyle? textStyle;
  GSConfigStyle? checked;
  Variants? variants;
  GSProps? props;
  Map<String, GSConfigStyle?>? descendantStyles;
  GSFlexDirections? flexDirection;
  GSAlignments? alignItems;
  GSAlignments? justifyContent;
  double? maxWidth;
  AlignmentGeometry? alignment;

  double? top;
  double? bottom;
  double? right;
  double? left;

  String? progressValueColor;
  //for splash n highlight for pressable
  // String? highlightColor;
  // String? splashColor;
  GSConfigStyle? badge;
  GSTextTransform? textTransform;
  GSSizes? iconSize;

  //switch props
  String? trackColorTrue;
  String? trackColorFalse;
  String? thumbColor;
  String? activeThumbColor;
  String? iosBackgroundColor;
  double? scale;
  GSCursors? cursors;
  GSPlacement? placement;

  bool? isVisible;
  Axis? direction;
  double? outlineWidth;
  String? outlineColor;
  GSOutlineStyle? outlineStyle;
  Map<String, GSConfigStyle>? compoundVariants;

  double indent;
  double endIndent;

  //Accordion
  String? iconColor;
  GSConfigStyle? item;
  String? shadowColor;
  double? shadowRadius;
  double? shadowOpacity;
  double? elevation;
  ShadowOffset? shadowOffset;
  TextAlign? textAlign;

  GSConfigStyle({
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
  });

  @override
  copy() {
    return this;
  }

  @override
  merge(overrideStyle, {List<String> descendantStyleKeys = const []}) {
    return GSConfigStyle(
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

  factory GSConfigStyle.fromGSStyle(GSStyle gsStyle) {
    return GSConfigStyle(
      borderWidth: gsStyle.borderWidth,
      borderColor: gsStyle.borderColor?.toString(),
      borderRadius: gsStyle.borderRadius,
      padding: gsStyle.padding,
      margin: gsStyle.margin,
      opacity: gsStyle.opacity,
      color: gsStyle.color?.toString(),
      bg: gsStyle.bg?.toString(),
      gap: gsStyle.gap,
      borderBottomColor: gsStyle.borderBottomColor?.toString(),
      height: gsStyle.height,
      width: gsStyle.width,
      borderBottomWidth: gsStyle.borderBottomWidth,
      borderLeftWidth: gsStyle.borderLeftWidth,
      textStyle: gsStyle.textStyle,
      flexDirection: gsStyle.flexDirection,
      alignItems: gsStyle.alignItems,
      justifyContent: gsStyle.justifyContent,
      maxWidth: gsStyle.maxWidth,
      alignment: gsStyle.alignment,
      top: gsStyle.top,
      bottom: gsStyle.bottom,
      right: gsStyle.right,
      left: gsStyle.left,
      progressValueColor: gsStyle.progressValueColor?.toString(),
      textTransform: gsStyle.textTransform,
      iconSize: gsStyle.iconSize,
      trackColorTrue: gsStyle.trackColorTrue?.toString(),
      trackColorFalse: gsStyle.trackColorFalse?.toString(),
      thumbColor: gsStyle.thumbColor?.toString(),
      activeThumbColor: gsStyle.activeThumbColor?.toString(),
      iosBackgroundColor: gsStyle.iosBackgroundColor?.toString(),
      scale: gsStyle.scale,
      cursors: gsStyle.cursors,
      placement: gsStyle.placement,
      isVisible: gsStyle.isVisible,
      direction: gsStyle.direction,
      outlineWidth: gsStyle.outlineWidth,
      outlineColor: gsStyle.outlineColor?.toString(),
      outlineStyle: gsStyle.outlineStyle,
      indent: gsStyle.indent,
      endIndent: gsStyle.endIndent,
      iconColor: gsStyle.iconColor?.toString(),
      shadowColor: gsStyle.shadowColor?.toString(),
      shadowRadius: gsStyle.shadowRadius,
      shadowOpacity: gsStyle.shadowOpacity,
      elevation: gsStyle.elevation,
      shadowOffset: gsStyle.shadowOffset,
      textAlign: gsStyle.textAlign,
      dark: gsStyle.dark != null
          ? GSConfigStyle.fromGSStyle(gsStyle.dark!)
          : null,
      android: gsStyle.android != null
          ? GSConfigStyle.fromGSStyle(gsStyle.android!)
          : null,
      ios: gsStyle.ios != null ? GSConfigStyle.fromGSStyle(gsStyle.ios!) : null,
      web: gsStyle.web != null ? GSConfigStyle.fromGSStyle(gsStyle.web!) : null,
      sm: gsStyle.sm != null ? GSConfigStyle.fromGSStyle(gsStyle.sm!) : null,
      md: gsStyle.md != null ? GSConfigStyle.fromGSStyle(gsStyle.md!) : null,
      lg: gsStyle.lg != null ? GSConfigStyle.fromGSStyle(gsStyle.lg!) : null,
      xs: gsStyle.xs != null ? GSConfigStyle.fromGSStyle(gsStyle.xs!) : null,
      icon: gsStyle.icon != null
          ? GSConfigStyle.fromGSStyle(gsStyle.icon!)
          : null,
      input: gsStyle.input != null
          ? GSConfigStyle.fromGSStyle(gsStyle.input!)
          : null,
      badge: gsStyle.badge != null
          ? GSConfigStyle.fromGSStyle(gsStyle.badge!)
          : null,
      item: gsStyle.item != null
          ? GSConfigStyle.fromGSStyle(gsStyle.item!)
          : null,
      checked: gsStyle.checked != null
          ? GSConfigStyle.fromGSStyle(gsStyle.checked!)
          : null,
      onActive: gsStyle.onActive != null
          ? GSConfigStyle.fromGSStyle(gsStyle.onActive!)
          : null,
      onFocus: gsStyle.onFocus != null
          ? GSConfigStyle.fromGSStyle(gsStyle.onFocus!)
          : null,
      onHover: gsStyle.onHover != null
          ? GSConfigStyle.fromGSStyle(gsStyle.onHover!)
          : null,
      onInvalid: gsStyle.onInvalid != null
          ? GSConfigStyle.fromGSStyle(gsStyle.onInvalid!)
          : null,
      onDisabled: gsStyle.onDisabled != null
          ? GSConfigStyle.fromGSStyle(gsStyle.onDisabled!)
          : null,
    );
  }

  factory GSConfigStyle.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
    bool fromVariant = false,
  }) {
    return GSConfigStyle(
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
      badge: GSConfigStyle(
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
        // color: resolveColorFromString(data?['_text']?['color'] ??
        //     data?['_titleText']?['color'] ??
        //     data?['_subtitleText']?['color'] ??
        //     data?['_contentText']?['color'] ??
        //     data?['_selectedLabelText']?['color'] ??
        //     data?['_unselectedLabelText']?['color'] ??
        //     data?['color']),
      ),

      color: resolveColorTokenFromString(data?['color'] ??
          data?['_text']?['color'] ??
          data?['_titleText']?['color'] ??
          data?['_subtitleText']?['color'] ??
          data?['_contentText']?['color'] ??
          data?['_selectedLabelText']?['color'] ??
          data?['_unselectedLabelText']?['color']),
      bg: resolveColorTokenFromString(
        data?['bg'] ??
            data?['_item']?['backgroundColor'] ??
            data?['backgroundColor'],
      ),
      borderWidth: data?['borderWidth'] != null
          ? double.tryParse(data!['borderWidth']!.toString()) ??
              resolveBorderWidthFromString(data['borderWidth'])
          : null,
      gap: resolveSpaceFromString(
          data?['gap'] ?? data?['_avatar']?['ml'].toString()),
      borderColor: resolveColorTokenFromString(data?['borderColor']),
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
      item: GSConfigStyle(
        bg: resolveColorTokenFromString(data?['_item']?['backgroundColor']),
      ),
      shadowOffset: ShadowOffset.fromJson(data: data?['shadowOffset']),
      checked: GSConfigStyle(
        thumbColor: resolveColorTokenFromString(
            data?[':checked']?['props']?['thumbColor']),
        color: resolveColorTokenFromString(data?[':checked']?['color']),
        bg: resolveColorTokenFromString(data?[':checked']?['bg']),
        borderColor:
            resolveColorTokenFromString(data?[':checked']?['borderColor']),
        onHover: GSConfigStyle(
          color: resolveColorTokenFromString(
              data?[':checked']?[':hover']?['color']),
        ),
      ),
      onHover: GSConfigStyle(
        color: resolveColorTokenFromString(data?[':hover']?['color']),
        textStyle: TextStyle(
          decoration: resolveTextDecorationFromString(
              data?[':hover']?['textDecorationLine']),
        ),
        // checked: GSStyle(
        //     color:
        //         resolveColorTokenFromString(data?[':hover']?[':checked']?['color'])),
        bg: resolveColorTokenFromString(data?[':hover']?['bg']),
        borderColor:
            resolveColorTokenFromString(data?[':hover']?['borderColor']),
        borderBottomColor:
            resolveColorTokenFromString(data?[':hover']?['borderColor']),
        trackColorTrue: resolveColorTokenFromString(
            data?[':hover']?['props']?['trackColor']?['true']),
        trackColorFalse: resolveColorTokenFromString(
            data?[':hover']?['props']?['trackColor']?['false']),

        iosBackgroundColor: resolveColorTokenFromString(
            data?[':hover']?['props']?['ios_backgroundColor']),
        onInvalid: GSConfigStyle(
          borderColor: resolveColorTokenFromString(
              data?[':hover']?['invalid']?['borderColor']),
          trackColorTrue: resolveColorTokenFromString(
              data?[':hover']?[':invalid']?['props']?['trackColor']?['true']),
          trackColorFalse: resolveColorTokenFromString(
              data?[':hover']?[':invalid']?['props']?['trackColor']?['false']),
        ),
        onDisabled: GSConfigStyle(
          bg: resolveColorTokenFromString(data?[':hover']?[':disabled']?['bg']),
          onInvalid: GSConfigStyle(
            borderColor: resolveColorTokenFromString(
              data?[':hover']?[':disabled']?[':invalid']?['borderColor'],
            ),
          ),
        ),
        checked: GSConfigStyle(
          onHover: GSConfigStyle(
            color: resolveColorTokenFromString(data?[':checked']?[':hover']
                    ?['color'] ??
                data?[':hover']?[':checked']?['color']),
          ),
          bg: resolveColorTokenFromString(
              data?[':hover']?[':checked']?['bg'] ?? data?[':hover']?['bg']),
          borderColor: resolveColorTokenFromString(data?[':hover']?[':checked']
                  ?['borderColor'] ??
              data?[':hover']?['borderColor']),
          color: resolveColorTokenFromString(
              data?[':hover']?[':checked']?['color']),
          onDisabled: GSConfigStyle(
            bg: resolveColorTokenFromString(
                data?[':hover']?[':checked']?[':disabled']?['bg']),
            borderColor: resolveColorTokenFromString(
                data?[':hover']?[':checked']?[':disabled']?['borderColor']),
            onInvalid: GSConfigStyle(
                borderColor: resolveColorTokenFromString(data?[':hover']
                    ?[':checked']?[':disabled']?['invalid']?['borderColor'])),
          ),
        ),
      ),
      onFocus: GSConfigStyle(
        borderColor: kIsWeb
            ? resolveColorTokenFromString(data?['_web']?[':focusVisible']
                    ?['outlineColor'] ??
                data?[':focus']?['borderColor'])
            : resolveColorTokenFromString(data?[':focus']?['borderColor']),
        borderWidth: kIsWeb
            ? resolveSpaceFromString(
                data?['_web']?[':focusVisible']?['outlineWidth'].toString())
            : null,
        bg: resolveColorTokenFromString(data?[':focus']?['bg']),
        borderBottomColor:
            resolveColorTokenFromString(data?[':focus']?['borderBottomColor']),
        onHover: GSConfigStyle(
          borderBottomColor: resolveColorTokenFromString(
            data?[':focus']?[':hover']?['borderColor'],
          ),
        ),
      ),
      onActive: GSConfigStyle(
        color: resolveColorTokenFromString(data?[':active']?['color']),
        bg: resolveColorTokenFromString(data?[':active']?['bg']),
        borderColor:
            resolveColorTokenFromString(data?[':active']?['borderColor']),
        borderBottomColor:
            resolveColorTokenFromString(data?[':active']?['borderBottomColor']),
        checked: GSConfigStyle(
          bg: resolveColorTokenFromString(data?[':active']?[":checked"]?['bg']),
          borderColor: resolveColorTokenFromString(
              data?[':active']?[":checked"]?['borderColor']),
        ),
        onInvalid: GSConfigStyle(
          borderColor: resolveColorTokenFromString(
              data?[':active']?[":invalid"]?['borderColor']),
        ),
      ),
      onInvalid: GSConfigStyle(
        // textStyle: TextStyle(
        //   color: resolveColorFromString(data?[':invalid']?['color']),
        // ),
        color: resolveColorTokenFromString(data?[':invalid']?['color']),
        bg: resolveColorTokenFromString(data?[':invalid']?['bg']),
        borderColor: resolveColorTokenFromString(data?['variants']?['variant']
                ?['default']?[':invalid']?['borderColor'] ??
            data?[':invalid']?['borderColor']),
        borderBottomColor: resolveColorTokenFromString(
            data?[':invalid']?['borderBottomColor']),
        borderRadius: data?[':invalid']?['borderRadius'] != null
            ? double.tryParse(data![':invalid']!['borderRadius']!.toString())
            : null,
        borderWidth: data?[':invalid']?['borderWidth'] != null
            ? double.tryParse(data![':invalid']!['borderWidth']!.toString())
            : null,
        onHover: GSConfigStyle(
          borderColor: resolveColorTokenFromString(
              data?[':invalid']?[':hover']?['borderColor']),
          borderBottomColor: resolveColorTokenFromString(
              data?[':invalid']?[':hover']?['borderBottomColor']),
        ),
        onFocus: GSConfigStyle(
          borderColor: resolveColorTokenFromString(
              data?[':invalid']?[':focus']?['borderColor']),
          borderBottomColor: resolveColorTokenFromString(
              data?[':invalid']?[':focus']?['borderBottomColor']),
        ),
        onDisabled: GSConfigStyle(
          borderColor: resolveColorTokenFromString(
              data?[':invalid']?[':disabled']?[':hover']?['borderColor']),
          borderBottomColor: resolveColorTokenFromString(
              data?[':invalid']?[':disabled']?[':hover']?['borderBottomColor']),
        ),
      ),
      onDisabled: GSConfigStyle(
        opacity: data?[':disabled']?['opacity'],
        // textStyle: TextStyle(
        //   color: resolveColorFromString(data?[':disabled']?['color']),
        // ),
        color: resolveColorTokenFromString(data?[':disabled']?['color']),
        web: GSConfigStyle(
          cursors:
              resolveCursorFromString(data?[':disabled']?['_web']?['cursor']),
          onDisabled: GSConfigStyle(
            cursors: resolveCursorFromString(
                data?[':disabled']?['_web']?[':disabled']?['cursor']),
          ),
        ),
        trackColorTrue: resolveColorTokenFromString(
            data?[':disabled']?['trackColor']?['true']),
        trackColorFalse: resolveColorTokenFromString(
            data?[':disabled']?['trackColor']?['false']),
        iosBackgroundColor: resolveColorTokenFromString(
            data?[':disabled']?['ios_backgroundColor']),
        borderColor: data?[':disabled']?['borderColor'],
        onInvalid: GSConfigStyle(
            borderColor: data?[':disabled']?['invalid']?['borderColor']),
        onHover: GSConfigStyle(
          borderColor: resolveColorTokenFromString(
            data?[':disabled']?[':hover']?['borderColor'],
          ),
          trackColorTrue: resolveColorTokenFromString(
              data?[':disabled']?[':hover']?['props']?['trackColor']?['true']),
          trackColorFalse: resolveColorTokenFromString(
              data?[':disabled']?[':hover']?['props']?['trackColor']['false']),
        ),
      ),
      dark: GSConfigStyle(
        iconColor: resolveColorTokenFromString(
          data?['_icon']?['_dark']?['color'] ??
              data?['_selectedIcon']?['_dark']?['color'] ??
              data?['_unselectedIcon']?['_dark']?['color'],
        ),
        item: GSConfigStyle(
          bg: resolveColorTokenFromString(
              data?['_dark']?['_item']?['backgroundColor']),
        ),
        web: GSConfigStyle(
          onFocus: GSConfigStyle(
            outlineColor: resolveColorTokenFromString(
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
        color: resolveColorTokenFromString((data?['_dark']?['color'] ??
            data?['_text']?['_dark']?['color'] ??
            data?['_selectedLabelText']?['_dark']?['color'] ??
            data?['_unselectedLabelText']?['_dark']?['color'])),
        textStyle: TextStyle(
          fontWeight: resolveFontWeightFromString(data?['fontWeight']),
          // color: resolveColorFromString(data?['_text']?['_dark']?['color'] ??
          //     data?['_selectedLabelText']?['_dark']?['color'] ??
          //     data?['_unselectedLabelText']?['_dark']?['color'] ??
          //     data?['_dark']?['color']),
        ),
        borderColor:
            resolveColorTokenFromString(data?['_dark']?['borderColor']),
        bg: resolveColorTokenFromString(data?['_dark']?['bg'] ??
            data?['_dark']?['_item']?['backgroundColor'] ??
            data?['_dark']?['backgroundColor']),
        onActive: GSConfigStyle(
          bg: resolveColorTokenFromString(data?['_dark']?[':active']?['bg']),
          borderColor: resolveColorTokenFromString(
              data?['_dark']?[':active']?['borderColor']),
          borderBottomColor: resolveColorTokenFromString(
              data?['_dark']?[':active']?['borderBottomColor']),
          checked: GSConfigStyle(
            bg: resolveColorTokenFromString(
                data?['_dark']?[':active']?[":checked"]?['bg']),
            borderColor: resolveColorTokenFromString(
                data?['_dark']?[':active']?[":checked"]?['borderColor']),
          ),
          onInvalid: GSConfigStyle(
            borderColor: resolveColorTokenFromString(
                data?['_dark']?[':active']?[":invalid"]?['borderColor']),
          ),
        ),
        checked: GSConfigStyle(
            color: resolveColorTokenFromString(
                data?['_dark']?[':checked']?['color']),
            onHover: GSConfigStyle(
                color: resolveColorTokenFromString(
                    data?['_dark']?[':checked']?[':hover']?['color']))),
        onHover: GSConfigStyle(
            color: resolveColorTokenFromString(
                data?['_dark']?[':hover']?['color']),
            trackColorTrue: resolveColorTokenFromString(
                data?['_dark']?[':hover']?['props']?['trackColor']?['true']),
            trackColorFalse: resolveColorTokenFromString(
                data?['_dark']?[':hover']?['props']?['trackColor']?['false']),
            iosBackgroundColor: resolveColorTokenFromString(
                data?['_dark']?[':hover']?['props']?['ios_backgroundColor']),
            checked: GSConfigStyle(
              color: resolveColorTokenFromString(
                  data?['_dark']?[':hover']?[':checked']?['color']),
              bg: resolveColorTokenFromString(
                  data?['_dark']?[':hover']?[':checked']?['bg']),
              borderColor: resolveColorTokenFromString(
                  data?['_dark']?[':hover']?[':checked']?['borderColor']),
              onDisabled: GSConfigStyle(
                bg: resolveColorTokenFromString(data?['_dark']?[':hover']
                    ?[':checked']?[':disabled']?['bg']),
                borderColor: resolveColorTokenFromString(data?['_dark']
                    ?[':hover']?[':checked']?[':disabled']?['borderColor']),
                onInvalid: GSConfigStyle(
                  borderColor: resolveColorTokenFromString(data?['_dark']
                      ?[':hover']?[':checked']?[':disabled']?['borderColor']),
                ),
              ),
            ),
            borderColor: resolveColorTokenFromString(
                data?['_dark']?[':hover']?['borderColor']),
            bg: resolveColorTokenFromString(data?['_dark']?[':hover']?['bg']),
            onInvalid: GSConfigStyle(
              trackColorTrue: resolveColorTokenFromString(data?['_dark']
                  ?[':hover']?[':invalid']?['props']?['trackColor']?['true']),
              trackColorFalse: resolveColorTokenFromString(data?['_dark']
                  ?[':hover']?[':invalid']?['props']?['trackColor']?['false']),
            )),
        onFocus: GSConfigStyle(
          borderColor: kIsWeb
              ? resolveColorTokenFromString(
                  data?['_web']?[':focusVisible']?['_dark']?['outlineColor'])
              : resolveColorTokenFromString(
                  data?['_dark']?[':focus']?['borderColor']),
          borderWidth: kIsWeb
              ? resolveSpaceFromString(
                  data?['_web']?[':focusVisible']?['outlineWidth'].toString())
              : null,
          onHover: GSConfigStyle(
            borderColor: resolveColorTokenFromString(
                data?['_dark']?[':focus']?[':hover']?['borderColor']),
          ),
        ),
        onDisabled: GSConfigStyle(
          borderColor: resolveColorTokenFromString(
              data?['_dark']?[':disabled']?['borderColor']),
          trackColorTrue: resolveColorTokenFromString(
              data?['_dark']?[':disabled']?['trackColor']?['true']),
          trackColorFalse: resolveColorTokenFromString(
              data?['_dark']?[':disabled']?['trackColor']?['false']),
          iosBackgroundColor: resolveColorTokenFromString(
              data?['_dark']?[':disabled']?['ios_backgroundColor']),
          opacity: data?['_dark']?[':disabled']?['opacity'],
          // textStyle: TextStyle(
          //   color:
          //       resolveColorFromString(data?[':disabled']?['_dark']?['color']),
          // ),
          color: resolveColorTokenFromString(data?[':disabled']?['_dark']?['color']),
          web: GSConfigStyle(
            cursors: resolveCursorFromString(
                data?['_dark']?[':disabled']?['_web']?['cursor']),
            onDisabled: GSConfigStyle(
              cursors: resolveCursorFromString(data?['_dark']?[':disabled']
                  ?['_web']?[':disabled']?['cursor']),
            ),
          ),
          onHover: GSConfigStyle(
            borderColor: resolveColorTokenFromString(
                data?['_dark']?[':disabled']?[':hover']?['borderColor']),
            trackColorTrue: resolveColorTokenFromString(data?['_dark']
                ?[':disabled']?[':hover']?[':props']?['trackColor']?['true']),
            trackColorFalse: resolveColorTokenFromString(data?['_dark']
                ?[':disabled']?[':hover']?[':props']?['trackColor']?['false']),
          ),
        ),
        onInvalid: GSConfigStyle(
          // textStyle: TextStyle(
          //   color:
          //       resolveColorFromString(data?[':invalid']?['_dark']?['color']),
          // ),
          color: resolveColorTokenFromString(
              data?[':invalid']?['_dark']?['color']),
          bg: resolveColorTokenFromString(data?['_dark']?[':invalid']?['bg']),
          borderRadius: data?['_dark']?[':invalid']?['borderRadius'] != null
              ? double.tryParse(data![':invalid']!['borderRadius']!.toString())
              : null,
          borderWidth: data?['_dark']?[':invalid']?['borderWidth'] != null
              ? double.tryParse(data![':invalid']!['borderWidth']!.toString())
              : null,
          borderColor: resolveColorTokenFromString(
              data?['_dark']?[':invalid']?['borderColor']),
          borderBottomColor: resolveColorTokenFromString(
              data?['_dark']?[':invalid']?['borderBottomColor']),
          onHover: GSConfigStyle(
            borderColor: resolveColorTokenFromString(
                data?['_dark']?[':invalid']?[':hover']?['borderColor']),
            borderBottomColor: resolveColorTokenFromString(
                data?['_dark']?[':invalid']?[':hover']?['borderBottomColor']),
          ),
          onFocus: GSConfigStyle(
            borderColor: resolveColorTokenFromString(
                data?['_dark']?[':invalid']?[':focus']?['borderColor']),
            borderBottomColor: resolveColorTokenFromString(
                data?['_dark']?[':invalid']?[':focus']?['borderBottomColor']),
          ),
          onDisabled: GSConfigStyle(
            borderColor: resolveColorTokenFromString(data?['_dark']?[':invalid']
                ?[':disabled']?[':hover']?['borderColor']),
            borderBottomColor: resolveColorTokenFromString(data?['_dark']
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
      trackColorTrue: data?['props'] != null &&
              data?['props']?['trackColor'] != null
          ? resolveColorTokenFromString(data?['props']?['trackColor']?['true'])
          : null,
      trackColorFalse: data?['props'] != null &&
              data?['props']?['trackColor'] != null
          ? resolveColorTokenFromString(data?['props']?['trackColor']?['false'])
          : null,
      thumbColor:
          data?['props'] != null && data?['props']?['thumbColor'] != null
              ? resolveColorTokenFromString(data?['props']?['thumbColor'])
              : null,
      activeThumbColor:
          data?['props'] != null && data?['props']?['activeThumbColor'] != null
              ? resolveColorTokenFromString(data?['props']?['activeThumbColor'])
              : null,
      iosBackgroundColor: data?['props'] != null &&
              data?['props']?['ios_backgroundColor'] != null
          ? resolveColorTokenFromString(data?['props']?['ios_backgroundColor'])
          : null,
      scale: data?['transform'] != null
          ? (data?['transform'].first as Map).isNotEmpty
              ? (data?['transform'].first as Map)['scale']
              : null
          : null,
      iconColor: resolveColorTokenFromString(
        data?['_icon']?['color'] ?? data?['_selectedIcon']?['color'],
      ),
      shadowColor: resolveColorTokenFromString(data?['shadowColor']),
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

  GSConfigStyle? actionMap(GSActions? gsActions) {
    if (gsActions == null || variants?.action == null) {
      return null;
    }

    final Map<GSActions, GSConfigStyle?> actionMap = variants!.action!.styles;

    return actionMap[gsActions];
  }

  GSConfigStyle? variantMap(GSVariants? gsVariants) {
    if (gsVariants == null || variants?.variant == null) {
      return null;
    }

    final Map<GSVariants, GSConfigStyle?> variantMap =
        variants!.variant!.styles;

    return variantMap[gsVariants];
  }

  GSConfigStyle? sizeMap(GSSizes? gsSizes) {
    if (gsSizes == null || variants?.size == null) {
      return null;
    }

    final Map<GSSizes, GSConfigStyle?> sizeMap = variants!.size!.styles;

    // print(sizeMap);

    return sizeMap[gsSizes];
  }

  GSConfigStyle? spaceMap(GSSpaces? gsSpaces) {
    if (gsSpaces == null || variants?.space == null) {
      return null;
    }

    final Map<GSSpaces, GSConfigStyle?> spaceMap = variants!.space!.styles;

    return spaceMap[gsSpaces];
  }

  GSConfigStyle? placementMap(GSPlacements? gsPlacements) {
    if (gsPlacements == null || variants?.placements == null) {
      return null;
    }

    final Map<GSPlacements, GSConfigStyle?> placementMap =
        variants!.placements!.styles;

    return placementMap[gsPlacements];
  }
}
