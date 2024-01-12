import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';
import 'package:gluestack_ui_example/widgets/drop_down.dart';
import 'package:gluestack_ui_example/widgets/toggle.dart';

class RadioButtonExample extends StatefulWidget {
  const RadioButtonExample({super.key});

  @override
  State<RadioButtonExample> createState() => _RadioButtonExampleState();
}

enum Value { one, two, three, four }

class _RadioButtonExampleState extends State<RadioButtonExample> {
  Value groupValue = Value.one;
  final List dropdownSizeOptions = [GSSizes.$sm, GSSizes.$md, GSSizes.$lg];
  GSSizes selectedSizeOption = GSSizes.$md;

  bool isDisabled = false;
  bool isInvalid = false;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
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

  @override
  Widget build(BuildContext context) {
    var code = '''
          GSRadio<Value>(
              size: GSSizes.\$md,
              isDisabled: false,
              isInvalid: false,
              value: Value.four,
              groupValue: groupValue,
              onChanged: (p0) {
                  setState(() {
                    groupValue = p0!;
                  });
              },
              icon: const GSRadioIcon<Value>(),
              label: const GSRadioText<Value>(text: 'text4'),
              style: GSStyle(margin: const EdgeInsets.only(right: $GSSpace.\$2)),
          )
  ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio Button"),
      ),
      body: BaseLayout(
        code: code,
        component: GSRadio<Value>(
          size: selectedSizeOption,
          isDisabled: isDisabled,
          isInvalid: isInvalid,
          value: Value.four,
          groupValue: groupValue,
          onChanged: (p0) {
            setState(() {
              groupValue = p0!;
            });
          },
          icon: const GSRadioIcon<Value>(),
          label: const GSRadioText<Value>(text: 'text4'),
          style: GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
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
