import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/utils/drop_down.dart';
import 'package:gluestack_flutter_pro/utils/toggle.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text_area/gs_text_area.dart';

class TextAreaExample extends StatefulWidget {
  const TextAreaExample({super.key});

  @override
  State<TextAreaExample> createState() => _TextAreaExampleState();
}

class _TextAreaExampleState extends State<TextAreaExample> {
  final List dropdownSizeOptions = [
    GSSizes.$sm,
    GSSizes.$md,
    GSSizes.$lg,
    GSSizes.$xl,
  ];
  GSSizes selectedSizeOption = GSSizes.$md;

  bool isDisabled = false;
  bool isInvalid = false;
  bool isReadOnly = false;

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

  void updateIsReadOnly(bool value) {
    setState(() {
      isReadOnly = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSTextArea(
              size: selectedSizeOption,
              isDisabled: isDisabled,
              readOnly: isReadOnly,
              isInvalid: isInvalid,
              hintText: "Enter text here",
              style: GSStyle(
                width: 300,
              ),
            ),
            Column(
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
                ),
                CustomToggle(
                  title: "isReadOnly",
                  value: isReadOnly,
                  onToggle: updateIsReadOnly,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
