import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:gluestack_ui_example/utils/drop_down.dart';
import 'package:gluestack_ui_example/utils/toggle.dart';

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
    var code = '''GSVStack(
            mainAxisAlignment: MainAxisAlignment.center,
            isReversed: false,
            space: GSSpaces.\$none,
            children: [
              GSBox(
                style:
                    GSStyle(height: 100, width: 100, color: \$GSColors.blue300),
                child: const Text('1'),
              ),
              GSBox(
                style:
                    GSStyle(height: 100, width: 100, color: \$GSColors.blue400),
                child: const Text('2'),
              ),
              GSBox(
                style:
                    GSStyle(height: 100, width: 100, color: \$GSColors.blue500),
                child: const Text('3'),
              ),
            ],
          )
  ''';
    return Scaffold(
      appBar: AppBar(),
      body: BaseLayout(
        code: code,
        component: GSVStack(
          mainAxisAlignment: MainAxisAlignment.center,
          isReversed: isReversed,
          space: selectedSpaceOption,
          children: [
            GSBox(
              style: GSStyle(height: 100, width: 100, color: $GSColors.blue300),
              child: const Text('1'),
            ),
            GSBox(
              style: GSStyle(height: 100, width: 100, color: $GSColors.blue400),
              child: const Text('2'),
            ),
            GSBox(
              style: GSStyle(height: 100, width: 100, color: $GSColors.blue500),
              child: const Text('3'),
            ),
          ],
        ),
        controls: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
              title: "space",
              dropdownOptions: dropdownSpaceOptions,
              selectedOption: selectedSpaceOption,
              onChanged: updateSpaceSelectedOption,
            ),
            const SizedBox(height: 20),
            CustomToggle(
              title: "isReversed",
              value: isReversed,
              onToggle: updateIsReversed,
            ),
          ],
        ),
      ),
    );
  }
}
