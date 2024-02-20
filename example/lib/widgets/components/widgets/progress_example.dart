import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/drop_down.dart';

class ProgressExample extends StatefulWidget {
  const ProgressExample({super.key});

  @override
  State<ProgressExample> createState() => _ProgressExampleState();
}

class _ProgressExampleState extends State<ProgressExample> {
  final List dropdownSizeOptions = [
    GSProgressSizes.$xs,
    GSProgressSizes.$sm,
    GSProgressSizes.$md,
    GSProgressSizes.$lg,
    GSProgressSizes.$xl,
    GSProgressSizes.$2xl,
  ];
  GSProgressSizes selectedSizeOption = GSProgressSizes.$md;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''
          GSProgress(
              value: 0.4,
              size: GSProgressSizes.\$md,
           )
  ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress"),
      ),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSProgress(
            value: 0.4,
            size: selectedSizeOption,
          ),
          controls: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropDown(
                title: "size",
                dropdownOptions: dropdownSizeOptions,
                selectedOption: selectedSizeOption,
                onChanged: updateSizeSelectedOption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
