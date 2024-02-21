import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSTextAreaSizes.$sm.name),
  Option<int>(value: 1, label: GSTextAreaSizes.$md.name),
  Option<int>(value: 2, label: GSTextAreaSizes.$lg.name),
  Option<int>(value: 3, label: GSTextAreaSizes.$xl.name),
];

final class TextareaStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSTextArea(
        size: GSTextAreaSizes.values[context.knobs
            .options(label: 'Size', initial: 1, options: sizeOptions)],
        isDisabled: context.knobs.boolean(label: "isDisabled", initial: false),
        isInvalid: context.knobs.boolean(label: "isInvalid", initial: false),
        isReadOnly: context.knobs.boolean(label: "isReadOnly", initial: false),
        hintText: "Enter text here",
        style: GSStyle(
          width: 300,
        ),
      ),
    );
  }

  @override
  String get routePath => "textarea-preview";

  @override
  String get storyName => "Textarea";
}
