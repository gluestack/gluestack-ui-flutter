import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class TextareaPreview extends StatelessWidget {
  const TextareaPreview({super.key});

  @override
  Widget build(BuildContext context) {
    //Need to add value according to GSSizes enum order.
    List<Option<int>> sizeOptions = [
      Option<int>(value: 2, label: GSSizes.$sm.name),
      Option<int>(value: 3, label: GSSizes.$md.name),
      Option<int>(value: 4, label: GSSizes.$lg.name),
      Option<int>(value: 5, label: GSSizes.$xl.name),
    ];

    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Textarea',
        stories: [
          Story(
            name: 'Textarea',
            builder: (context) => GSTextArea(
              size: GSSizes.values[context.knobs
                  .options(label: 'Size', initial: 3, options: sizeOptions)],
              isDisabled:
                  context.knobs.boolean(label: "isDisabled", initial: false),
              isInvalid:
                  context.knobs.boolean(label: "isInvalid", initial: false),
              isReadOnly:
                  context.knobs.boolean(label: "isReadOnly", initial: false),
              hintText: "Enter text here",
              style: GSStyle(
                width: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
