import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/utils/base_layout.dart';
import 'package:gluestack_flutter_pro/utils/drop_down.dart';
import 'package:gluestack_flutter_pro/utils/toggle.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_text.dart';
import 'package:provider/provider.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: Center(
        child: BaseLayout(
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
              CustomToggle(
                title: "isDisabled",
                value: isDisabled,
                onToggle: updateIsDisabled,
              ),
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
