import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/radio_button_example.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  Value groupValue = Value.one;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GSFormControl(
        // isRequired: true,
        // isInvalid: true,
        // isReadOnly: false,
        // isDisabled: false,
        // isDisabled: true,
        autovalidateMode: AutovalidateMode.always,
        child: Column(children: [
          GSInput(
            // isDisabled: false,
            // isInvalid: true,
            initialValue: "12345",
            obscureText: true,
          ),
          GSInput(
            // style: GSStyle(height: 100),
            // isDisabled: true,
            // isInvalid: true,
            initialValue: "Haha ",
            validator: (input) {
              if (input != null && (input as String).length > 6) {
                return "More than 6, not allowed!";
              }
              return null;
            },
          ),
          GSInput(
            initialValue: "TestArea",
          ),
          //TEXTAREA---------------------
          GSTextArea(
            // isDisabled: true,
            size: GSSizes.$md,
            hintText: "Enter text here",
          ),
          //CHECKBOX------------------------
          GSCheckBox(
            icon: GSCheckBoxIndicator(
              style: GSStyle(margin: const EdgeInsets.only(right: $GSSpace.$2)),
              child: const GSCheckBoxIcon(),
            ),
            value: "value 1",
            onChanged: (value) {},
            label: const GSCheckBoxLabel(text: "value1"),
            // size: selectedSizeOption,
            // isDisabled: true,

            // isInvalid: isInvalid,
          ),
          //Radio---------------------------
          GSRadio<Value>(
            // isDisabled: isDisabled,
            // isInvalid: isInvalid,
            value: Value.four,
            groupValue: groupValue,
            onChanged: (p0) {
              setState(() {
                groupValue = p0!;
              });
            },
            icon: const GSRadioIcon<Value>(),
            label: const GSRadioText<Value>(text: 'text4'),
            style: GSStyle(margin: const EdgeInsets.only(right: $GSSpace.$2)),
          ),
        ]),
      ),
    );
  }
}
