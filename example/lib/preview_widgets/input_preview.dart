import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class InputPreview extends StatelessWidget {
  const InputPreview({super.key});

  @override
  Widget build(BuildContext context) {
    //Need to add value according to GSVariants enum order.
    List<Option<int>> variantOptions = [
      Option<int>(value: 4, label: GSVariants.rounded.name),
      Option<int>(value: 1, label: GSVariants.outline.name),
      Option<int>(value: 3, label: GSVariants.underlined.name),
    ];
    //Need to add value according to GSSizes enum order.
    List<Option<int>> sizeOptions = [
      Option<int>(value: 2, label: GSSizes.$sm.name),
      Option<int>(value: 3, label: GSSizes.$md.name),
      Option<int>(value: 4, label: GSSizes.$lg.name),
      Option<int>(value: 5, label: GSSizes.$xl.name),
    ];

    return Storybook(
      initialStory: 'Input',
      stories: [
        Story(
          name: 'Input',
          // Add description from gluestack website.
          description:
              'The Input component is your go-to tool for gathering user input in a sleek and user-friendly text field',
          builder: (context) => GSInput(
            variant: GSVariants.values[context.knobs.options(
                label: 'Variant', initial: 1, options: variantOptions)],
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
    );
  }
}
