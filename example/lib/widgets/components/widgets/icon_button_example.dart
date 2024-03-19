import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import '../layout/drop_down.dart';

class IconButtonExample extends StatefulWidget {
  const IconButtonExample({super.key});

  @override
  State<IconButtonExample> createState() => _IconButtonExampleState();
}

class _IconButtonExampleState extends State<IconButtonExample> {
  final List<GSIconButtonSizes> dropdownSizeOptions = [
    GSIconButtonSizes.$sm,
    GSIconButtonSizes.$md,
    GSIconButtonSizes.$lg,
  ];

  GSIconButtonSizes selectedSizeOption = GSIconButtonSizes.$md;
  void updateSizeSelectedOption(dynamic newOption) {
    setState(() {
      selectedSizeOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
      GSIconButton(
          size: GSIconButtonSizes.\$md,
          style: GSStyle(borderRadius: 8, bg: const Color(0xff00aaff)),
          showHighlight: false,
          icon: GSIcon(
               icon: Icons.add_a_photo,
               style: GSStyle(color: const Color(0xffffffff)),
           ),
           onPressed: () {
               print('Icon Button Pressed!');
           },
       ),
  ''';
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.menuColor,
        title: const GSText(
          text: "Icon Button",
          size: GSSizes.$xl,
        ),
      ),
      body: BaseLayout(
        code: code,
        component: GSIconButton(
          showHighlight: false,
          size: selectedSizeOption,
          style: GSStyle(borderRadius: 8, bg: const Color(0xff00aaff)),
          icon: const GSIcon(
            icon: Icons.add_a_photo,
          ),
          onPressed: () {
            // print('Icon Button Pressed!');
          },
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
    );
  }
}
