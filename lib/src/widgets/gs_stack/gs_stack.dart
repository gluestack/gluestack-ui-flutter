import 'package:flutter/widgets.dart';

/// A widget that positions its children relative to the edges of its box. [GSStack] allows
/// for layering of widgets on top of each other, providing control over how they are aligned,
/// sized, and clipped. It's a versatile container for creating complex layouts with overlapping elements.
/// By default, the non-positioned children of the stack are aligned by their top left corners.
class GSStack extends StatelessWidget {
  /// How the children are aligned relative to each other and to the [GSStack]. The default
  /// is [AlignmentDirectional.topStart], which aligns children to the top start corner of the stack.
  final AlignmentGeometry alignment;

  /// The directionality of the text and [AlignmentDirectional] alignments within the stack.
  /// If not provided, the ambient [Directionality] is used.
  final TextDirection? textDirection;

  /// How the children should be sized relative to the [GSStack]. The default is [StackFit.loose],
  /// allowing children to render to their intrinsic size.
  final StackFit fit;

  /// The way to handle children that overflow the stack's bounds. The default is [Clip.hardEdge],
  /// clipping children to the stack's bounding box.
  final Clip clipBehavior;

  /// The list of widgets to lay out within the stack. These widgets are layered in the order they
  /// appear in the list, with the first widget at the bottom and the last widget at the top.
  final List<Widget> children;

  const GSStack({
    super.key,
    this.alignment = AlignmentDirectional.topStart,
    this.textDirection,
    this.fit = StackFit.loose,
    this.clipBehavior = Clip.hardEdge,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      textDirection: textDirection,
      fit: fit,
      clipBehavior: clipBehavior,
      children: children,
    );
  }
}
