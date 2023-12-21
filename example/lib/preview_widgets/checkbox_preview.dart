import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CheckboxPreview extends StatelessWidget {
  const CheckboxPreview({super.key});

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
        initialStory: 'Checkbox',
        stories: [
          Story(
            name: 'Checkbox',
            builder: (context) => GSCheckBox(
              size: GSSizes.values[context.knobs
                  .options(label: 'Size', initial: 3, options: sizeOptions)],
              isInvalid:
                  context.knobs.boolean(label: "isInvalid", initial: false),
              isDisabled:
                  context.knobs.boolean(label: "isDisabled", initial: false),
              icon: GSCheckBoxIndicator(
                style: GSStyle(margin: EdgeInsets.only(right: $GSSpace.$2)),
                child: const GSCheckBoxIcon(),
              ),
              value: "value 1",
              onChanged: (value) {},
              label: const GSCheckBoxLabel(text: "value1"),
            ),
          ),
        ],
      ),
    );
  }
}
