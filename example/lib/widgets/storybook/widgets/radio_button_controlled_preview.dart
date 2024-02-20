import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../components/widgets/public.dart';

class RadioButtonControlledPreview extends StatefulWidget {
  const RadioButtonControlledPreview({super.key});

  @override
  State<RadioButtonControlledPreview> createState() =>
      _RadioButtonControlledPreviewState();
}

class _RadioButtonControlledPreviewState
    extends State<RadioButtonControlledPreview> {
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
              style: GSStyle(width: 150, height: 100),
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
                    label: const GSRadioText<Value>(text: 'Apartments'),
                    icon: const GSRadioIcon<Value>(),
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
                    label: const GSRadioText<Value>(text: 'Houses'),
                    style: GSStyle(
                      margin: EdgeInsets.only(
                        right: $GSSpace.$4,
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
