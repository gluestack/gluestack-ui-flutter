import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AccordionDefaultValuePreview extends StatelessWidget {
  const AccordionDefaultValuePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      GSBox(
        style: GSStyle(width: 400, height: 350),
        child: GSAccordion(
          size: GSAccordionSizes.$md,
          type: GSAccordionTypes.multiple,

          variant: GSAccordionVariants.filled,
          isCollapsible: true,
          suffixIconWhenTileExpanded: const GSAccordionIcon(icon: Icons.remove),
          suffixIconWhenTileCollapsed: const GSAccordionIcon(icon: Icons.add),
          // style: GlueStyle(bg: $GSColors.amber400),
          itemPadding: const EdgeInsets.all(5),
          initialValues: const [false, false, true],

          children: const [
            GSAccordionItem(
              title: GSAccordionTitle(
                text: 'What is the default prop of the Accordion widget ?',
              ),
              content: GSAccordionContent(
                text:
                    "The defaultValue prop of the Accordion widget is used to define the open item by default. It is used when the Accordion component is uncontrolled",
              ),
            ),
            GSAccordionItem(
              title: GSAccordionTitle(text: 'Is this accordion accessible?'),
              content: GSAccordionContent(
                text:
                    "Yes, the accordion is accessible. It adheres to the WAI-ARIA design pattern. You can read more about it in the accessibility section of the docs.",
              ),
            ),
            GSAccordionItem(
              title: GSAccordionTitle(text: 'Is this accordion accessible?'),
              content: GSAccordionContent(
                text:
                    "Yes, the accordion is accessible. It adheres to the WAI-ARIA design pattern. You can read more about it in the accessibility section of the docs.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
