import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';

class AccordionExample extends StatelessWidget {
  const AccordionExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
GSAccordion(
          animationDuration: Duration(milliseconds: 200),
          gsAccordionSize: GSAccordionSizes.\$md,
          gsAccordionType: GSAccordionTypes.multiple,
          gsAccordionVariant: GSAccordionVariants.filled,
          isCollapsible: true,
          children: [
                GSAccordionItem(
                  title: GSAccordionTitle(text: 'Title'),
                  content: GSAccordionContent(
                    text: "Content Bigggggg ",
                  ),
                ),
                GSAccordionItem(
                  title: GSAccordionTitle(text: 'Title 2'),
                  content: GSAccordionContent(
                    text: "Content 2",
                  ),
                ),
          ],
),
  ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accordion"),
      ),
      body: BaseLayout(
        code: code,
        component: const GSAccordion(
          animationDuration: Duration(milliseconds: 200),
          // gsAccordionSize: GSAccordionSizes.$md,
          // gsAccordionType: GSAccordionTypes.multiple,
          // gsAccordionVariant: GSAccordionVariants.filled,
          isCollapsible: true,
          // iconWhenTileCollapsed: GSAccordionIcon(icon: Icons.abc),
          isDisabled: false,
          children: [
            GSAccordionItem(
              title: GSAccordionTitle(text: 'Title'),
              content: GSAccordionContent(
                text: "Content Bigggggg ",
              ),
            ),
            GSAccordionItem(
              title: GSAccordionTitle(text: 'Title 2'),
              content: GSAccordionContent(
                text: "Content 2",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
