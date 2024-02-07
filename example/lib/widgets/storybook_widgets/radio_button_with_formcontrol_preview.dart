import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/radio_button_example.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class RadioButtonWithFormControlPreview extends StatefulWidget {
  const RadioButtonWithFormControlPreview({super.key});

  @override
  State<RadioButtonWithFormControlPreview> createState() =>
      _RadioButtonWithFormControlPreviewState();
}

class _RadioButtonWithFormControlPreviewState
    extends State<RadioButtonWithFormControlPreview> {
  Value groupValueOne = Value.one;

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'RadioButton',
        initialLayout: Layout.compact,
        stories: [
          Story(
            name: 'RadioButton',
            builder: (context) => GSBox(
              style: GSStyle(
                width: 310,
                height: 190,
              ),
              child: GSVStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GSHeading(text: 'Which time slot works best for you?'),
                  const SizedBox(
                    height: 10,
                  ),
                  GSRadio<Value>(
                    value: Value.one,
                    groupValue: groupValueOne,
                    onChanged: (p0) {
                      setState(() {
                        groupValueOne = p0!;
                      });
                    },
                    icon: const GSRadioIcon<Value>(),
                    label: const GSRadioText<Value>(text: 'Monday'),
                    style: GSStyle(
                      margin: EdgeInsets.only(
                        right: $GSSpace.$4,
                      ),
                    ),
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
                    label: const GSRadioText<Value>(text: 'Tuesday'),
                    style: GSStyle(
                      margin: EdgeInsets.only(
                        right: $GSSpace.$4,
                      ),
                    ),
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
                    label: const GSRadioText<Value>(text: 'Wednesday'),
                    style: GSStyle(
                      margin: EdgeInsets.only(
                        right: $GSSpace.$4,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GSText(text: 'Choose a time slot for the meeting')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
