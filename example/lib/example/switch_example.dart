import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';
import 'package:gluestack_ui_example/widgets/drop_down.dart';
import 'package:gluestack_ui_example/widgets/toggle.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool val1 = false;

  final List dropdownSizeOptions = [GSSizes.$sm, GSSizes.$md, GSSizes.$lg];
  GSSizes selectedSizeOption = GSSizes.$md;
  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  bool isDisabled = false;
  void updateIsDisabled(bool value) {
    setState(() {
      isDisabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''
            GSSwitch(
                size: GSSizes.\$md,
                isDisabled: false,
                style: GSStyle(
                  checked: GSStyle(
                    thumbColor: Colors.grey,
                    activeThumbColor: Colors.blue,
                  ),
                ),
                value: val1,
                onToggle: (bool value) {
                  setState(() {
                    val1 = value;
                  });
                },
             )
''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch"),
      ),
      body: BaseLayout(
        code: code,
        component: GSSwitch(
          size: selectedSizeOption,
          isDisabled: isDisabled,
          style: GSStyle(
            checked: GSStyle(
              thumbColor: Colors.grey,
              activeThumbColor: Colors.blue,
            ),
          ),
          value: val1,
          onToggle: (bool value) {
            setState(() {
              val1 = value;
            });
          },
        ),
        controls: Column(
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
          ],
        ),
      ),
    );
  }
}
