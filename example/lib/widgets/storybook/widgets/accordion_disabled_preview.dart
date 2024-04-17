import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AccordionDisabledPreview extends StatelessWidget {
  const AccordionDisabledPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      GSBox(
        style: GSStyle(width: 400, height: 240),
        child: const GSAccordion(
          size: GSAccordionSizes.$md,
          type: GSAccordionTypes.multiple,

          variant: GSAccordionVariants.filled,
          isCollapsible: true,
          suffixIconWhenTileExpanded: GSAccordionIcon(icon: Icons.remove),
          suffixIconWhenTileCollapsed: GSAccordionIcon(icon: Icons.add),
          // style: GlueStyle(bg: $GSColors.amber400),
          itemPadding: EdgeInsets.all(5),

          children: [
            GSAccordionItem(
              // radius: 12,
              isDisabled: true,
              title: GSAccordionTitle(
                text: 'Disabled Item',
              ),
              content: GSAccordionContent(
                text: "Disabled item description...",
              ),
            ),
            GSAccordionItem(
              // radius: 12,
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
