import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_fab/gs_fab_style.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

enum GSFABSizes {
  $sm,
  $md,
  $lg,
}

enum GSFABPlacements {
  topLeft,
  topCenter,
  topRight,
  bottomLeft,
  bottomCenter,
  bottomRight
}

class GSFab extends StatelessWidget {
  final GSFABSizes? size;
  final GSFABPlacements? placement;
  final Widget? label;
  final GSStyle? style;
  final Widget? icon;
  final bool isDisabled;
  final bool isPressed;
  final bool isHovered;
  final void Function()? onPressed;

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
  const GSFab(
      {super.key,
      required this.onPressed,
      this.size,
      this.label,
      this.icon,
      this.placement,
      this.style,
      this.isHovered = false,
      this.isPressed = false,
      this.isDisabled = false,
      
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
    this.supportedDevices, this.onLongPress,});

  @override
  Widget build(BuildContext context) {
    final fabSize = size?.toGSSize ?? fabStyle.props!.size!;
    final fabPlacement = placement?.toGSPlacement ?? fabStyle.props?.placement!;
    final styler = resolveStyles(
      context: context,
      styles: [
        GSFabStyle.placementVariants[fabPlacement],
        fabStyle.sizeMap(fabSize)
      ],
      inlineStyle: style,
      isFirst: true,
    );

    final bool isCentered = fabPlacement == GSPlacements.bottomCenter ||
        fabPlacement == GSPlacements.topCenter;

    final fabStyler = isPressed
        ? styler.merge(styler.onActive)
        : !isHovered
            ? styler
            : styler.merge(styler.onHover);

    final widget = GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: Opacity(
        opacity: isDisabled ? styler.onDisabled?.opacity ?? 0.0 : 1,
        child: GSButton(
            isDisabled: isDisabled,
            freeSize: true,
            style: fabStyler,
            onPressed: onPressed ?? () {},
            child: resolveFlexWidget(
              flexDirection: styler.flexDirection,
              mainAxisAlignment: styler.justifyContent,
              crossAxisAlignment: styler.alignItems,
              children: [if (icon != null) icon!, if (label != null) label!],
            ),
              onLongPress: isDisabled ? null : onLongPress,
                      onTapDown: isDisabled ? null : onTapDown,
                      onTapUp: isDisabled ? null : onTapUp,
                      onTapCancel: isDisabled ? null : onTapCancel,
                      onSecondaryTap: isDisabled ? null : onSecondaryTap,
                      onSecondaryTapDown: isDisabled ? null : onSecondaryTapDown,
                      onSecondaryTapUp: isDisabled ? null : onSecondaryTapUp,
                      onSecondaryTapCancel:
                          isDisabled ? null : onSecondaryTapCancel,
                      onTertiaryTapDown: isDisabled ? null : onTertiaryTapDown,
                      onTertiaryTapUp: isDisabled ? null : onTertiaryTapUp,
                      onTertiaryTapCancel:
                          isDisabled ? null : onTertiaryTapCancel,
                      onDoubleTap: isDisabled ? null : onDoubleTap,
                      onLongPressDown: isDisabled ? null : onLongPressDown,
                      onLongPressCancel: isDisabled ? null : onLongPressCancel,
                      onLongPressStart: isDisabled ? null : onLongPressStart,
                      onLongPressMoveUpdate:
                          isDisabled ? null : onLongPressMoveUpdate,
                      onLongPressUp: isDisabled ? null : onLongPressUp,
                      onLongPressEnd: isDisabled ? null : onLongPressEnd,
                      onSecondaryLongPressDown:
                          isDisabled ? null : onSecondaryLongPressDown,
                      onSecondaryLongPressCancel:
                          isDisabled ? null : onSecondaryLongPressCancel,
                      onSecondaryLongPress:
                          isDisabled ? null : onSecondaryLongPress,
                      onSecondaryLongPressStart:
                          isDisabled ? null : onSecondaryLongPressStart,
                      onSecondaryLongPressMoveUpdate:
                          isDisabled ? null : onSecondaryLongPressMoveUpdate,
                      onSecondaryLongPressUp:
                          isDisabled ? null : onSecondaryLongPressUp,
                      onSecondaryLongPressEnd:
                          isDisabled ? null : onSecondaryLongPressEnd,
                      onTertiaryLongPressDown:
                          isDisabled ? null : onTertiaryLongPressDown,
                      onTertiaryLongPressCancel:
                          isDisabled ? null : onTertiaryLongPressCancel,
                      onTertiaryLongPress:
                          isDisabled ? null : onTertiaryLongPress,
                      onTertiaryLongPressStart:
                          isDisabled ? null : onTertiaryLongPressStart,
                      onTertiaryLongPressMoveUpdate:
                          isDisabled ? null : onTertiaryLongPressMoveUpdate,
                      onTertiaryLongPressUp:
                          isDisabled ? null : onTertiaryLongPressUp,
                      onTertiaryLongPressEnd:
                          isDisabled ? null : onTertiaryLongPressEnd,
                      onVerticalDragDown: isDisabled ? null : onVerticalDragDown,
                      onVerticalDragStart:
                          isDisabled ? null : onVerticalDragStart,
                      onVerticalDragUpdate:
                          isDisabled ? null : onVerticalDragUpdate,
                      onVerticalDragEnd: isDisabled ? null : onVerticalDragEnd,
                      onVerticalDragCancel:
                          isDisabled ? null : onVerticalDragCancel,
                      onHorizontalDragDown:
                          isDisabled ? null : onHorizontalDragDown,
                      onHorizontalDragStart:
                          isDisabled ? null : onHorizontalDragStart,
                      onHorizontalDragUpdate:
                          isDisabled ? null : onHorizontalDragUpdate,
                      onHorizontalDragEnd:
                          isDisabled ? null : onHorizontalDragEnd,
                      onHorizontalDragCancel:
                          isDisabled ? null : onHorizontalDragCancel,
                      onForcePressStart: isDisabled ? null : onForcePressStart,
                      onForcePressPeak: isDisabled ? null : onForcePressPeak,
                      onForcePressUpdate: isDisabled ? null : onForcePressUpdate,
                      onForcePressEnd: isDisabled ? null : onForcePressEnd,
                      onPanDown: isDisabled ? null : onPanDown,
                      onPanStart: isDisabled ? null : onPanStart,
                      onPanUpdate: isDisabled ? null : onPanUpdate,
                      onPanEnd: isDisabled ? null : onPanEnd,
                      onPanCancel: isDisabled ? null : onPanCancel,
                      onScaleStart: isDisabled ? null : onScaleStart,
                      onScaleUpdate: isDisabled ? null : onScaleUpdate,
                      onScaleEnd: isDisabled ? null : onScaleEnd,
                      behavior: isDisabled ? null : behavior,
                      excludeFromSemantics: excludeFromSemantics,
                      dragStartBehavior: dragStartBehavior,
                      trackpadScrollCausesScale: trackpadScrollCausesScale,
                      trackpadScrollToScaleFactor: trackpadScrollToScaleFactor,
                      supportedDevices: supportedDevices,
            ),
      ),
    );

    return Positioned.fill(
        bottom: styler.bottom,
        top: styler.top,
        left: isCentered ? styler.left ?? 0.0 : styler.left,
        right: isCentered ? styler.right ?? 0.0 : styler.right,
        child: isCentered
            ? Align(
                alignment: Alignment.center,
                child: widget,
              )
            : widget);
  }
}
