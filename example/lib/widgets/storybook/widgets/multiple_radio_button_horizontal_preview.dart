import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

import 'package:storybook_flutter/storybook_flutter.dart';

import '../../components/widgets/public.dart';

class MultipleRadioButtonHorizontalPreview extends StatefulWidget {
  const MultipleRadioButtonHorizontalPreview({super.key});

  @override
  State<MultipleRadioButtonHorizontalPreview> createState() =>
      _MultipleRadioButtonHorizontalPreviewState();
}

class _MultipleRadioButtonHorizontalPreviewState
    extends State<MultipleRadioButtonHorizontalPreview> {
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
              style: GSStyle(width: 350, height: 50),
              child: GSHStack(
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
                    label: const GSRadioText<Value>(text: 'Credit Card'),
                    style: GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
                  ),
                  const SizedBox(
                    width: 20,
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
                    label: const GSRadioText<Value>(text: 'UPI'),
                    style: GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
                  ),
                  const SizedBox(
                    width: 20,
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
                    label: const GSRadioText<Value>(text: 'Cash on Delivery'),
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
