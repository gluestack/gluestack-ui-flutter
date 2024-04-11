import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';

/// A responsive layout widget that switches between a [Row] and a [Column] layout based on
/// the available screen width. [GSResponsiveRowColumn] is designed to provide a flexible layout
/// solution for applications that need to adapt their layout dynamically to screen size changes.
class GSResponsiveRowColumn extends StatelessWidget {
  /// The threshold width at which the layout switches from horizontal ([Row]) to vertical ([Column]).
  final double? constraintWidth;

  /// The list of child widgets to lay out in a row or column.
  final List<Widget> children;

  /// Determines how the children should be aligned along the main axis in both [Row] and [Column] layouts.
  final MainAxisAlignment mainAxisAlignment;

  /// Specifies how much space along the main axis should be occupied by the children in both [Row] and [Column] layouts.
  final MainAxisSize mainAxisSize;

  /// Determines how the children should be aligned along the cross axis in both [Row] and [Column] layouts.
  final CrossAxisAlignment crossAxisAlignment;

  /// The directionality of the layout, which affects how [MainAxisAlignment] and [CrossAxisAlignment] are applied.
  final TextDirection? textDirection;

  /// Determines the order in which the children are laid out and painted along the cross axis in both [Row] and [Column] layouts.
  final VerticalDirection verticalDirection;

  /// The baseline alignment for children when [crossAxisAlignment] is set to [CrossAxisAlignment.baseline].
  final TextBaseline? textBaseline;

  /// The way to handle children that overflow the bounds of the [Row] or [Column].
  final Clip clipBehavior;

  /// The layout direction to use. If null, the direction is determined based on the screen width and [constraintWidth].
  final Axis? direction;

  /// Padding to be applied between each child. The orientation of the padding (horizontal or vertical) is determined
  /// by the current layout direction ([Row] or [Column]).
  final EdgeInsets? separatorPadding;

  const GSResponsiveRowColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
    this.direction,
    this.separatorPadding,
    this.constraintWidth = 768,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if the screen width is smaller than the specified constraintWidth.
    bool isSmallScreen = isScreenSmallerThan(constraintWidth!, context);
// Construct the Flex layout with dynamically adjusted properties based on screen size.
    return Flex(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment:
          isSmallScreen ? CrossAxisAlignment.stretch : crossAxisAlignment,
      clipBehavior: clipBehavior,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      // Choose the layout direction based on the screen size or the explicitly provided direction.
      direction: direction ?? (isSmallScreen ? Axis.vertical : Axis.horizontal),
      // Apply separator padding and wrap each child with GSBox for consistent spacing.
      children: children.map((child) {
        return GSBox(
          style: GSStyle(
            // Adjust padding orientation based on the current layout direction.
            padding: isSmallScreen
                ? separatorPadding ?? const EdgeInsets.symmetric(vertical: 4)
                : separatorPadding ?? const EdgeInsets.symmetric(horizontal: 4),
          ),
          child: child,
        );
      }).toList(),
    );
  }
}
