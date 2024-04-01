import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class GSAccordionItem extends StatelessWidget {
  /// The widget used as the title or header of the accordion item. This is displayed
  /// prominently at the top of the item and is always visible, serving as the main
  /// interaction point for expanding or collapsing the item's content.
  final GSAccordionTitle title;

  /// The content widget displayed when the accordion item is expanded. We recommend [GSAccordionContent] widget as content but it
  /// can contain any widget, including text, images, etc.
  /// It remains hidden until the user expands the accordion item by interacting with the [title].
  final Widget? content;

  /// Defines the border radius for the accordion item. This radius is applied to
  /// the corners of the item, allowing for rounded edges. The default value is `0`,
  /// resulting in square corners. Specifying a greater value creates more pronounced
  /// rounded corners.
  final double? radius;

  /// Determines whether the accordion item is interactable. If set to `true`, the item
  /// cannot be expanded or collapsed by user interactions. This can be used to temporarily
  /// disable an item in the accordion. The default value is `false`, meaning the item
  /// is enabled and interactable.
  final bool? isDisabled;

  const GSAccordionItem({
    super.key,
    required this.title,
    this.content,
    this.radius = 0,
    this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
