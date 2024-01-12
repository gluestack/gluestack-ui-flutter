import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/radio_button_example.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class MultipleRadioButtonPreview extends StatefulWidget {
  const MultipleRadioButtonPreview({super.key});

  @override
  State<MultipleRadioButtonPreview> createState() =>
      _MultipleRadioButtonPreviewState();
}

class _MultipleRadioButtonPreviewState
    extends State<MultipleRadioButtonPreview> {
  Value groupValueOne = Value.one;

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'RadioButton',
        stories: [
          Story(
            name: 'RadioButton',
            builder: (context) => GSBox(
              style: GSStyle(width: 100, height: 150),
              child: GSVStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GSRadio<Value>(
                    value: Value.one,
                    groupValue: groupValueOne,
                    onChanged: (p0) {
                      setState(() {
                        groupValueOne = p0!;
                      });
                    },
                    icon: const GSRadioIcon<Value>(),
                    label: const GSRadioText<Value>(text: 'English'),
                    style: GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GSRadio<Value>(
                    value: Value.two,
                    groupValue: groupValueOne,
                    onChanged: (p0) {
                      setState(() {
                        groupValueOne = p0!;
                      });
                    },
                    icon: const GSRadioIcon<Value>(),
                    label: const GSRadioText<Value>(text: 'French'),
                    style: GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GSRadio<Value>(
                    value: Value.three,
                    groupValue: groupValueOne,
                    onChanged: (p0) {
                      setState(() {
                        groupValueOne = p0!;
                      });
                    },
                    icon: const GSRadioIcon<Value>(),
                    label: const GSRadioText<Value>(text: 'German'),
                    style: GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
