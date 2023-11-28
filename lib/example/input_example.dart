import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/utils/base_layout.dart';
import 'package:gluestack_flutter_pro/utils/drop_down.dart';
import 'package:gluestack_flutter_pro/utils/toggle.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input.dart';
import 'package:provider/provider.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);
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
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: Center(
        child: BaseLayout(
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
              CustomDropDown(
                title: "variant",
                dropdownOptions: dropdownVariantOptions,
                selectedOption: selectedVariantOption,
                onChanged: updateVariantSelectedOption,
              ),
              CustomToggle(
                title: "isDisabled",
                value: isDisabled,
                onToggle: updateIsDisabled,
              ),
              CustomToggle(
                title: "isInvalid",
                value: isInvalid,
                onToggle: updateIsInvalid,
              ),
              CustomToggle(
                title: "isReadOnly",
                value: isReadOnly,
                onToggle: updateIsReadOnly,
              )
            ],
          ),
        ),
      ),
    );
  }
}
