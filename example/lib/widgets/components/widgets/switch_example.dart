import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import '../layout/drop_down.dart';
import '../layout/toggle.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool val1 = false;

  final List dropdownSizeOptions = [
    GSSwitchSizes.$sm,
    GSSwitchSizes.$md,
    GSSwitchSizes.$lg
  ];
  GSSwitchSizes selectedSizeOption = GSSwitchSizes.$md;
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
    final theme = GSTheme.of(context);
    var code = '''
            GSSwitch(
                size: GSSwitchSizes.\$md,
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
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.menuColor,
        title: const GSText(
          text: "Switch",
          size: GSSizes.$xl,
        ),
      ),
      body: BaseLayout(
        code: code,
        component: Column(
          children: [
            GSSwitch(
              isDisabled: isDisabled,
              size: selectedSizeOption,
              style: GSStyle(
                thumbColor: Colors.amber,
                trackColorFalse: Colors.orange,
                checked: GSStyle(
                  activeThumbColor: Colors.red,
                  trackColorTrue: Colors.black,
                ),
              ),
              value: val1,
              onToggle: (bool a) {
                print('switch value: $a');
              },
            ),
          ],
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
