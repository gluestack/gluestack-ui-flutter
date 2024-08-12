
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> sizeOptions = generateEnumOptions(GSModalSizes.values);

final class ModalStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
        name: storyName,
        builder: (context) => GSModal(
            size: GSModalSizes.values[context.knobs
                .options(label: 'Size', initial: 0, options: sizeOptions)],
            content: GSModalContent(
              header: const GSModalHeader(
                // style: GSStyle(
                //   bg: Colors.pink,
                // ),
                child: GSText(
                  text: "Header",
                ),
              ),
              body: const GSModalBody(
                child: GSText(
                  text:
                      "Are you sure you want to deactivate your account? Your data will be permanently removed and cannot be undone.",
                ),
              ),
              footer: GSModalFooter(
                child: GSButtonGroup(
                  buttons: [
                    GSButton(
                        action: GSButtonActions.positive,
                        variant: GSButtonVariants.outline,
                        child: const GSText(
                          text: "Yes",
                        ),
                        onPressed: () {}),
                    GSButton(
                        action: GSButtonActions.negative,
                        variant: GSButtonVariants.outline,
                        child: const GSText(
                          text: "No",
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
            child: const GSBadge(
              text: GSBadgeText("Show Modal"),
            )));
  }

  @override
  String get routePath => "modal-preview";

  @override
  String get storyName => "Modal";
}
