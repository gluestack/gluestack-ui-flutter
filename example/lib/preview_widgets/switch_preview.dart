import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SwitchPreview extends StatefulWidget {
  const SwitchPreview({super.key});

  @override
  State<SwitchPreview> createState() => _SwitchPreviewState();
}

class _SwitchPreviewState extends State<SwitchPreview> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    //Need to add value according to GSSizes enum order.
    List<Option<int>> sizeOptions = [
      Option<int>(value: 2, label: GSSizes.$sm.name),
      Option<int>(value: 3, label: GSSizes.$md.name),
      Option<int>(value: 4, label: GSSizes.$lg.name),
    ];

    return materialWrapper(
      context,
      Storybook(initialStory: 'Switch', stories: [
        Story(
            name: 'Switch',
            builder: (context) => GSSwitch(
                size: GSSizes.values[context.knobs
                    .options(label: 'Size', initial: 3, options: sizeOptions)],
                value: isSelected,
                isDisabled: context.knobs.boolean(label: 'isDisabled'),
                onToggle: (value) {
                  setState(() {
                    isSelected = value;
                  });
                }))
      ]),
    );
  }
}
