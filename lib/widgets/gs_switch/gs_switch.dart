import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_switch/gs_switch_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text_area/gs_text_area_style.dart';

class GSSwitch extends StatelessWidget {
  final GSStyle? style;
  final GSSizes? size;
  final bool isDisabled;
  final bool isInvalid;
  final bool isHovered;

  final bool value;
  final ValueChanged<bool>? onToggle;
  final ImageProvider? activeThumbImage;
  final ImageErrorListener? onActiveThumbImageError;
  final ImageProvider? inactiveThumbImage;
  final ImageErrorListener? onInactiveThumbImageError;
  final MaterialStateProperty<Color?>? thumbColor;
  final MaterialStateProperty<Color?>? trackColor;
  final MaterialStateProperty<Color?>? trackOutlineColor;
  final MaterialStateProperty<double?>? trackOutlineWidth;
  final MaterialStateProperty<Icon?>? thumbIcon;
  final MaterialTapTargetSize? materialTapTargetSize;
  final DragStartBehavior dragStartBehavior;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final bool autofocus;

  GSSwitch({
    super.key,
    this.style,
    required this.value,
    required this.onToggle,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
    this.thumbColor,
    this.trackColor,
    this.trackOutlineColor,
    this.trackOutlineWidth,
    this.thumbIcon,
    this.materialTapTargetSize,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius = 0,
    this.focusNode,
    this.onFocusChange,
    this.autofocus = false,
    this.size,
    this.isDisabled = false,
    this.isInvalid = false,
    this.isHovered = false,
  })  : assert(
            size == null ||
                size == GSSizes.$sm ||
                size == GSSizes.$lg ||
                size == GSSizes.$md,
            "Only sm, md and lg sizes allowed here...!"),
        assert(activeThumbImage != null || onActiveThumbImageError == null),
        assert(inactiveThumbImage != null || onInactiveThumbImageError == null);

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      context,
      variantStyle: switchStyle,
      size: GSSwitchStyle.size[size],
      inlineStyle: style,
    )!;

    return Opacity(
      opacity: isDisabled ? styler.onDisabled?.opacity ?? 1 : 1,
      child: Transform.scale(
        scale: styler.scale ?? 1,
        child: Switch(
          value: value,
          onChanged: isDisabled ? null : onToggle,
          activeColor: styler.activeThumbColor,
          inactiveThumbColor: styler.thumbColor,
          activeTrackColor: styler.trackColorTrue,
          inactiveTrackColor: styler.trackColorFalse,
          activeThumbImage: activeThumbImage,
          onActiveThumbImageError: onActiveThumbImageError,
          inactiveThumbImage: inactiveThumbImage,
          onInactiveThumbImageError: onInactiveThumbImageError,
          thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return styler.checked?.activeThumbColor;
              }
              return styler.checked?.thumbColor;
            },
          ),
          trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (isInvalid &&
                  states.contains(MaterialState.selected) &&
                  states.contains(MaterialState.hovered)) {
                return styler.onHover?.onInvaild?.trackColorTrue ??
                    styler.trackColorTrue;
              } else if (isInvalid &&
                  !states.contains(MaterialState.selected) &&
                  states.contains(MaterialState.hovered)) {
                return styler.onHover?.onInvaild?.trackColorFalse ??
                    styler.trackColorFalse;
              } else if (states.contains(MaterialState.hovered) &&
                  states.contains(MaterialState.selected)) {
                return styler.onHover?.trackColorTrue ?? styler.trackColorTrue;
              } else if (states.contains(MaterialState.hovered) &&
                  !states.contains(MaterialState.selected)) {
                if (Platform.isIOS) {
                  return styler.onHover?.iosBackgroundColor ??
                      styler.iosBackgroundColor;
                }
                return styler.onHover?.trackColorFalse ??
                    styler.trackColorFalse;
              } else if (states.contains(MaterialState.focused) &&
                  states.contains(MaterialState.selected)) {
                return styler.onFocus?.trackColorTrue ?? styler.trackColorTrue;
              } else if (states.contains(MaterialState.focused) &&
                  !states.contains(MaterialState.selected)) {
                return styler.onFocus?.trackColorFalse ??
                    styler.trackColorFalse;
              } else if (states.contains(MaterialState.disabled) ||
                  isDisabled && !states.contains(MaterialState.hovered)) {
                return styler.onDisabled?.trackColorFalse ??
                    styler.trackColorFalse;
              } else if (states.contains(MaterialState.disabled) ||
                  isDisabled && states.contains(MaterialState.hovered)) {
                if (Platform.isIOS) {
                  return styler.onDisabled?.iosBackgroundColor ??
                      styler.iosBackgroundColor;
                } else {
                  return styler.onDisabled?.trackColorTrue ??
                      styler.trackColorTrue;
                }
              } else if (states.contains(MaterialState.selected)) {
                return styler.trackColorTrue;
              }

              if (Platform.isIOS) {
                return styler.iosBackgroundColor;
              } else {
                return styler.trackColorFalse;
              }
            },
          ),
          trackOutlineColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (isInvalid) {
                return Colors.red;
              }
              return styler.borderColor;
            },
          ),
          trackOutlineWidth: MaterialStateProperty.resolveWith<double?>(
            (Set<MaterialState> states) {
              if (isInvalid) {
                return styler.onInvaild?.borderWidth ?? 1;
              }
              return styler.borderWidth;
            },
          ),
          thumbIcon: thumbIcon,
          materialTapTargetSize: materialTapTargetSize,
          dragStartBehavior: dragStartBehavior,
          mouseCursor: mouseCursor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          overlayColor: overlayColor,
          splashRadius: splashRadius,
          focusNode: focusNode,
          onFocusChange: onFocusChange,
          autofocus: autofocus,
        ),
      ),
    );
  }
}
