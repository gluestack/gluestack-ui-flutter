import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ToastPreview extends StatelessWidget {
  const ToastPreview({super.key});

  @override
  Widget build(BuildContext context) {
    //Need to add value according to GSActions enum order.
    List<Option<int>> actionOptions = [
      Option<int>(value: 6, label: GSActions.success.name),
      Option<int>(value: 7, label: GSActions.info.name),
      Option<int>(value: 4, label: GSActions.error.name),
      Option<int>(value: 5, label: GSActions.warning.name),
      Option<int>(value: 9, label: GSActions.attention.name),
    ];
    //Need to add value according to GSVariants enum order.
    List<Option<int>> variantOptions = [
      Option<int>(value: 5, label: GSVariants.accent.name),
      Option<int>(value: 0, label: GSVariants.solid.name),
      Option<int>(value: 1, label: GSVariants.outline.name),
    ];

    return Storybook(
      initialStory: 'Toast',
      stories: [
        Story(
          name: 'Toast',
          description:
              'Toast is a component that can display alerts, notifications, or messages on top of an overlay layer. It is commonly used to inform users of important information or actions.',
          builder: (context) => GSButton(
            size: GSSizes.$lg,
            child: const GSButtonText(text: "Click Me"),
            onPressed: () {
              showToast(
                context,
                child: GSToast(
                  action: GSActions.values[context.knobs.options(
                      label: 'Action', initial: 9, options: actionOptions)],
                  variant: GSVariants.values[context.knobs.options(
                      label: 'Variant', initial: 0, options: variantOptions)],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GSToastTitle(
                        title: "Hey",
                      ),
                      GSToastDescription(
                        description: "Desc Desc Desc Desc Desc Desc ",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
