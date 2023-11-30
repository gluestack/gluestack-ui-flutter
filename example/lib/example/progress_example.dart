import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:gluestack_ui_example/utils/drop_down.dart';

class ProgressExample extends StatefulWidget {
  const ProgressExample({super.key});

  @override
  State<ProgressExample> createState() => _ProgressExampleState();
}

class _ProgressExampleState extends State<ProgressExample> {
  final List dropdownSizeOptions = [
    GSSizes.$xs,
    GSSizes.$sm,
    GSSizes.$md,
    GSSizes.$lg,
    GSSizes.$xl,
    GSSizes.$2xl,
  ];
  GSSizes selectedSizeOption = GSSizes.$md;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''GSProgress(
            value: 0.4,
            size: selectedSizeOption,
          )
  ''';
    return Scaffold(
      appBar: AppBar(),
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
