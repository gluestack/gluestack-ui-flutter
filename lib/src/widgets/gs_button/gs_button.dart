import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_group_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder_provider.dart';

enum GSButtonActions {
  primary,
  secondary,
  positive,
  negative,
}

enum GSButtonVariants {
  solid,
  outline,
  link,
}

enum GSButtonSizes {
  $xs,
  $sm,
  $md,
  $lg,
}

extension GSButtonExtensions on Object {
  GSActions? get toGSAction {
    if (this is GSButtonActions) {
      return mapToGSActions(this as GSButtonActions);
    }
    return null;
  }

  GSVariants? get toGSVariant {
    if (this is GSButtonVariants) {
      return mapToGSVariants(this as GSButtonVariants);
    }
    return null;
  }

  GSSizes? get toGSSize {
    if (this is GSButtonSizes) {
      return mapToGSSizes(this as GSButtonSizes);
    }
    return null;
  }
}

class GSButton extends StatelessWidget {
  final GSButtonActions? action;
  final GSButtonVariants? variant;
  final GSButtonSizes? size;
  final String? semanticsLabel;
  final bool? isDisabled;
  final bool? isFocusVisible;
  final Widget child;
  final GSStyle? style;
  final Function? onHover;
  final Function(bool)? onFocusChange;
  final FocusNode? focusNode;
  final bool autoFocus;
  final Clip clipBehavior;

  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
//Gesture Detector Stuff
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCancelCallback? onTapCancel;
  final GestureTapCallback? onSecondaryTap;
  final GestureTapDownCallback? onSecondaryTapDown;
  final GestureTapUpCallback? onSecondaryTapUp;
  final GestureTapCancelCallback? onSecondaryTapCancel;
  final GestureTapDownCallback? onTertiaryTapDown;
  final GestureTapUpCallback? onTertiaryTapUp;
  final GestureTapCancelCallback? onTertiaryTapCancel;
  final GestureDoubleTapCallback? onDoubleTap;
  final GestureLongPressDownCallback? onLongPressDown;
  final GestureLongPressCancelCallback? onLongPressCancel;
  final GestureLongPressStartCallback? onLongPressStart;
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;
  final GestureLongPressUpCallback? onLongPressUp;
  final GestureLongPressEndCallback? onLongPressEnd;
  final GestureLongPressDownCallback? onSecondaryLongPressDown;
  final GestureLongPressCancelCallback? onSecondaryLongPressCancel;
  final GestureLongPressCallback? onSecondaryLongPress;
  final GestureLongPressStartCallback? onSecondaryLongPressStart;
  final GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate;
  final GestureLongPressUpCallback? onSecondaryLongPressUp;
  final GestureLongPressEndCallback? onSecondaryLongPressEnd;
  final GestureLongPressDownCallback? onTertiaryLongPressDown;
  final GestureLongPressCancelCallback? onTertiaryLongPressCancel;
  final GestureLongPressCallback? onTertiaryLongPress;
  final GestureLongPressStartCallback? onTertiaryLongPressStart;
  final GestureLongPressMoveUpdateCallback? onTertiaryLongPressMoveUpdate;
  final GestureLongPressUpCallback? onTertiaryLongPressUp;
  final GestureLongPressEndCallback? onTertiaryLongPressEnd;
  final GestureDragDownCallback? onVerticalDragDown;
  final GestureDragStartCallback? onVerticalDragStart;
  final GestureDragUpdateCallback? onVerticalDragUpdate;
  final GestureDragEndCallback? onVerticalDragEnd;
  final GestureDragCancelCallback? onVerticalDragCancel;
  final GestureDragDownCallback? onHorizontalDragDown;
  final GestureDragStartCallback? onHorizontalDragStart;
  final GestureDragUpdateCallback? onHorizontalDragUpdate;
  final GestureDragEndCallback? onHorizontalDragEnd;
  final GestureDragCancelCallback? onHorizontalDragCancel;
  final GestureForcePressStartCallback? onForcePressStart;
  final GestureForcePressPeakCallback? onForcePressPeak;
  final GestureForcePressUpdateCallback? onForcePressUpdate;
  final GestureForcePressEndCallback? onForcePressEnd;
  final GestureDragDownCallback? onPanDown;
  final GestureDragStartCallback? onPanStart;
  final GestureDragUpdateCallback? onPanUpdate;
  final GestureDragEndCallback? onPanEnd;
  final GestureDragCancelCallback? onPanCancel;
  final GestureScaleStartCallback? onScaleStart;
  final GestureScaleUpdateCallback? onScaleUpdate;
  final GestureScaleEndCallback? onScaleEnd;
  final HitTestBehavior? behavior;
  final bool excludeFromSemantics;
  final DragStartBehavior dragStartBehavior;
  final bool trackpadScrollCausesScale;
  final Offset trackpadScrollToScaleFactor;
  final Set<PointerDeviceKind>? supportedDevices;

