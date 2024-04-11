import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> sizeOptions =
    generateEnumOptions(GSHeadingSizes.values);

final class HeadingStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSHeading(
        text: 'This is an example for a Heading',
        size: GSHeadingSizes.values
            .where((element) =>
                element.name ==
                sizeOptions[context.knobs.options(
                        label: 'Sizes', initial: 0, options: sizeOptions)]
                    .label)
            .first,
        bold: context.knobs.boolean(label: "bold", initial: false),
        italic: context.knobs.boolean(label: "italic", initial: false),
        strikeThrough:
            context.knobs.boolean(label: "strikeThrough", initial: false),
        underline: context.knobs.boolean(label: "underline", initial: false),
        sub: context.knobs.boolean(label: "sub", initial: false),
        isTruncated:
            context.knobs.boolean(label: "isTruncated", initial: false),
      ),
    );
  }

  @override
  String get routePath => "heading-preview";

  @override
  String get storyName => "Heading";
}
