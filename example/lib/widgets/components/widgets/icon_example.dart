import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';

import '../layout/drop_down.dart';

class IconExample extends StatefulWidget {
  const IconExample({super.key});

  @override
  State<IconExample> createState() => _IconExampleState();
}

class _IconExampleState extends State<IconExample> {
  final List dropdownSizeOptions = [
    GSIconSizes.$xs,
    GSIconSizes.$sm,
    GSIconSizes.$md,
    GSIconSizes.$lg,
    GSIconSizes.$xl,
  ];
  GSIconSizes selectedSizeOption = GSIconSizes.$md;

  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
          GSIcon(
              icon: Icons.calendar_month,
              size: GSIconSizes.\$md,
           )
  ''';
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.menuColor,
        title: const GSText(
          text: "Icon",
          size: GSSizes.$xl,
        ),
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
