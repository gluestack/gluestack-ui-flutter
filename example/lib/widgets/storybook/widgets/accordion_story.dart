import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> typesOptions = generateEnumOptions(GSAccordionTypes.values);
final List<Option<int>> variantOptions = generateEnumOptions(GSAccordionVariants.values);
final List<Option<int>> sizeOptions = generateEnumOptions(GSAccordionSizes.values);

final class AccordionStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSAccordion(
        type: GSAccordionTypes.values[context.knobs
            .options(label: 'Type', initial: 0, options: typesOptions)],
        variant: GSAccordionVariants.values[context.knobs
            .options(label: 'Variant', initial: 0, options: variantOptions)],
        size: GSAccordionSizes.values[context.knobs
            .options(label: 'Size', initial: 1, options: sizeOptions)],
        isDisabled: context.knobs.boolean(label: "isDisabled", initial: false),
        isCollapsible:
            context.knobs.boolean(label: "isCollapsible", initial: false),
        children: const [
          GSAccordionItem(
            title: GSAccordionTitle(text: 'How do I place an order?'),
            content: GSAccordionContent(
              text:
                  "To place an order, simply select the products you want, proceed to checkout, provide shipping and payment information, and finalize your purchase.",
            ),
          ),
          GSAccordionItem(
            title:
                GSAccordionTitle(text: 'What payment options do you accept?'),
            content: GSAccordionContent(
              text:
                  "We accept all major credit cards, including Visa, Mastercard, and American Express. We also support payments through PayPal.",
            ),
          ),
        ],
      ),
    );
  }

  @override
  String get routePath => "accordion-preview";

  @override
  String get storyName => "Accordion";
}
