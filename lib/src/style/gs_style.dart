import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/base_style.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';

//for ease in export | No need to import from provider everywhere else.
export 'package:gluestack_ui/src/provider/provider.dart';

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
//   GSStyleInt? topRight;
//   GSStyleInt? topLeft;
//   GSStyleInt? bottomRight;
//   GSStyleInt? bottomLeft;
//   GSStyleInt? topCenter;
//   GSStyleInt? bottomCenter;
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
//           GSStyleInt.fromMap(data: data?['bottom center'], fromVariant: true),
//       bottomLeft:
//           GSStyleInt.fromMap(data: data?['bottom left'], fromVariant: true),
//       bottomRight:
//           GSStyleInt.fromMap(data: data?['bottom right'], fromVariant: true),
//       topCenter:
//           GSStyleInt.fromMap(data: data?['top center'], fromVariant: true),
//       topLeft: GSStyleInt.fromMap(data: data?['top left'], fromVariant: true),
//       topRight: GSStyleInt.fromMap(data: data?['top right'], fromVariant: true),
//     );
//   }
// }

class GSProps {
  GSActions? action;
  GSVariants? variant;
  GSSizes? size;
  GSSpaces? space;
  GSStyleInt? style;
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
        style: GSStyleInt.fromMap(data: data, fromVariant: true),
        color: resolveColorFromString(data?['color']),
        placement: resolvePlacementFromString(data?['placement']),
        orientation: resolveOrientationsFromString(
          data?['orientation'],
        ));
  }
}

class GSOrientation {
  GSStyleInt? vertical;
  GSStyleInt? horizontal;
  GSOrientation({this.horizontal, this.vertical});
  factory GSOrientation.fromMap({required Map<String, dynamic>? data}) {
    return GSOrientation(
      vertical: GSStyleInt.fromMap(data: data?['vertical'], fromVariant: true),
      horizontal:
          GSStyleInt.fromMap(data: data?['horizontal'], fromVariant: true),
    );
  }
}

class GSVariant {
  Map<GSVariants, GSStyleInt?> styles;
  GSVariant({this.styles = const {}});

