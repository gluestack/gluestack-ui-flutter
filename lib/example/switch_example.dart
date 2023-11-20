import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_center/gs_center.dart';
import 'package:gluestack_flutter_pro/widgets/gs_switch/gs_switch.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool val1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GSSwitch(
              // isDisabled: true,
              size: GSSizes.$lg,
              style: GSStyle(
                checked: GSStyle(
                    thumbColor: Colors.blue.withAlpha(180),
                    activeThumbColor: Colors.blue),
              ),
              value: val1,
              onToggle: (bool value) {
                setState(() {
                  val1 = value;
                });
                // print('value: $val1');
              }),
        ],
      ),
    );
  }
}
