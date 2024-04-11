import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_hstack/gs_hstack_style.dart';

/// A widget that arranges its children in a horizontal sequence. [GSHStack] allows for
/// flexible layout configurations and spacing between its child widgets, making it
/// suitable for creating horizontal layouts with consistent spacing and alignment.
class GSHStack extends StatelessWidget {
  /// Determines the space between each child in the stack. This can be one of the predefined
  /// [GSHstackSpaces] values. Defaults to [GSHstackSpaces.$none], indicating no space between children.
  final GSHstackSpaces? space;

  /// The list of widgets to display within the [GSHStack]. These are laid out in a horizontal sequence.
  final List<Widget> children;

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
  const GSHStack({
    super.key,
    this.space,
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
    // Convert the [GSHstackSpaces] enum to a GSSpace spacing value.
    final hStackSpace = space?.toGSSpaces;

    // Iterate over the children to insert spacing widgets between them, based on the
    // specified [space] value, except after the last child.
    for (var child in children) {
      spacedChildrenList.add(child);
      if (child != children.last && space != null) {
        spacedChildrenList.add(
          SizedBox(width: hstackStyle.spaceMap(hStackSpace)?.gap),
        );
      }
    }

    return Row(
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
