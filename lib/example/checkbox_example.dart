import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_indicator.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_label.dart';

class CheckBoxExample extends StatefulWidget {
  const CheckBoxExample({super.key});

  @override
  State<CheckBoxExample> createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  final List<bool> valueList = List.generate(6, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSCheckBox(
              size: GSSizes.$sm,
              value: valueList[0],
              onChanged: (p0) {
                setState(() {
                  valueList[0] = p0 ?? false;
                });
              },
              icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
              label: const GSCheckBoxLabel(text: 'check box 1'),
            ),
            GSCheckBox(
              value: valueList[1],
              onChanged: (p0) {
                setState(() {
                  valueList[1] = p0 ?? false;
                });
              },
              icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
              label: const GSCheckBoxLabel(text: 'check box 2'),
            ),
            GSCheckBox(
              size: GSSizes.$lg,
              onChanged: (p0) {
                setState(() {
                  valueList[2] = p0 ?? false;
                });
              },
              value: valueList[2],
              icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
              label: const GSCheckBoxLabel(text: 'check box 3'),
            ),
            GSCheckBox(
              isInvalid: true,
              onChanged: (p0) {
                setState(() {
                  valueList[3] = p0 ?? false;
                });
              },
              value: valueList[3],
              icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
              label: const GSCheckBoxLabel(text: 'check box 3'),
            ),
            GSCheckBox(
              isDisabled: true,
              size: GSSizes.$lg,
              onChanged: (p0) {
                setState(() {
                  valueList[4] = p0 ?? false;
                });
              },
              value: valueList[4],
              icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
              label: const GSCheckBoxLabel(text: 'check box 3'),
            ),
            GSCheckBox(
              isDisabled: true,
              isInvalid: true,
              size: GSSizes.$lg,
              onChanged: (p0) {
                setState(() {
                  valueList[5] = p0 ?? false;
                });
              },
              value: valueList[5],
              icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
              label: const GSCheckBoxLabel(text: 'check box 3'),
            ),
          ],
        ),
      ),
    );
  }
}
