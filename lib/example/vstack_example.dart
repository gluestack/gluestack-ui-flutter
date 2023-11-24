import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/utils/drop_down.dart';
import 'package:gluestack_flutter_pro/utils/toggle.dart';
import 'package:gluestack_flutter_pro/widgets/gs_box/gs_box.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';

class VStackExample extends StatefulWidget {
  const VStackExample({super.key});

  @override
  State<VStackExample> createState() => _VStackExampleState();
}

class _VStackExampleState extends State<VStackExample> {
  final List dropdownSpaceOptions = [
    GSSpaces.$none,
    GSSpaces.$xs,
    GSSpaces.$sm,
    GSSpaces.$md,
    GSSpaces.$lg,
    GSSpaces.$xl,
    GSSpaces.$2xl,
    GSSpaces.$3xl,
    GSSpaces.$4xl,
  ];
  GSSpaces selectedSpaceOption = GSSpaces.$none;
  void updateSpaceSelectedOption(dynamic newOption) {
    setState(() {
      selectedSpaceOption = newOption;
    });
  }

  bool isReversed = false;
  void updateIsReversed(bool value) {
    setState(() {
      isReversed = value;
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
          GSVStack(
            mainAxisAlignment: MainAxisAlignment.center,
            isReversed: isReversed,
            space: selectedSpaceOption,
            children: [
              GSBox(
                style:
                    GSStyle(height: 200, width: 200, color: $GSColors.blue300),
                child: const Text('1'),
              ),
              GSBox(
                style:
                    GSStyle(height: 200, width: 200, color: $GSColors.blue400),
                child: const Text('2'),
              ),
              GSBox(
                style:
                    GSStyle(height: 200, width: 200, color: $GSColors.blue500),
                child: const Text('3'),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropDown(
                title: "space",
                dropdownOptions: dropdownSpaceOptions,
                selectedOption: selectedSpaceOption,
                onChanged: updateSpaceSelectedOption,
              ),
              CustomToggle(
                title: "isReversed",
                value: isReversed,
                onToggle: updateIsReversed,
              ),
            ],
          )
        ],
      )),
    );
  }
}
