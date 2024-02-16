import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';
import 'package:gluestack_ui_example/widgets/drop_down.dart';
import 'package:gluestack_ui_example/widgets/toggle.dart';

class HStackExample extends StatefulWidget {
  const HStackExample({super.key});

  @override
  State<HStackExample> createState() => _HStackExampleState();
}

class _HStackExampleState extends State<HStackExample> {
  final List dropdownSpaceOptions = [
    GSHstackSpaces.$none,
    GSHstackSpaces.$xs,
    GSHstackSpaces.$sm,
    GSHstackSpaces.$md,
    GSHstackSpaces.$lg,
    GSHstackSpaces.$xl,
    GSHstackSpaces.$2xl,
    GSHstackSpaces.$3xl,
    GSHstackSpaces.$4xl,
  ];
  GSHstackSpaces selectedSpaceOption = GSHstackSpaces.$none;
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
    final theme = GSTheme.of(context);
    var code = '''
        GSHStack(
            mainAxisAlignment: MainAxisAlignment.center,
            isReversed: false,
            space: GSHstackSpaces.\$none,
            children: [
              GSBox(
                style: GSStyle(height: 100, width: 100, color: \$GSColors.blue300),
                child: const Text('1'),
              ),
              GSBox(
                style: GSStyle(height: 100, width: 100, color: \$GSColors.blue400),
                child: const Text('2'),
              ),
              GSBox(
                style: GSStyle(height: 100, width: 100, color: \$GSColors.blue500),
                child: const Text('3'),
              ),
            ],
         )
  ''';
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.menuColor,
        title: const GSText(
          text: "HStack",
          size: GSSizes.$xl,
        ),
      ),
      body: BaseLayout(
        code: code,
        component: GSHStack(
          mainAxisAlignment: MainAxisAlignment.center,
          isReversed: isReversed,
          space: selectedSpaceOption,
          children: [
            GSBox(
              style: GSStyle(height: 100, width: 100, bg: $GSColors.blue300),
              child: const Text('1'),
            ),
            GSBox(
              style: GSStyle(height: 100, width: 100, bg: $GSColors.blue400),
              child: const Text('2'),
            ),
            GSBox(
              style: GSStyle(height: 100, width: 100, bg: $GSColors.blue500),
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
