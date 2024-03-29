import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';

class GSFlex extends StatelessWidget {
  /// Determines how the [GSFlex] children should be placed along the main axis in
  /// the flex layout. Defaults to [MainAxisAlignment.start].
  final MainAxisAlignment mainAxisAlignment;

  /// Specifies how much space along the main axis should be occupied by the children.
  /// Defaults to [MainAxisSize.max], allowing the flex container to expand to fit the
  /// available space.
  final MainAxisSize mainAxisSize;

  /// Determines the alignment of children within the cross axis of the flex layout.
  /// Defaults to [CrossAxisAlignment.center], centering children within the cross axis.
  final CrossAxisAlignment crossAxisAlignment;

  /// The directionality of the layout. This influences how [mainAxisAlignment] and
  /// [crossAxisAlignment] are applied. Defaults to the ambient [Directionality] of
  /// the context if not explicitly specified.
  final TextDirection? textDirection;

  /// Determines the order in which children are laid out and painted along the cross
  /// axis. Defaults to [VerticalDirection.down], laying out and painting children from
  /// top to bottom.
  final VerticalDirection verticalDirection;

  /// The baseline along which the children are aligned if the value is different from
  /// [CrossAxisAlignment.baseline]. This is only used when [crossAxisAlignment] is set
  /// to [CrossAxisAlignment.baseline].
  final TextBaseline? textBaseline;

  /// The way children should be clipped. Defaults to [Clip.none], allowing children to
  /// extend beyond the bounds of the [GSFlex] container.
  final Clip clipBehavior;

  /// The list of widgets to lay out within the [GSFlex] container. These are arranged
  /// according to the flex properties specified.
  final List<Widget> children;

  /// Custom [GSStyle] to apply to the flex container, enabling the specification of
  /// direction
  final GSStyle? style;

  const GSFlex({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
    this.children = const <Widget>[],
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    // Resolve the GSStyle for the GSFlex
    GSStyle styler = resolveStyles(
      context: context,
      inlineStyle: style,
      isFirst: true,
    );

    return Flex(
      direction: styler.direction ?? Axis.vertical,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      children: children,
    );
  }
}
