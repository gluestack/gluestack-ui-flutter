import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_center/gs_center.dart';
import 'package:gluestack_flutter_pro/widgets/gs_switch/gs_switch.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const GSText(text: 'Toggle'),
              const SizedBox(width: 10),
              GSSwitch(
                  // isDisabled: true,
                  // isInvalid: true,
                  size: GSSizes.$lg,
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
            ],
          ),
        ],
      ),
    );
  }
}
