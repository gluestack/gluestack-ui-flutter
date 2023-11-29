import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:gluestack_ui_example/utils/drop_down.dart';
import 'package:gluestack_ui_example/utils/toggle.dart';
import 'package:provider/provider.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    var code = '''GSSwitch(
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
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BaseLayout(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomDropDown(
                  title: "size",
                  dropdownOptions: dropdownSizeOptions,
                  selectedOption: selectedSizeOption,
                  onChanged: updateSizeSelectedOption,
                ),
                const SizedBox(height: 100),
                CustomToggle(
                  title: "isDisabled",
                  value: isDisabled,
                  onToggle: updateIsDisabled,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
