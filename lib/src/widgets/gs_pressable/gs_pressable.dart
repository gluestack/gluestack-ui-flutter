import 'package:flutter/gestures.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_pressable/gs_pressable_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder_provider.dart';

/// The GSPressable class represents a pressable widget that can respond to various press-related gestures.
/// It allows for easy customization of various press-related interactions and styles.
class GSPressable extends StatelessWidget {
  /// The style to be applied to the GSPressable.
  final GSStyle? style;

  /// The child widget to be wrapped by the GSPressable.
  final Widget child;

  /// Additional distance outside of the element in which a press can be detected, same as react native's Pressable's [hitSlop] prop.
  final double? hitSlop;

  final String? semanticsLabel;

  /// Mouse cursor to use when hovering over this widget.
  final MouseCursor? mouseCursor;

  final BorderRadius? borderRadius;

  /// Callback when the focus state changes.
  final ValueChanged<bool>? onFocusChange;

  /// Whether this widget should be autofocused.
  final bool autofocus;

  /// The focus node to use for focusing this widget.
  final FocusNode? focusNode;

  /// Callback when the highlight state changes.
  final ValueChanged<bool>? onShowFocusHighlight;

  /// Whether this widget can request focus.
  final bool canRequestFocus;

  /// Callback when the user presses this widget.
  final GestureTapCallback? onPress;

  /// Executes this function when the user hovers over this widget.
  final Function? onHover;

  /// Callback when the user long presses this widget.
  final GestureLongPressCallback? onLongPress;
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

  /// Creates a new instance of GSPressable.
  const GSPressable({
    super.key,
    this.focusNode,
    this.semanticsLabel,
    this.canRequestFocus = true,
    this.onFocusChange,
    this.onHover,
    this.autofocus = false,
    this.style,
    required this.child,
    this.hitSlop,
    this.mouseCursor,
    this.borderRadius,
    this.onShowFocusHighlight,
    this.onPress,
    this.onLongPress,

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

  /// Builds the GSPressable widget.
  @override
  Widget build(BuildContext context) {
    return GSStyleBuilder(
      child: Builder(builder: (context) {
        // Resolve styles using the provided context and optional style variants.
        GSStyle styler = resolveStyles(
          context: context,
          styles: [pressableStyle],
          inlineStyle: style,
          isFirst: true,
        );
        if (GSStyleBuilderProvider.of(context)?.isHovered ?? false) {
          if (onHover != null) {
            onHover!();
          }
        }
        return Semantics(
          button: true,
          label: semanticsLabel ?? 'Pressable',
          child: MouseRegion(
            cursor: mouseCursor ?? MouseCursor.defer,
            child: GsGestureDetector(
              onPressed: onPress,
              onLongPress: onLongPress,
              onTapDown: onTapDown,
              onTapUp: onTapUp,
              onTapCancel: onTapCancel,
              onSecondaryTap: onSecondaryTap,
              onSecondaryTapDown: onSecondaryTapDown,
              onSecondaryTapUp: onSecondaryTapUp,
              onSecondaryTapCancel: onSecondaryTapCancel,
              onTertiaryTapDown: onTertiaryTapDown,
              onTertiaryTapUp: onTertiaryTapUp,
              onTertiaryTapCancel: onTertiaryTapCancel,
              onDoubleTap: onDoubleTap,
              onLongPressDown: onLongPressDown,
              onLongPressCancel: onLongPressCancel,
              onLongPressStart: onLongPressStart,
              onLongPressMoveUpdate: onLongPressMoveUpdate,
              onLongPressUp: onLongPressUp,
              onLongPressEnd: onLongPressEnd,
              onSecondaryLongPressDown: onSecondaryLongPressDown,
              onSecondaryLongPressCancel: onSecondaryLongPressCancel,
              onSecondaryLongPress: onSecondaryLongPress,
              onSecondaryLongPressStart: onSecondaryLongPressStart,
              onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate,
              onSecondaryLongPressUp: onSecondaryLongPressUp,
              onSecondaryLongPressEnd: onSecondaryLongPressEnd,
              onTertiaryLongPressDown: onTertiaryLongPressDown,
              onTertiaryLongPressCancel: onTertiaryLongPressCancel,
              onTertiaryLongPress: onTertiaryLongPress,
              onTertiaryLongPressStart: onTertiaryLongPressStart,
              onTertiaryLongPressMoveUpdate: onTertiaryLongPressMoveUpdate,
              onTertiaryLongPressUp: onTertiaryLongPressUp,
              onTertiaryLongPressEnd: onTertiaryLongPressEnd,
              onVerticalDragDown: onVerticalDragDown,
              onVerticalDragStart: onVerticalDragStart,
              onVerticalDragUpdate: onVerticalDragUpdate,
              onVerticalDragEnd: onVerticalDragEnd,
              onVerticalDragCancel: onVerticalDragCancel,
              onHorizontalDragDown: onHorizontalDragDown,
              onHorizontalDragStart: onHorizontalDragStart,
              onHorizontalDragUpdate: onHorizontalDragUpdate,
              onHorizontalDragEnd: onHorizontalDragEnd,
              onHorizontalDragCancel: onHorizontalDragCancel,
              onForcePressStart: onForcePressStart,
              onForcePressPeak: onForcePressPeak,
              onForcePressUpdate: onForcePressUpdate,
              onForcePressEnd: onForcePressEnd,
              onPanDown: onPanDown,
              onPanStart: onPanStart,
              onPanUpdate: onPanUpdate,
              onPanEnd: onPanEnd,
              onPanCancel: onPanCancel,
              onScaleStart: onScaleStart,
              onScaleUpdate: onScaleUpdate,
              onScaleEnd: onScaleEnd,
              behavior: behavior,
              excludeFromSemantics: excludeFromSemantics,
              dragStartBehavior: dragStartBehavior,
              trackpadScrollCausesScale: trackpadScrollCausesScale,
              trackpadScrollToScaleFactor: trackpadScrollToScaleFactor,
              supportedDevices: supportedDevices,
              // radius: widget.radius,
              // customBorder: widget.customBorder,
              // splashColor: styler.splashColor,
              // highlightColor: styler.highlightColor,
              child: Container(
                decoration: BoxDecoration(
                  color: styler.bg ?? const Color.fromARGB(0, 0, 0, 0),
                  borderRadius: borderRadius,
                  border: GSStyleBuilderProvider.of(context)?.isFocused ?? false
                      ? Border.all(
                          color: styler.onFocus?.borderColor ??
                              styler.borderColor ??
                              styler.outlineColor ??
                              $GSColors.primary300,
                          width: styler.onFocus?.borderWidth ?? 1)
                      : null,
                ),
                child: Padding(
                  padding: EdgeInsets.all(hitSlop ?? 0),
                  child: child,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
