import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/radio_button_example.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class RadioButtonPreview extends StatefulWidget {
  const RadioButtonPreview({super.key});

  @override
  State<RadioButtonPreview> createState() => _RadioButtonPreviewState();
}

class _RadioButtonPreviewState extends State<RadioButtonPreview> {
  Value groupValue = Value.one;
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
      Storybook(
        initialStory: 'RadioButton',
        stories: [
          Story(
            name: 'RadioButton',
            builder: (context) => GSRadio<Value>(
              size: GSSizes.values[context.knobs
                  .options(label: 'Size', initial: 3, options: sizeOptions)],
              isInvalid:
                  context.knobs.boolean(label: "isInvalid", initial: false),
              isDisabled:
                  context.knobs.boolean(label: "isDisabled", initial: false),
              value: Value.four,
              groupValue: groupValue,
              onChanged: (p0) {
                setState(() {
                  groupValue = p0!;
                });
              },
              icon: const GSRadioIcon<Value>(),
              label: const GSRadioText<Value>(text: 'text'),
              style: GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
            ),
          ),
        ],
      ),
    );
  }
}
