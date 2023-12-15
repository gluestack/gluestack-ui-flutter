import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:gluestack_ui_example/utils/drop_down.dart';

class IconExample extends StatefulWidget {
  const IconExample({super.key});

  @override
  State<IconExample> createState() => _IconExampleState();
}

class _IconExampleState extends State<IconExample> {
  final List dropdownSizeOptions = [
    GSSizes.$xs,
    GSSizes.$sm,
    GSSizes.$md,
    GSSizes.$lg,
    GSSizes.$xl,
  ];
  GSSizes selectedSizeOption = GSSizes.$md;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    var code = '''GSIcon(
            icon: Icons.calendar_month,
            size: GSSizes.\$md,
          )
  ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon"),
      ),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSIcon(
            icon: Icons.calendar_month,
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
