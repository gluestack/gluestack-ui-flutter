import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/color.dart';
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

  /// Callback when the user presses this widget.
  final GestureTapCallback? onPress;

  /// Callback when the user starts to tap/press this widget.
  final GestureTapUpCallback? onPressIn;

  /// Callback when the user releases the tap/press that was started on this widget.
  final GestureTapDownCallback? onPressOut;

  /// Callback when the user cancels a press that was started on this widget.
  final GestureTapCallback? onPressCancel;

  /// Callback when the user long presses this widget.
  final GestureLongPressCallback? onLongPress;

  /// Callback when the user double taps this part of the material.
  final GestureTapCallback? onDoubleTap;

  /// Callback when the user taps this part of the material with a secondary button.
  final GestureTapCallback? onSecondaryTap;

  /// Callback when the user taps down on this part of the material with a
  /// secondary button.
  final GestureTapDownCallback? onSecondaryTapDown;

  /// Callback when the user releases a secondary button tap that was started on
  /// this part of the material. [onSecondaryTap] is called immediately after.
  final GestureTapUpCallback? onSecondaryTapUp;

  /// Callback when the user cancels a secondary button tap that was started on
  /// this part of the material.
  final GestureTapCallback? onSecondaryTapCancel;

  /// Mouse cursor to use when hovering over this widget.
  final MouseCursor? mouseCursor;

  /// Whether the ink well should be contained within the widget.
  final bool containedInkWell;

  // /// The shape of the ink well highlight.
  // final BoxShape highlightShape;

  /// The radius of the ink splash.
  final double? radius;

  /// The border radius of the containing rectangle. This is effective only if
  /// [highlightShape] is [BoxShape.rectangle].
  ///
  /// If this is null, it is interpreted as [BorderRadius.zero].
  final BorderRadius? borderRadius;

  /// Custom shape border for the ink well.
  final ShapeBorder? customBorder;

  /// Whether to provide haptic feedback on press.
  final bool enableFeedback;

  /// Whether to exclude this widget from semantics.
  final bool excludeFromSemantics;

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

  /// Creates a new instance of GSPressable.
  const GSPressable({
    super.key,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.focusNode,
    this.canRequestFocus = true,
    this.onFocusChange,
    this.autofocus = false,
    this.containedInkWell = false,
    // this.highlightShape = BoxShape.circle,
    this.style,
    required this.child,
    this.onPress,
    this.onLongPress,
    this.onPressIn,
    this.onPressOut,
    this.hitSlop,
    this.onPressCancel,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.mouseCursor,
    this.radius,
    this.borderRadius,
    this.customBorder,
    this.onShowFocusHighlight,
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
        return FocusableActionDetector(
          focusNode: focusNode,
          onFocusChange: onFocusChange,
          onShowFocusHighlight: onShowFocusHighlight,
          mouseCursor: mouseCursor ?? MouseCursor.defer,
          autofocus: autofocus,
          child: GestureDetector(
            onTap: onPress,
            onTapUp: onPressIn,
            onTapDown: onPressOut,
            onLongPress: onLongPress,
            onDoubleTap: onDoubleTap,
            onSecondaryTap: onSecondaryTap,
            onSecondaryTapUp: onSecondaryTapUp,
            onSecondaryTapDown: onSecondaryTapDown,
            onSecondaryTapCancel: onSecondaryTapCancel,
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
        );
      }),
    );
  }
}
