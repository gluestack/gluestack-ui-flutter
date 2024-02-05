import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/radio_button_example.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class RadioButtonWithHelpTextPreview extends StatefulWidget {
  const RadioButtonWithHelpTextPreview({super.key});

  @override
  State<RadioButtonWithHelpTextPreview> createState() =>
      _RadioButtonWithHelpTextPreviewState();
}

class _RadioButtonWithHelpTextPreviewState
    extends State<RadioButtonWithHelpTextPreview> {
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
                width: 200,
                height: 115,
              ),
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
                    label: const GSVStack(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GSRadioText<Value>(text: 'Extended Coverage'),
                        GSText(text: 'Extra services included')
                      ],
                    ),
                    style: GSStyle(
                      margin: EdgeInsets.only(
                        right: $GSSpace.$4,
                        bottom: $GSSpace.$4,
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
                    label: const GSVStack(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GSRadioText<Value>(text: 'Basic Coverage'),
                        GSText(text: 'Basic services')
                      ],
                    ),
                    style: GSStyle(
                      margin: EdgeInsets.only(
                        right: $GSSpace.$4,
                        bottom: $GSSpace.$4,
                      ),
                    ),
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
