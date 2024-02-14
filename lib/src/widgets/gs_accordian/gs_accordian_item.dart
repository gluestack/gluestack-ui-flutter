import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_accordian_provider.dart';

class GSAccordionItem extends StatelessWidget {
  final GSAccordionTitle title;
  final GSAccordionContent? content;

  const GSAccordionItem({
    super.key,
    required this.title,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
