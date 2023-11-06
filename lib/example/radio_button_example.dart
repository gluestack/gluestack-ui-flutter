import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/color_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_text.dart';

class RadioButtonExample extends StatefulWidget {
  const RadioButtonExample({super.key});

  @override
  State<RadioButtonExample> createState() => _RadioButtonExampleState();
}

enum Value { one, two, three, four }

class _RadioButtonExampleState extends State<RadioButtonExample> {
  Value groupValue = Value.one;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GSRadio<Value>(
            style: GSStyle(
              checked: GSStyle(
                color: $GSColors.purple500,
                onHover: GSStyle(
                  color: $GSColors.pink300,
                ),
              ),
            ),
            value: Value.one,
            groupValue: groupValue,
            onChanged: (p0) {
              setState(
                () {
                  groupValue = p0!;
                },
              );
            },
            icon: const GSRadioIcon<Value>(),
            label: const GSRadioText<Value>(text: 'text1'),
          ),
          GSRadio<Value>(
            isInvalid: true,
            value: Value.two,
            groupValue: groupValue,
            onChanged: (p0) {
              setState(
                () {
                  groupValue = p0!;
                },
              );
            },
            icon: const GSRadioIcon<Value>(),
            label: const GSRadioText<Value>(text: 'text2'),
          ),
          GSRadio<Value>(
            isDisabled: true,
            value: Value.three,
            groupValue: groupValue,
            onChanged: (p0) {
              setState(
                () {
                  groupValue = p0!;
                },
              );
            },
            icon: const GSRadioIcon<Value>(),
            label: const GSRadioText<Value>(text: 'text3'),
          ),
          GSRadio<Value>(
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
        ],
      ),
    );
  }
}
