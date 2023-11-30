import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:gluestack_ui_example/utils/drop_down.dart';
import 'package:gluestack_ui_example/utils/toggle.dart';

class ButtonExample extends StatefulWidget {
  const ButtonExample({super.key});

  @override
  State<ButtonExample> createState() => _ButtonExampleState();
}

class _ButtonExampleState extends State<ButtonExample> {
  final List dropdownSizeOptions = [
    GSSizes.$xs,
    GSSizes.$sm,
    GSSizes.$md,
    GSSizes.$lg
  ];
  GSSizes selectedSizeOption = GSSizes.$md;

  final List dropdownActionOptions = [
    GSActions.primary,
    GSActions.secondary,
    GSActions.positive,
    GSActions.negative,
  ];
  GSActions selectedActionOption = GSActions.primary;

  final List dropdownVariantOptions = [
    GSVariants.solid,
    GSVariants.outline,
    GSVariants.link,
  ];
  GSVariants selectedVariantOption = GSVariants.solid;

  bool isDisabled = false;
  bool isFocusVisible = false;

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

  void updateActionSelectedOption(dynamic newOption) {
    setState(() {
      selectedActionOption = newOption;
    });
  }

  void updateIsDisabled(bool value) {
    setState(() {
      isDisabled = value;
    });
  }

  void updateIsFocusVisible(bool value) {
    setState(() {
      isFocusVisible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''GSButton(
                action: GSActions.primary,
                variant: GSVariants.solid,
                size: GSSize.\$md,
                isDisabled: false,
                isFocusVisible: false,
                onPressed: () {},
                child: const Row(
                  children: [
                    GSButtonText(text: "Add"),
                    GSButtonIcon(icon: Icons.add)
                  ],
                ),
              )
  ''';
    return Scaffold(
      appBar: AppBar(),
      body: BaseLayout(
        code: code,
        component: GSButton(
          action: selectedActionOption,
          variant: selectedVariantOption,
          size: selectedSizeOption,
          isDisabled: isDisabled,
          isFocusVisible: isFocusVisible,
          onPressed: () {},
          child: const Row(
            children: [
              GSButtonText(text: "Add"),
              GSButtonIcon(icon: Icons.add)
            ],
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
              title: "action",
              dropdownOptions: dropdownActionOptions,
              selectedOption: selectedActionOption,
              onChanged: updateActionSelectedOption,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isDisabled",
              value: isDisabled,
              onToggle: updateIsDisabled,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isFocusVisible",
              value: isFocusVisible,
              onToggle: updateIsFocusVisible,
            )
          ],
        ),
      ),
    );
  }
}
