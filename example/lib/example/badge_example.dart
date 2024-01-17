import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';
import 'package:gluestack_ui_example/widgets/drop_down.dart';

/// Example widget demonstrating the usage of GSBadge, GSBadgeIcon, and GSBadgeText.
class BadgeExample extends StatefulWidget {
  const BadgeExample({super.key});

  @override
  State<BadgeExample> createState() => _BadgeExampleState();
}

class _BadgeExampleState extends State<BadgeExample> {
  final List dropdownSizeOptions = [
    GSBadgeSizes.$sm,
    GSBadgeSizes.$md,
    GSBadgeSizes.$lg
  ];
  GSBadgeSizes selectedSizeOption = GSBadgeSizes.$md;

  final List dropdownVariantOptions = [
    GSBadgeVariants.solid,
    GSBadgeVariants.outline,
  ];
  GSBadgeVariants selectedVariantOption = GSBadgeVariants.solid;

  final List dropdownRadiusOptions = [
    GSBadgeRadius.$none,
    GSBadgeRadius.$xs,
    GSBadgeRadius.$sm,
    GSBadgeRadius.$md,
    GSBadgeRadius.$lg,
    GSBadgeRadius.$xl,
    GSBadgeRadius.$2xl,
    GSBadgeRadius.$3xl,
    GSBadgeRadius.$full,
  ];
  GSBadgeRadius selectedRadiusOption = GSBadgeRadius.$full;

  final List dropdownActionOptions = [
    GSBadgeActions.error,
    GSBadgeActions.warning,
    GSBadgeActions.success,
    GSBadgeActions.info,
    GSBadgeActions.muted,
  ];
  GSBadgeActions selectedActionOption = GSBadgeActions.success;

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

  void updateRadiusSelectedOption(dynamic newOption) {
    setState(() {
      selectedRadiusOption = newOption;
    });
  }

  void updateActionSelectedOption(dynamic newOption) {
    setState(() {
      selectedActionOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''
          GSBadge(
              action: GSActions.success,
              variant:  GSVariants.solid,
              size: GSSizes.\$md,
              icon: const GSBadgeIcon(
                iconData: Icons.info_outline,
              ),
              text: const GSBadgeText(
                'information',
              ),
           )
  ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Badge"),
      ),
      body: BaseLayout(
        code: code,
        component: GSBadge(
          size: selectedSizeOption,
          action: selectedActionOption,
          variant: selectedVariantOption,
          borderRadius: selectedRadiusOption,
          icon: const GSBadgeIcon(
            iconData: Icons.info_outline,
          ),
          text: const GSBadgeText(
            'information',
          ),
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
              title: "borderRadius",
              dropdownOptions: dropdownRadiusOptions,
              selectedOption: selectedRadiusOption,
              onChanged: updateRadiusSelectedOption,
            ),
            const SizedBox(height: 20),
            CustomDropDown(
              title: "action",
              dropdownOptions: dropdownActionOptions,
              selectedOption: selectedActionOption,
              onChanged: updateActionSelectedOption,
            ),
          ],
        ),
      ),
    );
  }
}
