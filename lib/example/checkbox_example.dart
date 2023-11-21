import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/space_token.dart';
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
      body: SizedBox(
        width: double.infinity,
        child: GSCheckBoxGroup(
          onChanged: (p0) {
            print(p0);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GSCheckBox(
                size: GSSizes.$sm,
                value: valueList[0],
                onChanged: (p0) {
                  print("individual check box ");
                },
                icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin: const EdgeInsets.only(right: $GSSpace.$3)),
                    child: const GSCheckBoxIcon()),
                label: const GSCheckBoxLabel(text: 'check box 1'),
              ),
              GSCheckBox(
                value: valueList[1],
                onChanged: (p0) {
                  // setState(() {});
                },
                icon: GSCheckBoxIndicator(
                    style: GSStyle(
                      margin: const EdgeInsets.only(right: $GSSpace.$2),
                    ),
                    child: const GSCheckBoxIcon()),
                label: const GSCheckBoxLabel(text: 'check box 2'),
              ),
              GSCheckBox(
                size: GSSizes.$lg,
                onChanged: (p0) {
                  // setState(() {});
                },
                value: valueList[2],
                icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
                label: const GSCheckBoxLabel(text: 'check box 3'),
              ),
              GSCheckBox(
                isInvalid: true,
                onChanged: (p0) {
                  // setState(() {});
                },
                value: valueList[3],
                icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
                label: const GSCheckBoxLabel(text: 'check box 3'),
              ),
              GSCheckBox(
                isDisabled: true,
                size: GSSizes.$lg,
                onChanged: (p0) {
                  // setState(() {});
                },
                value: valueList[4],
                icon: GSCheckBoxIndicator(
                    style:
                        GSStyle(onDisabled: GSStyle(borderColor: Colors.amber)),
                    child: const GSCheckBoxIcon()),
                label: GSCheckBoxLabel(
                    style: GSStyle(color: Colors.blue), text: 'check box 4'),
              ),
              GSCheckBox(
                isDisabled: true,
                isInvalid: true,
                size: GSSizes.$lg,
                onChanged: (p0) {
                  // setState(() {});
                },
                value: valueList[5],
                icon: const GSCheckBoxIndicator(child: GSCheckBoxIcon()),
                label: const GSCheckBoxLabel(text: 'check box 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
