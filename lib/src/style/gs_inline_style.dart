import 'package:gluestack_ui/src/style/base_style.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

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

  static GSStyle fromGSStyle(GSConfigStyle styler, BuildContext context) {
    Color? parseColor(String? colorString) {
      return colorString?.getColor(context);
    }

    return GSStyle(
      borderWidth: styler.borderWidth,
      borderColor: parseColor(styler.borderColor),
      borderRadius: styler.borderRadius,
      padding: styler.padding,
      margin: styler.margin,
      opacity: styler.opacity,
      color: parseColor(styler.color),
      bg: parseColor(styler.bg),
      gap: styler.gap,
      borderBottomColor: parseColor(styler.borderBottomColor),
      height: styler.height,
      width: styler.width,
      borderBottomWidth: styler.borderBottomWidth,
      borderLeftWidth: styler.borderLeftWidth,
      textStyle: styler.textStyle,
      flexDirection: styler.flexDirection,
      alignItems: styler.alignItems,
      justifyContent: styler.justifyContent,
      maxWidth: styler.maxWidth,
      alignment: styler.alignment,
      top: styler.top,
      bottom: styler.bottom,
      right: styler.right,
      left: styler.left,
      progressValueColor: parseColor(styler.progressValueColor),
      textTransform: styler.textTransform,
      iconSize: styler.iconSize,
      trackColorTrue: parseColor(styler.trackColorTrue),
      trackColorFalse: parseColor(styler.trackColorFalse),
      thumbColor: parseColor(styler.thumbColor),
      activeThumbColor: parseColor(styler.activeThumbColor),
      iosBackgroundColor: parseColor(styler.iosBackgroundColor),
      scale: styler.scale,
      cursors: styler.cursors,
      placement: styler.placement,
      isVisible: styler.isVisible,
      direction: styler.direction,
      outlineWidth: styler.outlineWidth,
      outlineColor: parseColor(styler.outlineColor),
      outlineStyle: styler.outlineStyle,
      indent: styler.indent,
      endIndent: styler.endIndent,
      iconColor: parseColor(styler.iconColor),
      shadowColor: parseColor(styler.shadowColor),
      shadowRadius: styler.shadowRadius,
      shadowOpacity: styler.shadowOpacity,
      elevation: styler.elevation,
      shadowOffset: styler.shadowOffset,
      textAlign: styler.textAlign,
      dark: styler.dark != null ? fromGSStyle(styler.dark!, context) : null,
      android:
          styler.android != null ? fromGSStyle(styler.android!, context) : null,
      ios: styler.ios != null ? fromGSStyle(styler.ios!, context) : null,
      web: styler.web != null ? fromGSStyle(styler.web!, context) : null,
      sm: styler.sm != null ? fromGSStyle(styler.sm!, context) : null,
      md: styler.md != null ? fromGSStyle(styler.md!, context) : null,
      lg: styler.lg != null ? fromGSStyle(styler.lg!, context) : null,
      xs: styler.xs != null ? fromGSStyle(styler.xs!, context) : null,
      icon: styler.icon != null ? fromGSStyle(styler.icon!, context) : null,
      input: styler.input != null ? fromGSStyle(styler.input!, context) : null,
      badge: styler.badge != null ? fromGSStyle(styler.badge!, context) : null,
      item: styler.item != null ? fromGSStyle(styler.item!, context) : null,
      checked:
          styler.checked != null ? fromGSStyle(styler.checked!, context) : null,
      onActive: styler.onActive != null
          ? fromGSStyle(styler.onActive!, context)
          : null,
      onFocus:
          styler.onFocus != null ? fromGSStyle(styler.onFocus!, context) : null,
      onHover:
          styler.onHover != null ? fromGSStyle(styler.onHover!, context) : null,
      onInvalid: styler.onInvalid != null
          ? fromGSStyle(styler.onInvalid!, context)
          : null,
      onDisabled: styler.onDisabled != null
          ? fromGSStyle(styler.onDisabled!, context)
          : null,
    );
  }
}
