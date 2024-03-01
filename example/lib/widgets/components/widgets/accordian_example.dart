import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/drop_down.dart';
import 'package:gluestack_ui_example/widgets/components/layout/toggle.dart';

class AccordionExample extends StatefulWidget {
  const AccordionExample({super.key});

  @override
  State<AccordionExample> createState() => _AccordionExampleState();
}

class _AccordionExampleState extends State<AccordionExample> {
  final List dropdownSizeOptions = [
    GSAccordionSizes.$sm,
    GSAccordionSizes.$md,
    GSAccordionSizes.$lg
  ];
  GSAccordionSizes selectedSizeOption = GSAccordionSizes.$md;

  final List dropdownTypeOptions = [
    GSAccordionTypes.single,
    GSAccordionTypes.multiple,
  ];
  GSAccordionTypes selectedTypeOption = GSAccordionTypes.multiple;

  final List dropdownVariantOptions = [
    GSAccordionVariants.filled,
    GSAccordionVariants.unfilled,
  ];
  GSAccordionVariants selectedVariantOption = GSAccordionVariants.unfilled;

  bool isDisabled = false;
  bool isCollapsible = false;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  void updateVariantSelectedOption(dynamic newOption) {
    setState(() {
      selectedVariantOption = newOption;
    });
  }

  void updateTypeSelectedOption(dynamic newOption) {
    setState(() {
      selectedTypeOption = newOption;
    });
  }

  void updateIsDisabled(bool value) {
    setState(() {
      isDisabled = value;
    });
  }

  void updateIsCollapsible(bool value) {
    setState(() {
      isCollapsible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''
GSAccordion(
          animationDuration: Duration(milliseconds: 200),
          size: GSAccordionSizes.\$md,
          type: GSAccordionTypes.multiple,
          variant: GSAccordionVariants.filled,
          isCollapsible: true,
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
  ''';
    final theme = GSTheme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Accordion"),
      ),
      body: BaseLayout(
        code: code,
        component: GSAccordion(
          size: selectedSizeOption,
          variant: selectedVariantOption,
          type: selectedTypeOption,
          isCollapsible: isCollapsible,
          isDisabled: isDisabled,
          // initialValues: [false, true],
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
        controls: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
              title: "size",
              dropdownOptions: dropdownSizeOptions,
              selectedOption: selectedSizeOption,
              onChanged: updateSizeSelectedOption,
            ),
            const SizedBox(height: 20),
            CustomDropDown(
              title: "variant",
              dropdownOptions: dropdownVariantOptions,
              selectedOption: selectedVariantOption,
              onChanged: updateVariantSelectedOption,
            ),
            const SizedBox(height: 20),
            CustomDropDown(
              title: "action",
              dropdownOptions: dropdownTypeOptions,
              selectedOption: selectedTypeOption,
              onChanged: updateTypeSelectedOption,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isDisabled",
              value: isDisabled,
              onToggle: updateIsDisabled,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isCollapsible",
              value: isCollapsible,
              onToggle: updateIsCollapsible,
            )
          ],
        ),
      ),
    );
  }
}
