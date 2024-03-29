import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/widgets/gs_vstack/gs_vstack_style.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

/// Provides a consistent set of spacing values that can be applied between the children of a [GSVStack].
enum GSVstackSpaces { $none, $xs, $sm, $md, $lg, $xl, $2xl, $3xl, $4xl }

/// A widget that arranges its children in a vertical sequence. [GSVStack] allows for
/// flexible layout configurations and spacing between its child widgets, making it
/// suitable for creating vertical layouts with consistent spacing and alignment.
class GSVStack extends StatelessWidget {
  /// The list of widgets to display within the [GSVStack]. These are laid out in a vertical
  /// sequence.
  final List<Widget> children;

  /// Determines the space between each child in the stack. This can be one of the predefined
  /// [GSVstackSpaces] values. Defaults to [GSVstackSpaces.$none], indicating no space between children.
  final GSVstackSpaces? space;

  /// Determines how the children should be aligned along the stack's main axis.
  /// Defaults to [MainAxisAlignment.start].
  final MainAxisAlignment mainAxisAlignment;

  /// Determines how the children should be aligned along the stack's cross axis.
  /// Defaults to [CrossAxisAlignment.center].
  final CrossAxisAlignment crossAxisAlignment;

  /// Specifies how much space the children should occupy along the main axis.
  /// Defaults to [MainAxisSize.max], allowing the stack to expand to fit the available space.
  final MainAxisSize mainAxisSize;

  /// The baseline alignment for the children when [crossAxisAlignment] is set to
  /// [CrossAxisAlignment.baseline]. This is only effective when a [textBaseline] is specified.
  final TextBaseline? textBaseline;

  /// The directionality of the layout. This influences the order and position of the children
  /// within the stack. Defaults to the ambient [Directionality] of the context if not explicitly specified.
  final TextDirection? textDirection;

  /// If `true`, reverses the order of the children, making the last child appear first and vice versa.
  /// Defaults to `false`.
  final bool isReversed;

  /// Determines the order in which the children are laid out and painted along the cross axis.
  /// Defaults to [VerticalDirection.down], laying out and painting children from top to bottom.
  final VerticalDirection verticalDirection;
  const GSVStack({
    super.key,
    this.space = GSVstackSpaces.$none,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.textBaseline,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.isReversed = false,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> spacedChildrenList = [];
    // Convert the [GSVstackSpaces] enum to a GSSpace spacing value.
    final vStackSpace = space?.toGSSpaces;

    // Iterate over the children to insert spacing widgets between them, based on the
    // specified [space] value, except after the last child.
    for (var child in children) {
      spacedChildrenList.add(child);
      if (child != children.last) {
        spacedChildrenList.add(
          SizedBox(
              height: vStackSpace == GSSpaces.$none
                  ? null
                  : vstackStyle.spaceMap(vStackSpace)?.gap),
        );
      }
    }
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      // Conditionally reverse the order of children if [isReversed] is true.
      children: isReversed
          ? spacedChildrenList.reversed.toList()
          : spacedChildrenList,
    );
  }
}
