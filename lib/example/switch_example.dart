import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/utils/drop_down.dart';
import 'package:gluestack_flutter_pro/utils/toggle.dart';
import 'package:gluestack_flutter_pro/widgets/gs_switch/gs_switch.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GSSwitch(
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
                    // print('value: $val1');
                  }),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
        ],
      ),
    );
  }
}
