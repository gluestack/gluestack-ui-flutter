import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSActions enum order.
List<Option<int>> actionOptions = [
  Option<int>(value: 0, label: GSToastActions.success.name),
  Option<int>(value: 1, label: GSToastActions.info.name),
  Option<int>(value: 2, label: GSToastActions.error.name),
  Option<int>(value: 3, label: GSToastActions.warning.name),
  Option<int>(value: 4, label: GSToastActions.attention.name),
];
//Need to add value according to GSVariants enum order.
List<Option<int>> variantOptions = [
  Option<int>(value: 0, label: GSToastVariants.solid.name),
  Option<int>(value: 1, label: GSToastVariants.outline.name),
  Option<int>(value: 2, label: GSToastVariants.accent.name),
];

final class ToastStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) {
        final action = GSToastActions.values[context.knobs
            .options(label: 'Action', initial: 1, options: actionOptions)];

        final variant = GSToastVariants.values[context.knobs
            .options(label: 'Variant', initial: 0, options: variantOptions)];

        return GSButton(
          size: GSButtonSizes.$lg,
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
                      title: "Toast Title",
                    ),
                    GSToastDescription(
                      description: "Here is the toast description!",
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
  String get routePath => "toast-preview";

  @override
  String get storyName => "Toast";
}
