import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> actionOptions =
    generateEnumOptions(GSToastActions.values);

final List<Option<int>> variantOptions =
    generateEnumOptions(GSToastVariants.values);

final class ToastStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) {
        final action = GSToastActions.values[context.knobs
            .options(label: 'Action', initial: 0, options: actionOptions)];

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
