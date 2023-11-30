import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:gluestack_ui_example/utils/drop_down.dart';
import 'package:gluestack_ui_example/utils/toggle.dart';

class InputExample extends StatefulWidget {
  const InputExample({super.key});

  @override
  State<InputExample> createState() => _InputExampleState();
}

class _InputExampleState extends State<InputExample> {
  final List dropdownSizeOptions = [
    GSSizes.$sm,
    GSSizes.$md,
    GSSizes.$lg,
    GSSizes.$xl,
  ];
  GSSizes selectedSizeOption = GSSizes.$md;

  final List dropdownVariantOptions = [
    GSVariants.outline,
    GSVariants.rounded,
    GSVariants.underlined,
  ];
  GSVariants selectedVariantOption = GSVariants.outline;

  bool isDisabled = false;
  bool isInvalid = false;
  bool isReadOnly = false;

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

  void updateIsDisabled(bool value) {
    setState(() {
      isDisabled = value;
    });
  }

  void updateIsInvalid(bool value) {
    setState(() {
      isInvalid = value;
    });
  }

  void updateIsReadOnly(bool value) {
    setState(() {
      isReadOnly = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''GSInput(
            size: GSSizes.\$md,
            variant: GSVariants.outline,
            hintText: "Enter text here",
            isDisabled: false,
            isInvalid: false,
            readOnly: false,
            style: GSStyle(
              width: 300,
            ),
          )
  ''';
    return Scaffold(
      appBar: AppBar(),
      body: BaseLayout(
        code: code,
        component: GSInput(
          size: selectedSizeOption,
          variant: selectedVariantOption,
          hintText: "Enter text here",
          isDisabled: isDisabled,
          isInvalid: isInvalid,
          readOnly: isReadOnly,
          style: GSStyle(
            width: 300,
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
            CustomToggle(
              title: "isDisabled",
              value: isDisabled,
              onToggle: updateIsDisabled,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isInvalid",
              value: isInvalid,
              onToggle: updateIsInvalid,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isReadOnly",
              value: isReadOnly,
              onToggle: updateIsReadOnly,
            )
          ],
        ),
      ),
    );
  }
}
