import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';
import '../layout/drop_down.dart';
import '../layout/toggle.dart';

class VStackExample extends StatefulWidget {
  const VStackExample({super.key});

  @override
  State<VStackExample> createState() => _VStackExampleState();
}

class _VStackExampleState extends State<VStackExample> {
  final List<GSVstackSpaces?> dropdownSpaceOptions = [
    null,
    GSVstackSpaces.$xs,
    GSVstackSpaces.$sm,
    GSVstackSpaces.$md,
    GSVstackSpaces.$lg,
    GSVstackSpaces.$xl,
    GSVstackSpaces.$2xl,
    GSVstackSpaces.$3xl,
    GSVstackSpaces.$4xl,
  ];
  GSVstackSpaces? selectedSpaceOption;
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
    var code = '''
          GSVStack(
              mainAxisAlignment: MainAxisAlignment.center,
              isReversed: false,
              space: GSVstackSpaces.\$none,
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
    return CustomGSLayout(
      title: "VStack",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: BaseLayout(
        code: code,
        component: GSVStack(
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
