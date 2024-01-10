import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

//Need to add value according to GSSizes enum order.
List<Option<int>> sizeOptions = [
  Option<int>(value: 2, label: GSSizes.$sm.name),
  Option<int>(value: 3, label: GSSizes.$md.name),
  Option<int>(value: 4, label: GSSizes.$lg.name),
  Option<int>(value: 5, label: GSSizes.$xl.name),
];

final class TextareaStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSTextArea(
        size: GSSizes.values[context.knobs
            .options(label: 'Size', initial: 3, options: sizeOptions)],
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
  String get routePath => "textareaPreview";

  @override
  String get storyName => "Textarea";
}
