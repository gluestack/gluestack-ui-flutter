import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/drop_down.dart';

class AlertBoxExample extends StatefulWidget {
  const AlertBoxExample({super.key});

  @override
  State<AlertBoxExample> createState() => _AlertBoxExampleState();
}

class _AlertBoxExampleState extends State<AlertBoxExample> {
  final List dropdownActionOptions = [
    GSAlertBoxActions.success,
    GSAlertBoxActions.info,
    GSAlertBoxActions.error,
    GSAlertBoxActions.warning,
    GSAlertBoxActions.muted,
  ];
  GSAlertBoxActions selectedActionOption = GSAlertBoxActions.muted;

  final List dropdownVariantOptions = [
    GSAlertBoxVariants.solid,
    GSAlertBoxVariants.outline,
  ];
  GSAlertBoxVariants selectedVariantOption = GSAlertBoxVariants.solid;
  void updateVariantSelectedOption(dynamic newOption) {
    setState(() {
      selectedVariantOption = newOption;
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
         
''';
    return CustomGSLayout(
      title: "AlertBox",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: BaseLayout(
        code: code,
        component: Center(
          child: GSAlert(
            description: const GSAlertText('Description of alert!'),
            icon: const GSAlertBoxIcon(
              iconData: Icons.info_outline,
            ),
            variant: selectedVariantOption,
            action: selectedActionOption,
          ),
        ),
        controls: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
              title: "action",
              dropdownOptions: dropdownActionOptions,
              selectedOption: selectedActionOption,
              onChanged: updateActionSelectedOption,
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
