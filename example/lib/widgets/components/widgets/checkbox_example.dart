import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import '../layout/drop_down.dart';
import '../layout/toggle.dart';

class CheckBoxExample extends StatefulWidget {
  const CheckBoxExample({super.key});

  @override
  State<CheckBoxExample> createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  final List dropdownSizeOptions = [
    GSCheckBoxSizes.$sm,
    GSCheckBoxSizes.$md,
    GSCheckBoxSizes.$lg
  ];
  GSCheckBoxSizes selectedSizeOption = GSCheckBoxSizes.$md;
  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  bool isDisabled = false;
  bool isInvalid = false;

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

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
          GSCheckBox(
              icon: GSCheckBoxIndicator(
                  style: GSStyle(margin: const EdgeInsets.only(right: \$GSSpace.\$2)),
                  child: const GSCheckBoxIcon(),
              ),
              value: "value 1",
              onChanged: (value) {},
              label: const GSCheckBoxLabel(text: "value1"),
              size: GSCheckBoxSizes.\$md,
              isDisabled: false,
              isInvalid: false,
          )
  ''';
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            theme.brightness == Brightness.dark ? $GSColors.trueGray800 : null,
        title: const GSText(
          text: "Checkbox",
          size: GSSizes.$xl,
        ),
      ),
      body: GSBox(
        style: GSStyle(
          dark: GSStyle(bg: $GSColors.black),
        ),
        child: BaseLayout(
          code: code,
          component: GSCheckBox(
            icon: GSCheckBoxIndicator(
              style: GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
              child: const GSCheckBoxIcon(),
            ),
            value: "value 1",
            onChanged: (value) {},
            label: const GSCheckBoxLabel(text: "value1"),
            size: selectedSizeOption,
            isDisabled: isDisabled,
            isInvalid: isInvalid,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
