import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:gluestack_ui_example/utils/drop_down.dart';
import 'package:gluestack_ui_example/utils/toggle.dart';

class CheckBoxExample extends StatefulWidget {
  const CheckBoxExample({super.key});

  @override
  State<CheckBoxExample> createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  final List dropdownSizeOptions = [GSSizes.$sm, GSSizes.$md, GSSizes.$lg];
  GSSizes selectedSizeOption = GSSizes.$md;
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
    var code = '''GSCheckBox(
            icon: GSCheckBoxIndicator(
              style: GSStyle(margin: const EdgeInsets.only(right: \$GSSpace.\$2)),
              child: const GSCheckBoxIcon(),
            ),
            value: "value 1",
            onChanged: (value) {},
            label: const GSCheckBoxLabel(text: "value1"),
            size: GSSizes.\$md,
            isDisabled: false,
            isInvalid: false,
          )
  ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkbox"),
      ),
      body: BaseLayout(
        code: code,
        component: GSCheckBox(
          icon: GSCheckBoxIndicator(
            style: GSStyle(margin: const EdgeInsets.only(right: $GSSpace.$2)),
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
    );
  }
}
