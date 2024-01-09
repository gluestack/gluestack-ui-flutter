import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

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

final class ToastStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) {
        final action = GSActions.values[context.knobs
            .options(label: 'Action', initial: 9, options: actionOptions)];

        final variant = GSVariants.values[context.knobs
            .options(label: 'Variant', initial: 0, options: variantOptions)];

        return GSButton(
          size: GSSizes.$lg,
          child: const GSButtonText(text: "Click Me"),
          onPressed: () {
            showToast(
              context,
              child: GSToast(
                action: action,
                variant: variant,
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
        );
      },
    );
  }

  @override
  String get routePath => "toastPreview";

  @override
  String get storyName => "Toast";
}
