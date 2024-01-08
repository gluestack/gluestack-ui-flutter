import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ButtonPreview extends StatelessWidget {
  const ButtonPreview({super.key});

  @override
  Widget build(BuildContext context) {
    //Need to add value according to GSActions enum order.
    List<Option<int>> actionOptions = [
      Option<int>(value: 0, label: GSActions.primary.name),
      Option<int>(value: 1, label: GSActions.secondary.name),
      Option<int>(value: 2, label: GSActions.positive.name),
      Option<int>(value: 3, label: GSActions.negative.name),
    ];
    //Need to add value according to GSVariants enum order.
    List<Option<int>> variantOptions = [
      Option<int>(value: 0, label: GSVariants.solid.name),
      Option<int>(value: 1, label: GSVariants.outline.name),
      Option<int>(value: 2, label: GSVariants.link.name),
    ];
    //Need to add value according to GSSizes enum order.
    List<Option<int>> sizeOptions = [
      Option<int>(value: 1, label: GSSizes.$xs.name),
      Option<int>(value: 2, label: GSSizes.$sm.name),
      Option<int>(value: 3, label: GSSizes.$md.name),
      Option<int>(value: 4, label: GSSizes.$lg.name),
    ];

    return materialWrapper(
        context,
        Storybook(
          initialStory: 'Button',
          stories: [
            Story(
              name: 'Button',
              builder: (context) => GSButton(
                action: GSActions.values[context.knobs.options(
                    label: 'Action', initial: 0, options: actionOptions)],
                variant: GSVariants.values[context.knobs.options(
                    label: 'Variant', initial: 0, options: variantOptions)],
                size: GSSizes.values[context.knobs
                    .options(label: 'Size', initial: 3, options: sizeOptions)],
                isDisabled:
                    context.knobs.boolean(label: "isDisabled", initial: false),
                isFocusVisible: context.knobs
                    .boolean(label: "isFocusVisible", initial: false),
                child: const GSHStack(
                  children: [
                    GSButtonText(text: "Add"),
                    GSButtonIcon(icon: Icons.add)
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ));
  }
}
