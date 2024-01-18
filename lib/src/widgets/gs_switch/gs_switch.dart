import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_switch/gs_switch_style.dart';

enum GSSwitchSizes {
  $sm,
  $md,
  $lg,
}

class GSSwitch extends StatefulWidget {
  final GSStyle? style;
  final GSSwitchSizes? size;
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
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final bool autofocus;

  const GSSwitch({
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
    this.overlayColor,
    this.splashRadius = 0,
    this.focusNode,
    this.onFocusChange,
    this.autofocus = false,
    this.size,
    this.isDisabled = false,
    this.isInvalid = false,
    this.isHovered = false,
  });

  @override
  State<GSSwitch> createState() => _GSSwitchState();
}

class _GSSwitchState extends State<GSSwitch> {
  FocusNode _focusNode = FocusNode();
  bool showFocusBorder = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    }
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && kIsWeb) {
        setState(() {
          showFocusBorder = true;
        });
      } else {
        if (showFocusBorder) {
          setState(() {
            showFocusBorder = false;
          });
        }
      }

      widget.focusNode;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      context: context,
      styles: [switchStyle, switchStyle.sizeMap(widget.size?.toGSSize)],
      inlineStyle: widget.style,
      isFirst: true,
    );

/*
//TODO: get fix done someday!
Mouse REgion not working
  print("web cursor: ${styler.onDisabled?.web?.cursors}");
    print(
        "web disabled cursor: ${styler.onDisabled?.web?.onDisabled?.cursors}");

MouseRegion
cursor: kIsWeb && widget.isDisabled
          ? MouseCursor.defer
          : SystemMouseCursors.forbidden,
*/
    return Theme(
      data: ThemeData(useMaterial3: false),
      child: Transform.scale(
        scale: styler.scale ?? 1,
        child: ConstrainedBox(
          constraints: widget.size?.toGSSize == GSSizes.$lg
              ? const BoxConstraints(maxHeight: 27, maxWidth: 45)
              : const BoxConstraints(maxHeight: 24, maxWidth: 44),
          child: Stack(
            children: [
              Opacity(
                opacity:
                    widget.isDisabled ? styler.onDisabled?.opacity ?? 1 : 1,
                child: Switch(
                  value: widget.value,
                  onChanged: widget.isDisabled ? null : widget.onToggle,
                  activeColor: styler.activeThumbColor,
                  inactiveThumbColor: styler.thumbColor,
                  activeTrackColor: styler.trackColorTrue,
                  inactiveTrackColor: styler.trackColorFalse,
                  activeThumbImage: widget.activeThumbImage,
                  onActiveThumbImageError: widget.onActiveThumbImageError,
                  inactiveThumbImage: widget.inactiveThumbImage,
                  onInactiveThumbImageError: widget.onInactiveThumbImageError,
                  thumbColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected) &&
                          styler.checked?.activeThumbColor != null) {
                        return styler.checked?.activeThumbColor;
                      }
                      return styler.checked?.thumbColor;
                    },
                  ),
                  trackColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (widget.isInvalid &&
                          states.contains(MaterialState.selected) &&
                          states.contains(MaterialState.hovered)) {
                        return styler.onHover?.onInvalid?.trackColorTrue ??
                            styler.trackColorTrue;
                      } else if (widget.isInvalid &&
                          !states.contains(MaterialState.selected) &&
                          states.contains(MaterialState.hovered)) {
                        return styler.onHover?.onInvalid?.trackColorFalse ??
                            styler.trackColorFalse;
                      } else if (states.contains(MaterialState.hovered) &&
                          states.contains(MaterialState.selected)) {
                        return styler.onHover?.trackColorTrue ??
                            styler.trackColorTrue;
                      } else if (states.contains(MaterialState.hovered) &&
                          !states.contains(MaterialState.selected)) {
                        if (!kIsWeb && Platform.isIOS) {
                          return styler.onHover?.iosBackgroundColor ??
                              styler.iosBackgroundColor;
                        }
                        return styler.onHover?.trackColorFalse ??
                            styler.trackColorFalse;
                      } else if (states.contains(MaterialState.focused) &&
                          states.contains(MaterialState.selected)) {
                        return styler.onFocus?.trackColorTrue ??
                            styler.trackColorTrue;
                      } else if (states.contains(MaterialState.focused) &&
                          !states.contains(MaterialState.selected)) {
                        return styler.onFocus?.trackColorFalse ??
                            styler.trackColorFalse;
                      } else if (states.contains(MaterialState.disabled) ||
                          widget.isDisabled &&
                              !states.contains(MaterialState.hovered)) {
                        return styler.onDisabled?.trackColorFalse ??
                            styler.trackColorFalse;
                      } else if (states.contains(MaterialState.disabled) ||
                          widget.isDisabled &&
                              states.contains(MaterialState.hovered)) {
                        if (!kIsWeb && Platform.isIOS) {
                          return styler.onDisabled?.iosBackgroundColor ??
                              styler.iosBackgroundColor;
                        } else {
                          return styler.onDisabled?.trackColorTrue ??
                              styler.trackColorTrue;
                        }
                      } else if (states.contains(MaterialState.selected)) {
                        return styler.trackColorTrue;
                      }

                      if (!kIsWeb && Platform.isIOS) {
                        return styler.iosBackgroundColor;
                      } else {
                        return styler.trackColorFalse;
                      }
                    },
                  ),
                  trackOutlineColor: widget.trackOutlineColor,
                  trackOutlineWidth: widget.trackOutlineWidth,
                  thumbIcon: widget.thumbIcon,
                  materialTapTargetSize: widget.materialTapTargetSize,
                  dragStartBehavior: widget.dragStartBehavior,
                  mouseCursor: widget.mouseCursor,
                  overlayColor: widget.overlayColor,
                  splashRadius: widget.splashRadius,
                  focusNode: _focusNode,
                  onFocusChange: widget.onFocusChange,
                  autofocus: widget.autofocus,
                ),
              ),
              if (widget.isInvalid)
                Positioned.fill(
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            styler.onInvalid?.borderRadius ?? 0),
                        border: Border.all(
                          color: styler.onInvalid?.borderColor ?? Colors.black,
                          width: styler.onInvalid?.borderWidth ?? 1,
                        ),
                      ),
                    ),
                  ),
                ),
              if (showFocusBorder)
                Positioned.fill(
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: styler.dark?.web?.onFocus?.outlineColor ??
                            Colors.transparent,
                        width: styler.web?.onFocus?.outlineWidth ?? 1,
                      )),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
