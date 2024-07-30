import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/drop_down.dart';

class SelectExample extends StatefulWidget {
  const SelectExample({super.key});

  @override
  State<SelectExample> createState() => _SelectExampleState();
}

class _SelectExampleState extends State<SelectExample> {
  final List dropdownSizeOptions = [
    GSSelectSizes.$sm,
    GSSelectSizes.$md,
    GSSelectSizes.$lg,
    GSSelectSizes.$xl,
  ];
  GSSelectSizes selectedSizeOption = GSSelectSizes.$md;

  final List dropdownVariantOptions = [
    GSSelectVariants.outline,
    GSSelectVariants.rounded,
    GSSelectVariants.underlined,
  ];
  GSSelectVariants selectedVariantOption = GSSelectVariants.outline;

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

  @override
  Widget build(BuildContext context) {
    var code = '''

  ''';

    return CustomGSLayout(
      title: "Select",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: BaseLayout(
        code: code,
        component: GSSelect(
          hintText: GSSelectHeaderText("Select option"),
          style: GSStyle(
            width: 300,
          ),
          icon: const GSSelectIcon(
            iconData: Icons.arrow_drop_down_outlined,
          ),
          size: selectedSizeOption,
          variant: selectedVariantOption,
          options: const [
            'UX Research',
            'Web Development',
            'Cross Platform Development Process',
            'UI Designing',
            'Backend Development'
          ],
          disabledOptions: [
            'Cross Platform Development Process',
            'UI Designing',
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
          ],
        ),
      ),
    );
  }
}
