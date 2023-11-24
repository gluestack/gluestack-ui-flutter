import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/utils/drop_down.dart';
import 'package:gluestack_flutter_pro/utils/toggle.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSButton(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropDown(
                  title: "size",
                  dropdownOptions: dropdownSizeOptions,
                  selectedOption: selectedSizeOption,
                  onChanged: updateSizeSelectedOption,
                ),
                CustomDropDown(
                  title: "variant",
                  dropdownOptions: dropdownVariantOptions,
                  selectedOption: selectedVariantOption,
                  onChanged: updateVariantSelectedOption,
                ),
                CustomDropDown(
                  title: "action",
                  dropdownOptions: dropdownActionOptions,
                  selectedOption: selectedActionOption,
                  onChanged: updateActionSelectedOption,
                ),
                CustomToggle(
                  title: "isDisabled",
                  value: isDisabled,
                  onToggle: updateIsDisabled,
                ),
                CustomToggle(
                  title: "isFocusVisible",
                  value: isFocusVisible,
                  onToggle: updateIsFocusVisible,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