  factory GSVariant.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
  }) {
    var variantStyles = <GSVariants, GSStyleInt?>{};
    for (GSVariants enumValue in GSVariants.values) {
      var key = enumValue.name;
      if (data?[key] is Map<String, dynamic> &&
          (data?.containsKey(key) ?? false)) {
        variantStyles[enumValue] = GSStyleInt.fromMap(
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
  Map<GSActions, GSStyleInt?> styles;
  GSAction({this.styles = const {}});

  factory GSAction.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
  }) {
    var actionStyles = <GSActions, GSStyleInt?>{};
    for (GSActions enumValue in GSActions.values) {
      var key = enumValue.name;
      if (data?[key] is Map<String, dynamic> &&
          (data?.containsKey(key) ?? false)) {
        actionStyles[enumValue] = GSStyleInt.fromMap(
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
  Map<GSPlacements, GSStyleInt?> styles;
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

    var placementStyles = <GSPlacements, GSStyleInt?>{};
    for (GSPlacements enumValue in GSPlacements.values) {
      var key = enumValue.name;
      key = convertToConfigKey(key);

      if (data?[key] is Map<String, dynamic> &&
          (data?.containsKey(key) ?? false)) {
        // configKey = key.split('').join(' ').toLowerCase();

        placementStyles[enumValue] = GSStyleInt.fromMap(
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
  Map<GSSpaces, GSStyleInt?> styles;
  GSSpace({this.styles = const {}});

  factory GSSpace.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
  }) {
    var spaceStyles = <GSSpaces, GSStyleInt?>{};
    for (GSSpaces enumValue in GSSpaces.values) {
      //cuz of $ sign
      var key = enumValue.name.substring(1);

      if (data?[key] is Map<String, dynamic> &&
          (data?.containsKey(key) ?? false)) {
        spaceStyles[enumValue] = GSStyleInt.fromMap(
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
  Map<GSSizes, GSStyleInt?> styles;
  GSSize({this.styles = const {}});

  factory GSSize.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
  }) {
    var sizeStyles = <GSSizes, GSStyleInt?>{};
    for (GSSizes enumValue in GSSizes.values) {
      //cuz of $ sign
      var key = enumValue.name.substring(1);

      if (data?[key] is Map<String, dynamic> &&
          (data?.containsKey(key) ?? false)) {
        //to handle edge case where values were being list n stuff

        sizeStyles[enumValue] = GSStyleInt.fromMap(
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
  GSStyleInt? highlight;
  GSStyleInt? sub;
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
        sub: GSStyleInt.fromMap(
            data: data?['sub']?['true'],
            descendantStyle: descendantStyle,
            fromVariant: true),
        highlight: GSStyleInt.fromMap(
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
class GSStyleInt extends BaseStyle<GSStyleInt> {
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
  GSStyleInt? checked;
  Variants? variants;
  GSProps? props;
  Map<String, GSStyleInt?>? descendantStyles;
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
  GSStyleInt? badge;
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
  Map<String, GSStyleInt>? compoundVariants;

  double indent;
  double endIndent;

  //Accordion
  String? iconColor;
  GSStyleInt? item;
  String? shadowColor;
  double? shadowRadius;
  double? shadowOpacity;
  double? elevation;
  ShadowOffset? shadowOffset;
  TextAlign? textAlign;

  GSStyleInt({
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
  merge(overrideStyle, {List<String> descendantStyleKeys = const []}) {
    return GSStyleInt(
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

  factory GSStyleInt.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
    bool fromVariant = false,
  }) {
    // print(data?['_content']);
    return GSStyleInt(
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
      badge: GSStyleInt(
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

      color: resolveColorFromString2(data?['color']),
      bg: resolveColorFromString2(
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
      borderColor: resolveColorFromString2(data?['borderColor']),
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
      item: GSStyleInt(
        bg: resolveColorFromString2(data?['_item']?['backgroundColor']),
      ),
      shadowOffset: ShadowOffset.fromJson(data: data?['shadowOffset']),
      checked: GSStyleInt(
        thumbColor:
            resolveColorFromString2(data?[':checked']?['props']?['thumbColor']),
        color: resolveColorFromString2(data?[':checked']?['color']),
        bg: resolveColorFromString2(data?[':checked']?['bg']),
        borderColor: resolveColorFromString2(data?[':checked']?['borderColor']),
        onHover: GSStyleInt(
          color: resolveColorFromString2(data?[':checked']?[':hover']?['color']),
        ),
      ),
      onHover: GSStyleInt(
        color: resolveColorFromString2(data?[':hover']?['color']),
        textStyle: TextStyle(
          decoration: resolveTextDecorationFromString(
              data?[':hover']?['textDecorationLine']),
        ),
        // checked: GSStyle(
        //     color:
        //         resolveColorFromString(data?[':hover']?[':checked']?['color'])),
        bg: resolveColorFromString2(data?[':hover']?['bg']),
        borderColor: resolveColorFromString2(data?[':hover']?['borderColor']),
        borderBottomColor:
            resolveColorFromString2(data?[':hover']?['borderColor']),
        trackColorTrue: resolveColorFromString2(
            data?[':hover']?['props']?['trackColor']?['true']),
        trackColorFalse: resolveColorFromString2(
            data?[':hover']?['props']?['trackColor']?['false']),

        iosBackgroundColor: resolveColorFromString2(
            data?[':hover']?['props']?['ios_backgroundColor']),
        onInvalid: GSStyleInt(
          borderColor: resolveColorFromString2(
              data?[':hover']?['invalid']?['borderColor']),
          trackColorTrue: resolveColorFromString2(
              data?[':hover']?[':invalid']?['props']?['trackColor']?['true']),
          trackColorFalse: resolveColorFromString2(
              data?[':hover']?[':invalid']?['props']?['trackColor']?['false']),
        ),
        onDisabled: GSStyleInt(
          bg: resolveColorFromString2(data?[':hover']?[':disabled']?['bg']),
          onInvalid: GSStyleInt(
            borderColor: resolveColorFromString2(
              data?[':hover']?[':disabled']?[':invalid']?['borderColor'],
            ),
          ),
        ),
        checked: GSStyleInt(
          onHover: GSStyleInt(
            color: resolveColorFromString2(data?[':checked']?[':hover']
                    ?['color'] ??
                data?[':hover']?[':checked']?['color']),
          ),
          bg: resolveColorFromString2(
              data?[':hover']?[':checked']?['bg'] ?? data?[':hover']?['bg']),
          borderColor: resolveColorFromString2(data?[':hover']?[':checked']
                  ?['borderColor'] ??
              data?[':hover']?['borderColor']),
          color: resolveColorFromString2(data?[':hover']?[':checked']?['color']),
          onDisabled: GSStyleInt(
            bg: resolveColorFromString2(
                data?[':hover']?[':checked']?[':disabled']?['bg']),
            borderColor: resolveColorFromString2(
                data?[':hover']?[':checked']?[':disabled']?['borderColor']),
            onInvalid: GSStyleInt(
                borderColor: resolveColorFromString2(data?[':hover']?[':checked']
                    ?[':disabled']?['invalid']?['borderColor'])),
          ),
        ),
      ),
      onFocus: GSStyleInt(
        borderColor: kIsWeb
            ? resolveColorFromString2(data?['_web']?[':focusVisible']
                    ?['outlineColor'] ??
                data?[':focus']?['borderColor'])
            : resolveColorFromString2(data?[':focus']?['borderColor']),
        borderWidth: kIsWeb
            ? resolveSpaceFromString(
                data?['_web']?[':focusVisible']?['outlineWidth'].toString())
            : null,
        bg: resolveColorFromString2(data?[':focus']?['bg']),
        borderBottomColor:
            resolveColorFromString2(data?[':focus']?['borderBottomColor']),
        onHover: GSStyleInt(
          borderBottomColor: resolveColorFromString2(
            data?[':focus']?[':hover']?['borderColor'],
          ),
        ),
      ),
      onActive: GSStyleInt(
        color: resolveColorFromString2(data?[':active']?['color']),
        bg: resolveColorFromString2(data?[':active']?['bg']),
        borderColor: resolveColorFromString2(data?[':active']?['borderColor']),
        borderBottomColor:
            resolveColorFromString2(data?[':active']?['borderBottomColor']),
        checked: GSStyleInt(
          bg: resolveColorFromString2(data?[':active']?[":checked"]?['bg']),
          borderColor: resolveColorFromString2(
              data?[':active']?[":checked"]?['borderColor']),
        ),
        onInvalid: GSStyleInt(
          borderColor: resolveColorFromString2(
              data?[':active']?[":invalid"]?['borderColor']),
        ),
      ),
      onInvalid: GSStyleInt(
        textStyle: TextStyle(
          color: resolveColorFromString(data?[':invalid']?['color']),
        ),
        bg: resolveColorFromString2(data?[':invalid']?['bg']),
        borderColor: resolveColorFromString2(data?['variants']?['variant']
                ?['default']?[':invalid']?['borderColor'] ??
            data?[':invalid']?['borderColor']),
        borderBottomColor:
            resolveColorFromString2(data?[':invalid']?['borderBottomColor']),
        borderRadius: data?[':invalid']?['borderRadius'] != null
            ? double.tryParse(data![':invalid']!['borderRadius']!.toString())
            : null,
        borderWidth: data?[':invalid']?['borderWidth'] != null
            ? double.tryParse(data![':invalid']!['borderWidth']!.toString())
            : null,
        onHover: GSStyleInt(
          borderColor: resolveColorFromString2(
              data?[':invalid']?[':hover']?['borderColor']),
          borderBottomColor: resolveColorFromString2(
              data?[':invalid']?[':hover']?['borderBottomColor']),
        ),
        onFocus: GSStyleInt(
          borderColor: resolveColorFromString2(
              data?[':invalid']?[':focus']?['borderColor']),
          borderBottomColor: resolveColorFromString2(
              data?[':invalid']?[':focus']?['borderBottomColor']),
        ),
        onDisabled: GSStyleInt(
          borderColor: resolveColorFromString2(
              data?[':invalid']?[':disabled']?[':hover']?['borderColor']),
          borderBottomColor: resolveColorFromString2(
              data?[':invalid']?[':disabled']?[':hover']?['borderBottomColor']),
        ),
      ),
      onDisabled: GSStyleInt(
        opacity: data?[':disabled']?['opacity'],
        textStyle: TextStyle(
          color: resolveColorFromString(data?[':disabled']?['color']),
        ),
        web: GSStyleInt(
          cursors:
              resolveCursorFromString(data?[':disabled']?['_web']?['cursor']),
          onDisabled: GSStyleInt(
            cursors: resolveCursorFromString(
                data?[':disabled']?['_web']?[':disabled']?['cursor']),
          ),
        ),
        trackColorTrue:
            resolveColorFromString2(data?[':disabled']?['trackColor']?['true']),
        trackColorFalse:
            resolveColorFromString2(data?[':disabled']?['trackColor']?['false']),
        iosBackgroundColor:
            resolveColorFromString2(data?[':disabled']?['ios_backgroundColor']),
        borderColor: data?[':disabled']?['borderColor'],
        onInvalid: GSStyleInt(
            borderColor: data?[':disabled']?['invalid']?['borderColor']),
        onHover: GSStyleInt(
          borderColor: resolveColorFromString2(
            data?[':disabled']?[':hover']?['borderColor'],
          ),
          trackColorTrue: resolveColorFromString2(
              data?[':disabled']?[':hover']?['props']?['trackColor']?['true']),
          trackColorFalse: resolveColorFromString2(
              data?[':disabled']?[':hover']?['props']?['trackColor']['false']),
        ),
      ),
      dark: GSStyleInt(
        iconColor: resolveColorFromString2(
          data?['_icon']?['_dark']?['color'] ??
              data?['_selectedIcon']?['_dark']?['color'] ??
              data?['_unselectedIcon']?['_dark']?['color'],
        ),
        item: GSStyleInt(
          bg: resolveColorFromString2(
              data?['_dark']?['_item']?['backgroundColor']),
        ),
        web: GSStyleInt(
          onFocus: GSStyleInt(
            outlineColor: resolveColorFromString2(
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
        color: resolveColorFromString2((data?['_dark']?['color'])),
        textStyle: TextStyle(
          fontWeight: resolveFontWeightFromString(data?['fontWeight']),
          color: resolveColorFromString(data?['_text']?['_dark']?['color'] ??
              data?['_selectedLabelText']?['_dark']?['color'] ??
              data?['_unselectedLabelText']?['_dark']?['color'] ??
              data?['_dark']?['color']),
        ),
        borderColor: resolveColorFromString2(data?['_dark']?['borderColor']),
        bg: resolveColorFromString2(data?['_dark']?['bg'] ??
            data?['_dark']?['_item']?['backgroundColor'] ??
            data?['_dark']?['backgroundColor']),
        onActive: GSStyleInt(
          bg: resolveColorFromString2(data?['_dark']?[':active']?['bg']),
          borderColor: resolveColorFromString2(
              data?['_dark']?[':active']?['borderColor']),
          borderBottomColor: resolveColorFromString2(
              data?['_dark']?[':active']?['borderBottomColor']),
          checked: GSStyleInt(
            bg: resolveColorFromString2(
                data?['_dark']?[':active']?[":checked"]?['bg']),
            borderColor: resolveColorFromString2(
                data?['_dark']?[':active']?[":checked"]?['borderColor']),
          ),
          onInvalid: GSStyleInt(
            borderColor: resolveColorFromString2(
                data?['_dark']?[':active']?[":invalid"]?['borderColor']),
          ),
        ),
        checked: GSStyleInt(
            color:
                resolveColorFromString2(data?['_dark']?[':checked']?['color']),
            onHover: GSStyleInt(
                color: resolveColorFromString2(
                    data?['_dark']?[':checked']?[':hover']?['color']))),
        onHover: GSStyleInt(
            color: resolveColorFromString2(data?['_dark']?[':hover']?['color']),
            trackColorTrue: resolveColorFromString2(
                data?['_dark']?[':hover']?['props']?['trackColor']?['true']),
            trackColorFalse: resolveColorFromString2(
                data?['_dark']?[':hover']?['props']?['trackColor']?['false']),
            iosBackgroundColor: resolveColorFromString2(
                data?['_dark']?[':hover']?['props']?['ios_backgroundColor']),
            checked: GSStyleInt(
              color: resolveColorFromString2(
                  data?['_dark']?[':hover']?[':checked']?['color']),
              bg: resolveColorFromString2(
                  data?['_dark']?[':hover']?[':checked']?['bg']),
              borderColor: resolveColorFromString2(
                  data?['_dark']?[':hover']?[':checked']?['borderColor']),
              onDisabled: GSStyleInt(
                bg: resolveColorFromString2(data?['_dark']?[':hover']
                    ?[':checked']?[':disabled']?['bg']),
                borderColor: resolveColorFromString2(data?['_dark']?[':hover']
                    ?[':checked']?[':disabled']?['borderColor']),
                onInvalid: GSStyleInt(
                  borderColor: resolveColorFromString2(data?['_dark']?[':hover']
                      ?[':checked']?[':disabled']?['borderColor']),
                ),
              ),
            ),
            borderColor: resolveColorFromString2(
                data?['_dark']?[':hover']?['borderColor']),
            bg: resolveColorFromString2(data?['_dark']?[':hover']?['bg']),
            onInvalid: GSStyleInt(
              trackColorTrue: resolveColorFromString2(data?['_dark']?[':hover']
                  ?[':invalid']?['props']?['trackColor']?['true']),
              trackColorFalse: resolveColorFromString2(data?['_dark']?[':hover']
                  ?[':invalid']?['props']?['trackColor']?['false']),
            )),
        onFocus: GSStyleInt(
          borderColor: kIsWeb
              ? resolveColorFromString2(
                  data?['_web']?[':focusVisible']?['_dark']?['outlineColor'])
              : resolveColorFromString2(
                  data?['_dark']?[':focus']?['borderColor']),
          borderWidth: kIsWeb
              ? resolveSpaceFromString(
                  data?['_web']?[':focusVisible']?['outlineWidth'].toString())
              : null,
          onHover: GSStyleInt(
            borderColor: resolveColorFromString2(
                data?['_dark']?[':focus']?[':hover']?['borderColor']),
          ),
        ),
        onDisabled: GSStyleInt(
          borderColor: resolveColorFromString2(
              data?['_dark']?[':disabled']?['borderColor']),
          trackColorTrue: resolveColorFromString2(
              data?['_dark']?[':disabled']?['trackColor']?['true']),
          trackColorFalse: resolveColorFromString2(
              data?['_dark']?[':disabled']?['trackColor']?['false']),
          iosBackgroundColor: resolveColorFromString2(
              data?['_dark']?[':disabled']?['ios_backgroundColor']),
          opacity: data?['_dark']?[':disabled']?['opacity'],
          textStyle: TextStyle(
            color:
                resolveColorFromString(data?[':disabled']?['_dark']?['color']),
          ),
          web: GSStyleInt(
            cursors: resolveCursorFromString(
                data?['_dark']?[':disabled']?['_web']?['cursor']),
            onDisabled: GSStyleInt(
              cursors: resolveCursorFromString(data?['_dark']?[':disabled']
                  ?['_web']?[':disabled']?['cursor']),
            ),
          ),
          onHover: GSStyleInt(
            borderColor: resolveColorFromString2(
                data?['_dark']?[':disabled']?[':hover']?['borderColor']),
            trackColorTrue: resolveColorFromString2(data?['_dark']?[':disabled']
                ?[':hover']?[':props']?['trackColor']?['true']),
            trackColorFalse: resolveColorFromString2(data?['_dark']?[':disabled']
                ?[':hover']?[':props']?['trackColor']?['false']),
          ),
        ),
        onInvalid: GSStyleInt(
          textStyle: TextStyle(
            color:
                resolveColorFromString(data?[':invalid']?['_dark']?['color']),
          ),
          bg: resolveColorFromString2(data?['_dark']?[':invalid']?['bg']),
          borderRadius: data?['_dark']?[':invalid']?['borderRadius'] != null
              ? double.tryParse(data![':invalid']!['borderRadius']!.toString())
              : null,
          borderWidth: data?['_dark']?[':invalid']?['borderWidth'] != null
              ? double.tryParse(data![':invalid']!['borderWidth']!.toString())
              : null,
          borderColor: resolveColorFromString2(
              data?['_dark']?[':invalid']?['borderColor']),
          borderBottomColor: resolveColorFromString2(
              data?['_dark']?[':invalid']?['borderBottomColor']),
          onHover: GSStyleInt(
            borderColor: resolveColorFromString2(
                data?['_dark']?[':invalid']?[':hover']?['borderColor']),
            borderBottomColor: resolveColorFromString2(
                data?['_dark']?[':invalid']?[':hover']?['borderBottomColor']),
          ),
          onFocus: GSStyleInt(
            borderColor: resolveColorFromString2(
                data?['_dark']?[':invalid']?[':focus']?['borderColor']),
            borderBottomColor: resolveColorFromString2(
                data?['_dark']?[':invalid']?[':focus']?['borderBottomColor']),
          ),
          onDisabled: GSStyleInt(
            borderColor: resolveColorFromString2(data?['_dark']?[':invalid']
                ?[':disabled']?[':hover']?['borderColor']),
            borderBottomColor: resolveColorFromString2(data?['_dark']
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
              ? resolveColorFromString2(data?['props']?['trackColor']?['true'])
              : null,
      trackColorFalse:
          data?['props'] != null && data?['props']?['trackColor'] != null
              ? resolveColorFromString2(data?['props']?['trackColor']?['false'])
              : null,
      thumbColor:
          data?['props'] != null && data?['props']?['thumbColor'] != null
              ? resolveColorFromString2(data?['props']?['thumbColor'])
              : null,
      activeThumbColor:
          data?['props'] != null && data?['props']?['activeThumbColor'] != null
              ? resolveColorFromString2(data?['props']?['activeThumbColor'])
              : null,
      iosBackgroundColor: data?['props'] != null &&
              data?['props']?['ios_backgroundColor'] != null
          ? resolveColorFromString2(data?['props']?['ios_backgroundColor'])
          : null,
      scale: data?['transform'] != null
          ? (data?['transform'].first as Map).isNotEmpty
              ? (data?['transform'].first as Map)['scale']
              : null
          : null,
      iconColor: resolveColorFromString2(
        data?['_icon']?['color'] ?? data?['_selectedIcon']?['color'],
      ),
      shadowColor: resolveColorFromString2(data?['shadowColor']),
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

   GSStyleInt? actionMap(GSActions? gsActions) {
    if (gsActions == null || variants?.action == null) {
      return null;
    }

    final Map<GSActions, GSStyleInt?> actionMap = variants!.action!.styles;

    return actionMap[gsActions];
  }

  GSStyleInt? variantMap(GSVariants? gsVariants) {
    if (gsVariants == null || variants?.variant == null) {
      return null;
    }

    final Map<GSVariants, GSStyleInt?> variantMap = variants!.variant!.styles;

    return variantMap[gsVariants];
  }

  GSStyleInt? sizeMap(GSSizes? gsSizes) {
    if (gsSizes == null || variants?.size == null) {
      return null;
    }

    final Map<GSSizes, GSStyleInt?> sizeMap = variants!.size!.styles;

    // print(sizeMap);

    return sizeMap[gsSizes];
  }

  GSStyleInt? spaceMap(GSSpaces? gsSpaces) {
    if (gsSpaces == null || variants?.space == null) {
      return null;
    }

    final Map<GSSpaces, GSStyleInt?> spaceMap = variants!.space!.styles;

    return spaceMap[gsSpaces];
  }

  GSStyleInt? placementMap(GSPlacements? gsPlacements) {
    if (gsPlacements == null || variants?.placements == null) {
      return null;
    }

    final Map<GSPlacements, GSStyleInt?> placementMap =
        variants!.placements!.styles;

    return placementMap[gsPlacements];
  }

  @override
  GSStyleInt copy() {
    // TODO: implement copy
    throw UnimplementedError();
  }
}

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
  GSFlexDirections? flexDirection;
  GSAlignments? alignItems;
  GSAlignments? justifyContent;
  double? maxWidth;
  AlignmentGeometry? alignment;

  Map<String, GSStyle?>? descendantStyles;

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
    return GSStyle(
        borderColor: overrideStyle?.borderColor ?? borderColor,
        borderRadius: overrideStyle?.borderRadius ?? borderRadius,
        borderWidth: overrideStyle?.borderWidth ?? borderWidth,
        color: overrideStyle?.color ?? color,
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
        descendantStyles: mergeStyledMaps0(
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

  factory GSStyle.fromGSStyleInt(GSStyleInt styleInt, BuildContext context) {
    return GSStyle(
      borderWidth: styleInt.borderWidth,
      borderColor: _convertStringToColor(styleInt.borderColor, context),
      borderRadius: styleInt.borderRadius,
      padding: styleInt.padding,
      margin: styleInt.margin,
      opacity: styleInt.opacity,
      color: _convertStringToColor(styleInt.color, context),
      bg: _convertStringToColor(styleInt.bg, context),
      gap: styleInt.gap,
      borderBottomColor:
          _convertStringToColor(styleInt.borderBottomColor, context),
      height: styleInt.height,
      width: styleInt.width,
      borderBottomWidth: styleInt.borderBottomWidth,
      borderLeftWidth: styleInt.borderLeftWidth,
      textStyle: styleInt.textStyle,
      checked: styleInt.checked != null
          ? GSStyle.fromGSStyleInt(styleInt.checked!, context)
          : null,
      variants: styleInt.variants,
      props: styleInt.props,
      flexDirection: styleInt.flexDirection,
      alignItems: styleInt.alignItems,
      justifyContent: styleInt.justifyContent,
      maxWidth: styleInt.maxWidth,
      alignment: styleInt.alignment,
      top: styleInt.top,
      bottom: styleInt.bottom,
      right: styleInt.right,
      left: styleInt.left,
      progressValueColor:
          _convertStringToColor(styleInt.progressValueColor, context),
      badge: styleInt.badge != null
          ? GSStyle.fromGSStyleInt(styleInt.badge!, context)
          : null,
      textTransform: styleInt.textTransform,
      iconSize: styleInt.iconSize,
      trackColorTrue: _convertStringToColor(styleInt.trackColorTrue, context),
      trackColorFalse: _convertStringToColor(styleInt.trackColorFalse, context),
      thumbColor: _convertStringToColor(styleInt.thumbColor, context),
      activeThumbColor:
          _convertStringToColor(styleInt.activeThumbColor, context),
      iosBackgroundColor:
          _convertStringToColor(styleInt.iosBackgroundColor, context),
      scale: styleInt.scale,
      cursors: styleInt.cursors,
      placement: styleInt.placement,
      isVisible: styleInt.isVisible,
      direction: styleInt.direction,
      outlineWidth: styleInt.outlineWidth,
      outlineColor: _convertStringToColor(styleInt.outlineColor, context),
      outlineStyle: styleInt.outlineStyle,
      indent: styleInt.indent,
      endIndent: styleInt.endIndent,
      iconColor: _convertStringToColor(styleInt.iconColor, context),
      item: styleInt.item != null
          ? GSStyle.fromGSStyleInt(styleInt.item!, context)
          : null,
      shadowColor: _convertStringToColor(styleInt.shadowColor, context),
      shadowRadius: styleInt.shadowRadius,
      shadowOpacity: styleInt.shadowOpacity,
      elevation: styleInt.elevation,
      shadowOffset: styleInt.shadowOffset,
      textAlign: styleInt.textAlign,
      android: styleInt.android != null
          ? GSStyle.fromGSStyleInt(styleInt.android!, context)
          : null,
      dark: styleInt.dark != null
          ? GSStyle.fromGSStyleInt(styleInt.dark!, context)
          : null,
      icon: styleInt.icon != null
          ? GSStyle.fromGSStyleInt(styleInt.icon!, context)
          : null,
      input: styleInt.input != null
          ? GSStyle.fromGSStyleInt(styleInt.input!, context)
          : null,
      ios: styleInt.ios != null
          ? GSStyle.fromGSStyleInt(styleInt.ios!, context)
          : null,
      lg: styleInt.lg != null
          ? GSStyle.fromGSStyleInt(styleInt.lg!, context)
          : null,
      md: styleInt.md != null
          ? GSStyle.fromGSStyleInt(styleInt.md!, context)
          : null,
      onActive: styleInt.onActive != null
          ? GSStyle.fromGSStyleInt(styleInt.onActive!, context)
          : null,
      onDisabled: styleInt.onDisabled != null
          ? GSStyle.fromGSStyleInt(styleInt.onDisabled!, context)
          : null,
      onFocus: styleInt.onFocus != null
          ? GSStyle.fromGSStyleInt(styleInt.onFocus!, context)
          : null,
      onHover: styleInt.onHover != null
          ? GSStyle.fromGSStyleInt(styleInt.onHover!, context)
          : null,
      onInvalid: styleInt.onInvalid != null
          ? GSStyle.fromGSStyleInt(styleInt.onInvalid!, context)
          : null,
      sm: styleInt.sm != null
          ? GSStyle.fromGSStyleInt(styleInt.sm!, context)
          : null,
      web: styleInt.web != null
          ? GSStyle.fromGSStyleInt(styleInt.web!, context)
          : null,
      xs: styleInt.xs != null
          ? GSStyle.fromGSStyleInt(styleInt.xs!, context)
          : null,
    );
  }

  static Color? _convertStringToColor(
      String? inputColor, BuildContext context) {
    if (inputColor != null && inputColor.isNotEmpty) {
      return getColorMap(context)[inputColor];
    }
    return null;
  }

   factory GSStyle.fromMap({
    required Map<String, dynamic>? data,
    List<String> descendantStyle = const [],
    bool fromVariant = false,
  }) {
    return GSStyle(
      // descendantStyles: resolvedescendantStylesFromMap(data, descendantStyle),
      // compoundVariants:
      //     resolveCompoundVariants(compoundVariants: data?['compoundVariants']),
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

      color: resolveColorFromString(data?['color']),
      bg: resolveColorFromString(
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
        opacity: data?[':disabled']?['opacity'],
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
        borderColor: resolveColorFromString(data?['_dark']?['borderColor']),
        bg: resolveColorFromString(data?['_dark']?['bg'] ??
            data?['_dark']?['_item']?['backgroundColor'] ??
            data?['_dark']?['backgroundColor']),
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
  // factory GSStyle.fromMap({
  //   required Map<String, dynamic>? data,
  //   List<String> descendantStyle = const [],
  //   bool fromVariant = false,
  // }) {
  //   // print(data?['_content']);
  //   return GSStyle(
  //     descendantStyles: resolvedescendantStylesFromMap(data, descendantStyle),
  //     compoundVariants:
  //         resolveCompoundVariants(compoundVariants: data?['compoundVariants']),
  //     flexDirection: resolveFlexDirectionFromString(data?['flexDirection']),
  //     height: data?['h'] is int
  //         ? double.parse('${data?['h']}.0')
  //         : resolveSpaceFromString(
  //             data?['h'].toString() ?? data?['height'].toString(),
  //           ),
  //     width: data?['w'] != null
  //         ? data!['w']?.contains('100%')
  //             ? double.infinity
  //             : data['w']?.contains('%')
  //                 ? double.tryParse(data['w']?.replaceAll('%', ''))! / 100
  //                 : resolveSpaceFromString(data['w'] ?? data['width'])
  //         : resolveSpaceFromString(data?['w'] ?? data?['width']),
  //     badge: GSStyle(
  //       height: resolveSpaceFromString(
  //         data?['_badge']?['h'],
  //       ),
  //       width: resolveSpaceFromString(
  //         data?['_badge']?['w'],
  //       ),
  //     ),
  //     textTransform: resolveTextTransformFromString(data?['textTransform']),
  //     maxWidth: data?['maxWidth'] != null
  //         ? double.tryParse(data?['maxWidth']?.toString() ?? "")
  //         : null,
  //     padding: data?['p'] != null
  //         ? resolvePaddingFromString(data?['p'].toString(), 'all')
  //         : data?['px'] != null && data?['py'] != null
  //             ? resolvePaddingFromString(data?['px'].toString(), 'symmetric',
  //                 paddingy: data?['py'].toString())
  //             : data?['px'] != null
  //                 ? resolvePaddingFromString(
  //                     data?['px'].toString(), 'horizontal')
  //                 : data?['py'] != null
  //                     ? resolvePaddingFromString(
  //                         data?['py'].toString(), 'vertical')
  //                     : data?['pb'] != null
  //                         ? resolvePaddingFromString(
  //                             data?['pb'].toString(), 'only')
  //                         : null,
  //     margin: data?['m'] != null
  //         ? resolvePaddingFromString(data?['m'].toString(), 'all')
  //         : data?['mx'] != null && data?['my'] != null
  //             ? resolvePaddingFromString(data?['mx'].toString(), 'symmetric',
  //                 paddingy: data?['my'].toString())
  //             : data?['mx'] != null
  //                 ? resolvePaddingFromString(
  //                     data?['mx'].toString(), 'horizontal')
  //                 : data?['my'] != null
  //                     ? resolvePaddingFromString(
  //                         data?['my'].toString(), 'vertical')
  //                     : data?['mb'] != null
  //                         ? resolvePaddingFromString(
  //                             data?['mb'].toString(), 'only')
  //                         : data?['mt'] != null
  //                             ? resolvePaddingFromString(
  //                                 data?['mt'].toString(), 'only')
  //                             : null,
  //     bottom: resolveSpaceFromString(data?['bottom'].toString()),
  //     left: resolveSpaceFromString(data?['left'].toString()),
  //     right: resolveSpaceFromString(data?['right'].toString()),
  //     top: resolveSpaceFromString(data?['top'].toString()),
  //     iconSize: resolveSizesFromString(data?['_icon']?['props']?['size']),
  //     // resolvePaddingFromString(data?['p'] ?? data?['px'] ?? data?['py'], ),
  //     textStyle: TextStyle(
  //       fontWeight: resolveFontWeightFromString(data?['fontWeight'] ??
  //               data?['_titleText']?['fontWeight'] ??
  //               data?['_subtitleText']?['fontWeight']) ??
  //           data?['_contentText']?['fontWeight'],
  //       fontFamily: resolveFontFamilyTokenFromString(data?['fontFamily']),
  //       fontSize: resolveFontSizeFromString(data?['fontSize'] ??
  //           data?['_titleText']?['fontSize'] ??
  //           data?['_subtitleText']?['fontSize'] ??
  //           data?['props']?['size'].toString() ??
  //           data?['_contentText']?['fontSize'] ??
  //           data?['_input']?['props']?['size'].toString()),
  //       height: resolveLineHeightFromString(
  //         data?['lineHeight'] ??
  //             data?['_titleText']?['lineHeight'] ??
  //             data?['_subtitleText']?['lineHeight'] ??
  //             data?['_contentText']?['lineHeight'],
  //         data?['fontSize'] ??
  //             data?['_titleText']?['fontSize'] ??
  //             data?['_subtitleText']?['fontSize'] ??
  //             data?['_contentText']?['fontSize'],
  //       ),
  //       decoration:
  //           resolveTextDecorationFromString(data?['textDecorationLine']),
  //       letterSpacing: resolveLetterSpacingFromString(data?['letterSpacing']),
  //       // fontSize: resolveFontSizeFromString(data?['_text']?['props']?['size']),
  //       color: resolveColorFromString(data?['_text']?['color'] ??
  //           data?['_titleText']?['color'] ??
  //           data?['_subtitleText']?['color'] ??
  //           data?['_contentText']?['color'] ??
  //           data?['_selectedLabelText']?['color'] ??
  //           data?['_unselectedLabelText']?['color'] ??
  //           data?['color']),
  //     ),

  //     color: resolveColorFromString(data?['color']),
  //     color2: resolveColorFromString2(data?['bg']),
  //     bg: resolveColorFromString(
  //       data?['bg'] ??
  //           data?['_item']?['backgroundColor'] ??
  //           data?['backgroundColor'],
  //     ),
  //     borderWidth: data?['borderWidth'] != null
  //         ? double.tryParse(data!['borderWidth']!.toString()) ??
  //             resolveBorderWidthFromString(data['borderWidth'])
  //         : null,
  //     gap: resolveSpaceFromString(
  //         data?['gap'] ?? data?['_avatar']?['ml'].toString()),
  //     borderColor: resolveColorFromString(data?['borderColor']),
  //     borderRadius: data?['borderRadius'] != null
  //         ? double.tryParse(data!['borderRadius'].toString()) ??
  //             resolveRadiusFromString(data['borderRadius'].toString())
  //         : data?['rounded'] != null
  //             ? resolveRadiusFromString(data?['rounded'])
  //             : null,
  //     borderBottomWidth: data?['borderBottomWidth'] != null
  //         ? resolveBorderWidthFromString(data?['borderBottomWidth'].toString())
  //         : null,
  //     borderLeftWidth: data?['borderLeftWidth'] != null
  //         ? resolveBorderWidthFromString(data?['borderLeftWidth'].toString())
  //         : null,
  //     item: GSStyle(
  //       bg: resolveColorFromString(data?['_item']?['backgroundColor']),
  //     ),
  //     shadowOffset: ShadowOffset.fromJson(data: data?['shadowOffset']),
  //     checked: GSStyle(
  //       thumbColor:
  //           resolveColorFromString(data?[':checked']?['props']?['thumbColor']),
  //       color: resolveColorFromString(data?[':checked']?['color']),
  //       bg: resolveColorFromString(data?[':checked']?['bg']),
  //       borderColor: resolveColorFromString(data?[':checked']?['borderColor']),
  //       onHover: GSStyle(
  //         color: resolveColorFromString(data?[':checked']?[':hover']?['color']),
  //       ),
  //     ),
  //     onHover: GSStyle(
  //       color: resolveColorFromString(data?[':hover']?['color']),
  //       textStyle: TextStyle(
  //         decoration: resolveTextDecorationFromString(
  //             data?[':hover']?['textDecorationLine']),
  //       ),
  //       // checked: GSStyle(
  //       //     color:
  //       //         resolveColorFromString(data?[':hover']?[':checked']?['color'])),
  //       bg: resolveColorFromString(data?[':hover']?['bg']),
  //       borderColor: resolveColorFromString(data?[':hover']?['borderColor']),
  //       borderBottomColor:
  //           resolveColorFromString(data?[':hover']?['borderColor']),
  //       trackColorTrue: resolveColorFromString(
  //           data?[':hover']?['props']?['trackColor']?['true']),
  //       trackColorFalse: resolveColorFromString(
  //           data?[':hover']?['props']?['trackColor']?['false']),

  //       iosBackgroundColor: resolveColorFromString(
  //           data?[':hover']?['props']?['ios_backgroundColor']),
  //       onInvalid: GSStyle(
  //         borderColor: resolveColorFromString(
  //             data?[':hover']?['invalid']?['borderColor']),
  //         trackColorTrue: resolveColorFromString(
  //             data?[':hover']?[':invalid']?['props']?['trackColor']?['true']),
  //         trackColorFalse: resolveColorFromString(
  //             data?[':hover']?[':invalid']?['props']?['trackColor']?['false']),
  //       ),
  //       onDisabled: GSStyle(
  //         bg: resolveColorFromString(data?[':hover']?[':disabled']?['bg']),
  //         onInvalid: GSStyle(
  //           borderColor: resolveColorFromString(
  //             data?[':hover']?[':disabled']?[':invalid']?['borderColor'],
  //           ),
  //         ),
  //       ),
  //       checked: GSStyle(
  //         onHover: GSStyle(
  //           color: resolveColorFromString(data?[':checked']?[':hover']
  //                   ?['color'] ??
  //               data?[':hover']?[':checked']?['color']),
  //         ),
  //         bg: resolveColorFromString(
  //             data?[':hover']?[':checked']?['bg'] ?? data?[':hover']?['bg']),
  //         borderColor: resolveColorFromString(data?[':hover']?[':checked']
  //                 ?['borderColor'] ??
  //             data?[':hover']?['borderColor']),
  //         color: resolveColorFromString(data?[':hover']?[':checked']?['color']),
  //         onDisabled: GSStyle(
  //           bg: resolveColorFromString(
  //               data?[':hover']?[':checked']?[':disabled']?['bg']),
  //           borderColor: resolveColorFromString(
  //               data?[':hover']?[':checked']?[':disabled']?['borderColor']),
  //           onInvalid: GSStyle(
  //               borderColor: resolveColorFromString(data?[':hover']?[':checked']
  //                   ?[':disabled']?['invalid']?['borderColor'])),
  //         ),
  //       ),
  //     ),
  //     onFocus: GSStyle(
  //       borderColor: kIsWeb
  //           ? resolveColorFromString(data?['_web']?[':focusVisible']
  //                   ?['outlineColor'] ??
  //               data?[':focus']?['borderColor'])
  //           : resolveColorFromString(data?[':focus']?['borderColor']),
  //       borderWidth: kIsWeb
  //           ? resolveSpaceFromString(
  //               data?['_web']?[':focusVisible']?['outlineWidth'].toString())
  //           : null,
  //       bg: resolveColorFromString(data?[':focus']?['bg']),
  //       borderBottomColor:
  //           resolveColorFromString(data?[':focus']?['borderBottomColor']),
  //       onHover: GSStyle(
  //         borderBottomColor: resolveColorFromString(
  //           data?[':focus']?[':hover']?['borderColor'],
  //         ),
  //       ),
  //     ),
  //     onActive: GSStyle(
  //       color: resolveColorFromString(data?[':active']?['color']),
  //       bg: resolveColorFromString(data?[':active']?['bg']),
  //       borderColor: resolveColorFromString(data?[':active']?['borderColor']),
  //       borderBottomColor:
  //           resolveColorFromString(data?[':active']?['borderBottomColor']),
  //       checked: GSStyle(
  //         bg: resolveColorFromString(data?[':active']?[":checked"]?['bg']),
  //         borderColor: resolveColorFromString(
  //             data?[':active']?[":checked"]?['borderColor']),
  //       ),
  //       onInvalid: GSStyle(
  //         borderColor: resolveColorFromString(
  //             data?[':active']?[":invalid"]?['borderColor']),
  //       ),
  //     ),
  //     onInvalid: GSStyle(
  //       textStyle: TextStyle(
  //         color: resolveColorFromString(data?[':invalid']?['color']),
  //       ),
  //       bg: resolveColorFromString(data?[':invalid']?['bg']),
  //       borderColor: resolveColorFromString(data?['variants']?['variant']
  //               ?['default']?[':invalid']?['borderColor'] ??
  //           data?[':invalid']?['borderColor']),
  //       borderBottomColor:
  //           resolveColorFromString(data?[':invalid']?['borderBottomColor']),
  //       borderRadius: data?[':invalid']?['borderRadius'] != null
  //           ? double.tryParse(data![':invalid']!['borderRadius']!.toString())
  //           : null,
  //       borderWidth: data?[':invalid']?['borderWidth'] != null
  //           ? double.tryParse(data![':invalid']!['borderWidth']!.toString())
  //           : null,
  //       onHover: GSStyle(
  //         borderColor: resolveColorFromString(
  //             data?[':invalid']?[':hover']?['borderColor']),
  //         borderBottomColor: resolveColorFromString(
  //             data?[':invalid']?[':hover']?['borderBottomColor']),
  //       ),
  //       onFocus: GSStyle(
  //         borderColor: resolveColorFromString(
  //             data?[':invalid']?[':focus']?['borderColor']),
  //         borderBottomColor: resolveColorFromString(
  //             data?[':invalid']?[':focus']?['borderBottomColor']),
  //       ),
  //       onDisabled: GSStyle(
  //         borderColor: resolveColorFromString(
  //             data?[':invalid']?[':disabled']?[':hover']?['borderColor']),
  //         borderBottomColor: resolveColorFromString(
  //             data?[':invalid']?[':disabled']?[':hover']?['borderBottomColor']),
  //       ),
  //     ),
  //     onDisabled: GSStyle(
  //       opacity: data?[':disabled']?['opacity'],
  //       textStyle: TextStyle(
  //         color: resolveColorFromString(data?[':disabled']?['color']),
  //       ),
  //       web: GSStyle(
  //         cursors:
  //             resolveCursorFromString(data?[':disabled']?['_web']?['cursor']),
  //         onDisabled: GSStyle(
  //           cursors: resolveCursorFromString(
  //               data?[':disabled']?['_web']?[':disabled']?['cursor']),
  //         ),
  //       ),
  //       trackColorTrue:
  //           resolveColorFromString(data?[':disabled']?['trackColor']?['true']),
  //       trackColorFalse:
  //           resolveColorFromString(data?[':disabled']?['trackColor']?['false']),
  //       iosBackgroundColor:
  //           resolveColorFromString(data?[':disabled']?['ios_backgroundColor']),
  //       borderColor: data?[':disabled']?['borderColor'],
  //       onInvalid: GSStyle(
  //           borderColor: data?[':disabled']?['invalid']?['borderColor']),
  //       onHover: GSStyle(
  //         borderColor: resolveColorFromString(
  //           data?[':disabled']?[':hover']?['borderColor'],
  //         ),
  //         trackColorTrue: resolveColorFromString(
  //             data?[':disabled']?[':hover']?['props']?['trackColor']?['true']),
  //         trackColorFalse: resolveColorFromString(
  //             data?[':disabled']?[':hover']?['props']?['trackColor']['false']),
  //       ),
  //     ),
  //     dark: GSStyle(
  //       iconColor: resolveColorFromString(
  //         data?['_icon']?['_dark']?['color'] ??
  //             data?['_selectedIcon']?['_dark']?['color'] ??
  //             data?['_unselectedIcon']?['_dark']?['color'],
  //       ),
  //       item: GSStyle(
  //         bg: resolveColorFromString(
  //             data?['_dark']?['_item']?['backgroundColor']),
  //       ),
  //       web: GSStyle(
  //         onFocus: GSStyle(
  //           outlineColor: resolveColorFromString(
  //               data?['_web']?[':focus']?['_dark']?['outlineColor']),
  //           outlineWidth:
  //               data?['_web']?[':focus']?['_dark']?['outlineWidth'] != null
  //                   ? double.tryParse(
  //                       data!['_web']![':focus']!['_dark']!['outlineWidth']
  //                           .toString())
  //                   : null,
  //           // outlineStyle: data?['_web']?[':focus']?['_dark']
  //           //     ?['outlineStyle'],
  //           outlineStyle: resolveOutlineStyleFromString(
  //               outlineStyle: data?['outlineStyle']),
  //         ),
  //       ),
  //       color: resolveColorFromString((data?['_dark']?['color'])),
  //       textStyle: TextStyle(
  //         fontWeight: resolveFontWeightFromString(data?['fontWeight']),
  //         color: resolveColorFromString(data?['_text']?['_dark']?['color'] ??
  //             data?['_selectedLabelText']?['_dark']?['color'] ??
  //             data?['_unselectedLabelText']?['_dark']?['color'] ??
  //             data?['_dark']?['color']),
  //       ),
  //       borderColor: resolveColorFromString(data?['_dark']?['borderColor']),
  //       bg: resolveColorFromString(data?['_dark']?['bg'] ??
  //           data?['_dark']?['_item']?['backgroundColor'] ??
  //           data?['_dark']?['backgroundColor']),
  //       onActive: GSStyle(
  //         bg: resolveColorFromString(data?['_dark']?[':active']?['bg']),
  //         borderColor: resolveColorFromString(
  //             data?['_dark']?[':active']?['borderColor']),
  //         borderBottomColor: resolveColorFromString(
  //             data?['_dark']?[':active']?['borderBottomColor']),
  //         checked: GSStyle(
  //           bg: resolveColorFromString(
  //               data?['_dark']?[':active']?[":checked"]?['bg']),
  //           borderColor: resolveColorFromString(
  //               data?['_dark']?[':active']?[":checked"]?['borderColor']),
  //         ),
  //         onInvalid: GSStyle(
  //           borderColor: resolveColorFromString(
  //               data?['_dark']?[':active']?[":invalid"]?['borderColor']),
  //         ),
  //       ),
  //       checked: GSStyle(
  //           color:
  //               resolveColorFromString(data?['_dark']?[':checked']?['color']),
  //           onHover: GSStyle(
  //               color: resolveColorFromString(
  //                   data?['_dark']?[':checked']?[':hover']?['color']))),
  //       onHover: GSStyle(
  //           color: resolveColorFromString(data?['_dark']?[':hover']?['color']),
  //           trackColorTrue: resolveColorFromString(
  //               data?['_dark']?[':hover']?['props']?['trackColor']?['true']),
  //           trackColorFalse: resolveColorFromString(
  //               data?['_dark']?[':hover']?['props']?['trackColor']?['false']),
  //           iosBackgroundColor: resolveColorFromString(
  //               data?['_dark']?[':hover']?['props']?['ios_backgroundColor']),
  //           checked: GSStyle(
  //             color: resolveColorFromString(
  //                 data?['_dark']?[':hover']?[':checked']?['color']),
  //             bg: resolveColorFromString(
  //                 data?['_dark']?[':hover']?[':checked']?['bg']),
  //             borderColor: resolveColorFromString(
  //                 data?['_dark']?[':hover']?[':checked']?['borderColor']),
  //             onDisabled: GSStyle(
  //               bg: resolveColorFromString(data?['_dark']?[':hover']
  //                   ?[':checked']?[':disabled']?['bg']),
  //               borderColor: resolveColorFromString(data?['_dark']?[':hover']
  //                   ?[':checked']?[':disabled']?['borderColor']),
  //               onInvalid: GSStyle(
  //                 borderColor: resolveColorFromString(data?['_dark']?[':hover']
  //                     ?[':checked']?[':disabled']?['borderColor']),
  //               ),
  //             ),
  //           ),
  //           borderColor: resolveColorFromString(
  //               data?['_dark']?[':hover']?['borderColor']),
  //           bg: resolveColorFromString(data?['_dark']?[':hover']?['bg']),
  //           onInvalid: GSStyle(
  //             trackColorTrue: resolveColorFromString(data?['_dark']?[':hover']
  //                 ?[':invalid']?['props']?['trackColor']?['true']),
  //             trackColorFalse: resolveColorFromString(data?['_dark']?[':hover']
  //                 ?[':invalid']?['props']?['trackColor']?['false']),
  //           )),
  //       onFocus: GSStyle(
  //         borderColor: kIsWeb
  //             ? resolveColorFromString(
  //                 data?['_web']?[':focusVisible']?['_dark']?['outlineColor'])
  //             : resolveColorFromString(
  //                 data?['_dark']?[':focus']?['borderColor']),
  //         borderWidth: kIsWeb
  //             ? resolveSpaceFromString(
  //                 data?['_web']?[':focusVisible']?['outlineWidth'].toString())
  //             : null,
  //         onHover: GSStyle(
  //           borderColor: resolveColorFromString(
  //               data?['_dark']?[':focus']?[':hover']?['borderColor']),
  //         ),
  //       ),
  //       onDisabled: GSStyle(
  //         borderColor: resolveColorFromString(
  //             data?['_dark']?[':disabled']?['borderColor']),
  //         trackColorTrue: resolveColorFromString(
  //             data?['_dark']?[':disabled']?['trackColor']?['true']),
  //         trackColorFalse: resolveColorFromString(
  //             data?['_dark']?[':disabled']?['trackColor']?['false']),
  //         iosBackgroundColor: resolveColorFromString(
  //             data?['_dark']?[':disabled']?['ios_backgroundColor']),
  //         opacity: data?['_dark']?[':disabled']?['opacity'],
  //         textStyle: TextStyle(
  //           color:
  //               resolveColorFromString(data?[':disabled']?['_dark']?['color']),
  //         ),
  //         web: GSStyle(
  //           cursors: resolveCursorFromString(
  //               data?['_dark']?[':disabled']?['_web']?['cursor']),
  //           onDisabled: GSStyle(
  //             cursors: resolveCursorFromString(data?['_dark']?[':disabled']
  //                 ?['_web']?[':disabled']?['cursor']),
  //           ),
  //         ),
  //         onHover: GSStyle(
  //           borderColor: resolveColorFromString(
  //               data?['_dark']?[':disabled']?[':hover']?['borderColor']),
  //           trackColorTrue: resolveColorFromString(data?['_dark']?[':disabled']
  //               ?[':hover']?[':props']?['trackColor']?['true']),
  //           trackColorFalse: resolveColorFromString(data?['_dark']?[':disabled']
  //               ?[':hover']?[':props']?['trackColor']?['false']),
  //         ),
  //       ),
  //       onInvalid: GSStyle(
  //         textStyle: TextStyle(
  //           color:
  //               resolveColorFromString(data?[':invalid']?['_dark']?['color']),
  //         ),
  //         bg: resolveColorFromString(data?['_dark']?[':invalid']?['bg']),
  //         borderRadius: data?['_dark']?[':invalid']?['borderRadius'] != null
  //             ? double.tryParse(data![':invalid']!['borderRadius']!.toString())
  //             : null,
  //         borderWidth: data?['_dark']?[':invalid']?['borderWidth'] != null
  //             ? double.tryParse(data![':invalid']!['borderWidth']!.toString())
  //             : null,
  //         borderColor: resolveColorFromString(
  //             data?['_dark']?[':invalid']?['borderColor']),
  //         borderBottomColor: resolveColorFromString(
  //             data?['_dark']?[':invalid']?['borderBottomColor']),
  //         onHover: GSStyle(
  //           borderColor: resolveColorFromString(
  //               data?['_dark']?[':invalid']?[':hover']?['borderColor']),
  //           borderBottomColor: resolveColorFromString(
  //               data?['_dark']?[':invalid']?[':hover']?['borderBottomColor']),
  //         ),
  //         onFocus: GSStyle(
  //           borderColor: resolveColorFromString(
  //               data?['_dark']?[':invalid']?[':focus']?['borderColor']),
  //           borderBottomColor: resolveColorFromString(
  //               data?['_dark']?[':invalid']?[':focus']?['borderBottomColor']),
  //         ),
  //         onDisabled: GSStyle(
  //           borderColor: resolveColorFromString(data?['_dark']?[':invalid']
  //               ?[':disabled']?[':hover']?['borderColor']),
  //           borderBottomColor: resolveColorFromString(data?['_dark']
  //               ?[':invalid']?[':disabled']?[':hover']?['borderBottomColor']),
  //         ),
  //       ),
  //     ),
  //     variants: fromVariant
  //         ? null
  //         : Variants.fromMap(
  //             data: data?['variants'], descendantStyle: descendantStyle),
  //     props: fromVariant
  //         ? null
  //         : GSProps.fromMap(
  //             data: data?['props'] ?? data?['defaultProps'],
  //           ),
  //     alignItems: data?['alignItems'] != null
  //         ? resolveAlignmentFromString(data?['alignItems'])
  //         : null,
  //     justifyContent: data?['justifyContent'] != null
  //         ? resolveAlignmentFromString(data?['justifyContent'])
  //         : null,

  //     ///aaa
  //     trackColorTrue:
  //         data?['props'] != null && data?['props']?['trackColor'] != null
  //             ? resolveColorFromString(data?['props']?['trackColor']?['true'])
  //             : null,
  //     trackColorFalse:
  //         data?['props'] != null && data?['props']?['trackColor'] != null
  //             ? resolveColorFromString(data?['props']?['trackColor']?['false'])
  //             : null,
  //     thumbColor:
  //         data?['props'] != null && data?['props']?['thumbColor'] != null
  //             ? resolveColorFromString(data?['props']?['thumbColor'])
  //             : null,
  //     activeThumbColor:
  //         data?['props'] != null && data?['props']?['activeThumbColor'] != null
  //             ? resolveColorFromString(data?['props']?['activeThumbColor'])
  //             : null,
  //     iosBackgroundColor: data?['props'] != null &&
  //             data?['props']?['ios_backgroundColor'] != null
  //         ? resolveColorFromString(data?['props']?['ios_backgroundColor'])
  //         : null,
  //     scale: data?['transform'] != null
  //         ? (data?['transform'].first as Map).isNotEmpty
  //             ? (data?['transform'].first as Map)['scale']
  //             : null
  //         : null,
  //     iconColor: resolveColorFromString(
  //       data?['_icon']?['color'] ?? data?['_selectedIcon']?['color'],
  //     ),
  //     shadowColor: resolveColorFromString(data?['shadowColor']),
  //     shadowRadius: data?['shadowRadius'] != null
  //         ? double.tryParse(data!['shadowRadius'].toString())
  //         : null,
  //     shadowOpacity: data?['shadowOpacity'] != null
  //         ? double.tryParse(data!['shadowOpacity'].toString())
  //         : null,
  //     elevation: data?['elevation'] != null
  //         ? double.tryParse(data!['elevation'].toString())
  //         : null,
  //     textAlign: resolveTextAlignmentFromString(data?['textAlign']),
  //   );
  // }

  // GSStyle? actionMap(GSActions? gsActions) {
  //   if (gsActions == null) {
  //     return null;
  //   }
  //   switch (gsActions) {
  //     case GSActions.primary:
  //       return variants?.action?.primary;
  //     case GSActions.secondary:
  //       return variants?.action?.secondary;
  //     case GSActions.positive:
  //       return variants?.action?.positive;
  //     case GSActions.negative:
  //       return variants?.action?.negative;
  //     case GSActions.error:
  //       return variants?.action?.error;
  //     case GSActions.warning:
  //       return variants?.action?.warning;
  //     case GSActions.success:
  //       return variants?.action?.success;
  //     case GSActions.info:
  //       return variants?.action?.info;
  //     case GSActions.muted:
  //       return variants?.action?.muted;
  //     case GSActions.attention:
  //       return variants?.action?.attention;
  //     default:
  //       return null;
  //   }
  // }

  // GSStyle? variantMap(GSVariants? gsVariants) {
  //   if (gsVariants == null) {
  //     return null;
  //   }
  //   switch (gsVariants) {
  //     case GSVariants.solid:
  //       return variants?.variant?.solid;
  //     case GSVariants.outline:
  //       return variants?.variant?.outline;
  //     case GSVariants.link:
  //       return variants?.variant?.link;
  //     case GSVariants.underlined:
  //       return variants?.variant?.underlined;
  //     case GSVariants.rounded:
  //       return variants?.variant?.rounded;
  //     case GSVariants.accent:
  //       return variants?.variant?.accent;
  //     case GSVariants.filled:
  //       return variants?.variant?.filled;
  //     case GSVariants.unfilled:
  //       return variants?.variant?.unfilled;
  //     default:
  //       return null;
  //   }
  // }

  // GSStyle? sizeMap(GSSizes? gsSizes) {
  //   if (gsSizes == null) {
  //     return null;
  //   }
  //   switch (gsSizes) {
  //     case GSSizes.$2xs:
  //       return variants?.size?.$2xs;
  //     case GSSizes.$xs:
  //       return variants?.size?.$xs;
  //     case GSSizes.$sm:
  //       return variants?.size?.$sm;
  //     case GSSizes.$md:
  //       return variants?.size?.$md;
  //     case GSSizes.$lg:
  //       return variants?.size?.$lg;
  //     case GSSizes.$xl:
  //       return variants?.size?.$xl;
  //     case GSSizes.$2xl:
  //       return variants?.size?.$2xl;
  //     case GSSizes.$3xl:
  //       return variants?.size?.$3xl;
  //     case GSSizes.$4xl:
  //       return variants?.size?.$4xl;
  //     case GSSizes.$5xl:
  //       return variants?.size?.$5xl;
  //     case GSSizes.$6xl:
  //       return variants?.size?.$6xl;
  //     case GSSizes.$full:
  //       return variants?.size?.$full;
  //     default:
  //       return null;
  //   }
  // }

  // GSStyle? spaceMap(GSSpaces? gsSpaces) {
  //   if (gsSpaces == null) return null;

  //   switch (gsSpaces) {
  //     case GSSpaces.$none:
  //       return variants?.space?.$none;
  //     case GSSpaces.$xs:
  //       return variants?.space?.$xs;
  //     case GSSpaces.$sm:
  //       return variants?.space?.$sm;
  //     case GSSpaces.$md:
  //       return variants?.space?.$md;
  //     case GSSpaces.$lg:
  //       return variants?.space?.$lg;
  //     case GSSpaces.$xl:
  //       return variants?.space?.$xl;
  //     case GSSpaces.$2xl:
  //       return variants?.space?.$2xl;
  //     case GSSpaces.$3xl:
  //       return variants?.space?.$3xl;
  //     case GSSpaces.$4xl:
  //       return variants?.space?.$4xl;
  //     default:
  //       return null;
  //   }
  // }
}

Map getColorMap(BuildContext context) {
  final mapp = {
    'primary500': GSTheme.of(context).primary500,
  };
  return mapp;
}
