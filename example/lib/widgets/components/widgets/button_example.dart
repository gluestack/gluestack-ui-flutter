import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import '../layout/drop_down.dart';
import '../layout/toggle.dart';

class ButtonExample extends StatefulWidget {
  const ButtonExample({super.key});

  @override
  State<ButtonExample> createState() => _ButtonExampleState();
}

class _ButtonExampleState extends State<ButtonExample> {
  final List dropdownSizeOptions = [
    GSButtonSizes.$xs,
    GSButtonSizes.$sm,
    GSButtonSizes.$md,
    GSButtonSizes.$lg
  ];
  GSButtonSizes selectedSizeOption = GSButtonSizes.$md;

  final List dropdownActionOptions = [
    GSButtonActions.primary,
    GSButtonActions.secondary,
    GSButtonActions.positive,
    GSButtonActions.negative,
  ];
  GSButtonActions selectedActionOption = GSButtonActions.primary;

  final List dropdownVariantOptions = [
    GSButtonVariants.solid,
    GSButtonVariants.outline,
    GSButtonVariants.link,
  ];
  GSButtonVariants selectedVariantOption = GSButtonVariants.solid;

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
    var code = '''
              GSButton(
                    action: GSButtonActions.primary,
                    variant: GSButtonVariants.solid,
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
    return CustomGSLayout(
      title: "Button",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: BaseLayout(
        code: code,
        component: GSButton(
          action: selectedActionOption,
          variant: selectedVariantOption,
          size: selectedSizeOption,
          isDisabled: isDisabled,
          isFocusVisible: isFocusVisible,
          onHover: () {
            // print('Hovering');
          },
          onPressed: () {
            // print('presssed');
          },
          onDoubleTap: () {
            // print('double press');
          },
          // style: GSStyle(
          //   web: GSStyle(
          //     bg: $GSColors.amber600,
          //   ),
          //   ios: GSStyle(
          //     bg: $GSColors.pink600,
          //   ),
          //   onHover: GSStyle(
          //     bg: $GSColors.green400,
          //   ),
          //   md: GSStyle(
          //     bg: $GSColors.pink400,
          //   ),
          // ),
          child: const GSButtonText(text: "Click Here"),
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
