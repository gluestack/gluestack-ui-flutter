import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AccordionWithRoundedCornersPreview extends StatelessWidget {
  const AccordionWithRoundedCornersPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      GSBox(
        style: GSStyle(width: 400, height: 350),
        child: const GSAccordion(
          size: GSAccordionSizes.$md,
          type: GSAccordionTypes.multiple,

          variant: GSAccordionVariants.filled,
          isCollapsible: true,
          prefixIconWhenTileExapanded: GSAccordionIcon(icon: Icons.remove),
          prefixIconWhenTileCollapsed: GSAccordionIcon(icon: Icons.add),
          // style: GlueStyle(bg: $GSColors.amber400),
          itemPadding: EdgeInsets.all(12),

          children: [
            GSAccordionItem(
              radius: 12,
              // isDisabled: true,
              title: GSAccordionTitle(
                text: 'How do I place an order?',
              ),
              content: GSAccordionContent(
                text:
                    "To place an order, simply select the products you want, proceed to checkout, provide shipping and payment information, and finalize your purchase.",
              ),
            ),
            GSAccordionItem(
              radius: 12,
              title:
                  GSAccordionTitle(text: 'What payment options do you accept?'),
              content: GSAccordionContent(
                text:
                    "We accept all major credit cards, including Visa, Mastercard, and American Express.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