  const GSButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.action = GSButtonActions.primary,
    this.variant = GSButtonVariants.solid,
    this.size = GSButtonSizes.$md,
    this.isDisabled,
    this.semanticsLabel,
    this.isFocusVisible = false,
    this.style,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autoFocus = false,
    this.clipBehavior = Clip.none,
//Gesture Detector Stuff
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTap,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onTertiaryTapDown,
    this.onTertiaryTapUp,
    this.onTertiaryTapCancel,
    this.onDoubleTap,
    this.onLongPressDown,
    this.onLongPressCancel,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onSecondaryLongPressDown,
    this.onSecondaryLongPressCancel,
    this.onSecondaryLongPress,
    this.onSecondaryLongPressStart,
    this.onSecondaryLongPressMoveUpdate,
    this.onSecondaryLongPressUp,
    this.onSecondaryLongPressEnd,
    this.onTertiaryLongPressDown,
    this.onTertiaryLongPressCancel,
    this.onTertiaryLongPress,
    this.onTertiaryLongPressStart,
    this.onTertiaryLongPressMoveUpdate,
    this.onTertiaryLongPressUp,
    this.onTertiaryLongPressEnd,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
    this.behavior,
    this.excludeFromSemantics = false,
    this.dragStartBehavior = DragStartBehavior.start,
    this.trackpadScrollCausesScale = false,
    this.trackpadScrollToScaleFactor =
        const Offset(0, -1 / kDefaultMouseScrollToScaleFactor),
    this.supportedDevices,
  });

  @override
  Widget build(BuildContext context) {
    final value = GSButtonGroupProvider.of(context);
    final buttonAction = action?.toGSAction ?? buttonStyle.props?.action;
    final buttonVariant = variant?.toGSVariant ?? buttonStyle.props?.variant;
    final buttonSize = size?.toGSSize ?? value?.size ?? buttonStyle.props?.size;
    final disabled = isDisabled ?? value?.isDisabled ?? false;
    final focused = isFocusVisible ?? false;
    final isAttached = value?.isAttached ?? false;

    return GSStyleBuilder(
      isDisabled: disabled,
      isFocused: focused,
      child: Builder(builder: (context) {
        GSStyle styler = resolveStyles(
            context: context,
            styles: [
              buttonStyle,
              buttonStyle.actionMap(buttonAction),
              buttonStyle.variantMap(buttonVariant),
              buttonStyle.sizeMap(buttonSize),
              buttonStyle
                  .compoundVariants?[action.toString() + variant.toString()]
            ],
            inlineStyle: style,
            isFirst: true);

        if (GSStyleBuilderProvider.of(context)?.isHovered ?? false) {
          if (onHover != null) {
            onHover!();
          }
        }

        return GSAncestor(
          decedentStyles: styler.descendantStyles,
          child: GSButtonProvider(
            action: buttonAction!,
            variant: buttonVariant!,
            size: buttonSize!,
            child: Opacity(
              opacity: disabled ? styler.opacity ?? 0.5 : 1,
              child: Semantics(
                label: semanticsLabel ?? 'Button',
                button: true,
                child: SizedBox(
                  height: styler.height,
                  child: FocusableActionDetector(
                    onFocusChange: onFocusChange,
                    focusNode: focusNode,
                    autofocus: autoFocus,
                    child: GestureDetector(
                      onTap: disabled ? null : onPressed,
                      onLongPress: disabled ? null : onLongPress,
                      onTapDown: disabled ? null : onTapDown,
                      onTapUp: disabled ? null : onTapUp,
                      onTapCancel: disabled ? null : onTapCancel,
                      onSecondaryTap: disabled ? null : onSecondaryTap,
                      onSecondaryTapDown: disabled ? null : onSecondaryTapDown,
                      onSecondaryTapUp: disabled ? null : onSecondaryTapUp,
                      onSecondaryTapCancel:
                          disabled ? null : onSecondaryTapCancel,
                      onTertiaryTapDown: disabled ? null : onTertiaryTapDown,
                      onTertiaryTapUp: disabled ? null : onTertiaryTapUp,
                      onTertiaryTapCancel:
                          disabled ? null : onTertiaryTapCancel,
                      onDoubleTap: disabled ? null : onDoubleTap,
                      onLongPressDown: disabled ? null : onLongPressDown,
                      onLongPressCancel: disabled ? null : onLongPressCancel,
                      onLongPressStart: disabled ? null : onLongPressStart,
                      onLongPressMoveUpdate:
                          disabled ? null : onLongPressMoveUpdate,
                      onLongPressUp: disabled ? null : onLongPressUp,
                      onLongPressEnd: disabled ? null : onLongPressEnd,
                      onSecondaryLongPressDown:
                          disabled ? null : onSecondaryLongPressDown,
                      onSecondaryLongPressCancel:
                          disabled ? null : onSecondaryLongPressCancel,
                      onSecondaryLongPress:
                          disabled ? null : onSecondaryLongPress,
                      onSecondaryLongPressStart:
                          disabled ? null : onSecondaryLongPressStart,
                      onSecondaryLongPressMoveUpdate:
                          disabled ? null : onSecondaryLongPressMoveUpdate,
                      onSecondaryLongPressUp:
                          disabled ? null : onSecondaryLongPressUp,
                      onSecondaryLongPressEnd:
                          disabled ? null : onSecondaryLongPressEnd,
                      onTertiaryLongPressDown:
                          disabled ? null : onTertiaryLongPressDown,
                      onTertiaryLongPressCancel:
                          disabled ? null : onTertiaryLongPressCancel,
                      onTertiaryLongPress:
                          disabled ? null : onTertiaryLongPress,
                      onTertiaryLongPressStart:
                          disabled ? null : onTertiaryLongPressStart,
                      onTertiaryLongPressMoveUpdate:
                          disabled ? null : onTertiaryLongPressMoveUpdate,
                      onTertiaryLongPressUp:
                          disabled ? null : onTertiaryLongPressUp,
                      onTertiaryLongPressEnd:
                          disabled ? null : onTertiaryLongPressEnd,
                      onVerticalDragDown: disabled ? null : onVerticalDragDown,
                      onVerticalDragStart:
                          disabled ? null : onVerticalDragStart,
                      onVerticalDragUpdate:
                          disabled ? null : onVerticalDragUpdate,
                      onVerticalDragEnd: disabled ? null : onVerticalDragEnd,
                      onVerticalDragCancel:
                          disabled ? null : onVerticalDragCancel,
                      onHorizontalDragDown:
                          disabled ? null : onHorizontalDragDown,
                      onHorizontalDragStart:
                          disabled ? null : onHorizontalDragStart,
                      onHorizontalDragUpdate:
                          disabled ? null : onHorizontalDragUpdate,
                      onHorizontalDragEnd:
                          disabled ? null : onHorizontalDragEnd,
                      onHorizontalDragCancel:
                          disabled ? null : onHorizontalDragCancel,
                      onForcePressStart: disabled ? null : onForcePressStart,
                      onForcePressPeak: disabled ? null : onForcePressPeak,
                      onForcePressUpdate: disabled ? null : onForcePressUpdate,
                      onForcePressEnd: disabled ? null : onForcePressEnd,
                      onPanDown: disabled ? null : onPanDown,
                      onPanStart: disabled ? null : onPanStart,
                      onPanUpdate: disabled ? null : onPanUpdate,
                      onPanEnd: disabled ? null : onPanEnd,
                      onPanCancel: disabled ? null : onPanCancel,
                      onScaleStart: disabled ? null : onScaleStart,
                      onScaleUpdate: disabled ? null : onScaleUpdate,
                      onScaleEnd: disabled ? null : onScaleEnd,
                      behavior: disabled ? null : behavior,
                      excludeFromSemantics: excludeFromSemantics,
                      dragStartBehavior: dragStartBehavior,
                      trackpadScrollCausesScale: trackpadScrollCausesScale,
                      trackpadScrollToScaleFactor: trackpadScrollToScaleFactor,
                      supportedDevices: supportedDevices,
                      child: Container(
                        clipBehavior: clipBehavior,
                        // statesController: statesController,
                        padding: styler.padding,
                        decoration: BoxDecoration(
                          color: buttonVariant == GSVariants.link
                              ? const Color.fromARGB(0, 0, 0, 0)
                              : GSStyleBuilderProvider.of(context)?.isFocused ??
                                      false
                                  ? HSLColor.fromColor(
                                          styler.bg ?? $GSColors.red400)
                                      .withLightness(0.50)
                                      .toColor()
                                  : styler.bg,
                          borderRadius:
                              BorderRadius.circular(styler.borderRadius ?? 0.0),
                          border: Border.fromBorderSide(_resolveBorderSide(
                              buttonVariant, styler, isAttached)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            child,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  BorderSide _resolveBorderSide(
      GSVariants variant, GSStyle styler, bool isAttached) {
    if (isAttached) {
      return BorderSide.none;
    }
    if (variant == GSVariants.link) {
      return BorderSide.none;
    }
    if (isFocusVisible!) {
      return BorderSide(color: $GSColors.primary500, width: 2.0);
    }
    return styler.borderWidth != null || styler.outlineWidth != null
        ? BorderSide(
            color: styler.borderColor ??
                styler.outlineColor ??
                const Color.fromARGB(0, 0, 0, 0),
            width: styler.borderWidth ?? styler.outlineWidth ?? 0.0)
        : BorderSide.none;
  }
}
