import 'package:flutter/material.dart';

import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_group.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_indicator.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_label.dart';

class CheckBoxExample extends StatefulWidget {
  const CheckBoxExample({super.key});

  @override
  State<CheckBoxExample> createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  final List<String> valueList = List.generate(6, (index) => index.toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSCheckBox(
              icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
              value: "value 1",
              onChanged: (value) {
                print("is checkbox checked $value");
              },
              label: const GSCheckBoxLabel(text: "value1"),
            ),
            GSCheckBox(
              isChecked: true,
              icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
              value: "value 2",
              onChanged: (value) {
                print("is checkbox checked $value");
              },
              label: const GSCheckBoxLabel(text: "value2"),
            ),
            GSCheckBox(
              defaultIsChecked: true,
              icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
              value: "value 3",
              onChanged: (value) {
                print("is checkbox checked $value");
              },
              label: const GSCheckBoxLabel(text: "value3"),
            ),
            GSCheckBox(
              isDisabled: true,
              icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
              value: "value 4",
              onChanged: (value) {
                print("is checkbox checked $value");
              },
              label: const GSCheckBoxLabel(text: "value4"),
            ),
            GSCheckBox(
              isInvalid: true,
              icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
              value: "value 5",
              onChanged: (value) {
                print("is checkbox checked $value");
              },
              label: const GSCheckBoxLabel(text: "value5"),
            ),
            GSCheckBox(
              isInvalid: true,
              isDisabled: true,
              icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
              value: "value 6",
              onChanged: (value) {
                print("is checkbox checked $value");
              },
              label: const GSCheckBoxLabel(text: "value6"),
            ),
            GSCheckBoxGroup(
   
              onChanged: (values) {
                print(values);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GSCheckBox(
                    icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
                    value: "value 1",
                    onChanged: (value) {
                      print("is checkbox checked $value");
                    },
                    label: const GSCheckBoxLabel(text: "value1"),
                  ),
                  GSCheckBox(
                    isChecked: true,
                    icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
                    value: "value 2",
                    onChanged: (value) {
                      print("is checkbox checked $value");
                    },
                    label: const GSCheckBoxLabel(text: "value2"),
                  ),
                  GSCheckBox(
                    defaultIsChecked: true,
                    icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
                    value: "value 3",
                    onChanged: (value) {
                      print("is checkbox checked $value");
                    },
                    label: const GSCheckBoxLabel(text: "value3"),
                  ),
                  GSCheckBox(
                    isDisabled: true,
                    icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
                    value: "value 4",
                    onChanged: (value) {
                      print("is checkbox checked $value");
                    },
                    label: const GSCheckBoxLabel(text: "value4"),
                  ),
                  GSCheckBox(
                    isInvalid: true,
                    icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
                    value: "value 5",
                    onChanged: (value) {
                      print("is checkbox checked $value");
                    },
                    label: const GSCheckBoxLabel(text: "value5"),
                  ),
                  GSCheckBox(
                    isInvalid: true,
                    isDisabled: true,
                    icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
                    value: "value 6",
                    onChanged: (value) {
                      print("is checkbox checked $value");
                    },
                    label: const GSCheckBoxLabel(text: "value6"),
                  ),
                ],
              ),
            )
          ],
        ),
       
      ),
    );
  }
}
