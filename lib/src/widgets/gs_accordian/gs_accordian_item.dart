import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class GSAccordionItem extends StatelessWidget {
  final GSAccordionTitle title;
  final GSAccordionContent? content;
  final double? radius;
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
