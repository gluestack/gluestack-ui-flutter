import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class NestedAccordionPreview extends StatelessWidget {
  const NestedAccordionPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      GSBox(
        style: GlueStyle(width: 500, height: 380),
        child: const GSAccordion(
          size: GSAccordionSizes.$md,
          type: GSAccordionTypes.multiple,
          variant: GSAccordionVariants.filled,
          isCollapsible: true,
          prefixIconWhenTileCollapsed: GSAccordionIcon(icon: Icons.add),
          prefixIconWhenTileExapanded: GSAccordionIcon(icon: Icons.remove),
          itemPadding: EdgeInsets.all(5),
          children: [
            GSAccordionItem(
              title: GSAccordionTitle(
                text: 'USA',
              ),
              content: GSAccordion(
                size: GSAccordionSizes.$md,
                type: GSAccordionTypes.multiple,
                variant: GSAccordionVariants.filled,
                isCollapsible: true,
                suffixIconWhenTileExpanded: GSAccordionIcon(icon: Icons.remove),
                suffixIconWhenTileCollapsed: GSAccordionIcon(icon: Icons.add),
                itemPadding: EdgeInsets.all(5),
                children: [
                  GSAccordionItem(
                    title: GSAccordionTitle(
                      text: 'California',
                    ),
                    content: GSAccordionContent(
                      text:
                          "Capital city of California is Sacramento. California has a GDP of 2.89 trillion dollars and follows Pacific Standard Time zone.",
                    ),
                  ),
                  GSAccordionItem(
                    // radius: 12,

                    title: GSAccordionTitle(
                      text: 'Nevada',
                    ),
                    content: GSAccordionContent(
                      text:
                          "Nevada is located in a mountainous region that includes vast semiarid grasslands and sandy alkali deserts. It is the most arid state of the country.",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
