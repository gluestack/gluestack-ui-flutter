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
              header:  GSModalHeader(
                style: GSStyle(
                textStyle: TextStyle(
                   color: GSTheme.of(context).background900,
                   fontWeight: FontWeight.bold
                )
                ),
                child: const GSText(
                  text: "Invite your team",
                ),
              ),
              body: const GSModalBody(
                child: GSText(
                  text:
                      "Elevate user interactions with our versatile modals. Seamlessly integrate notifications, forms, and media displays. Make an impact effortlessly.",
                ),
              ),
              footer: GSModalFooter(
                child: GSButtonGroup(
                  buttons: [
                    GSButton(
                        action: GSButtonActions.primary,
                        variant: GSButtonVariants.outline,
                        child: const GSText(
                          text: "Cancel",
                        ),
                        onPressed: () {
                          // context.pop();
                        }),
                    GSButton(
                        action: GSButtonActions.primary,
                        variant: GSButtonVariants.solid,
                        child: const GSText(
                          text: "Explore",
                        ),
                        onPressed: () {
                          // context.pop();
                        }),
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
