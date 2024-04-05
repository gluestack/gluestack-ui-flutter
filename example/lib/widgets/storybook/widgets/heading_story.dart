import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final List<Option<int>> sizeOptions = [
  Option<int>(value: 0, label: GSHeadingSizes.$xs.name),
  Option<int>(value: 1, label: GSHeadingSizes.$sm.name),
  Option<int>(value: 2, label: GSHeadingSizes.$md.name),
  Option<int>(value: 3, label: GSHeadingSizes.$lg.name),
  Option<int>(value: 4, label: GSHeadingSizes.$xl.name),
  Option<int>(value: 5, label: GSHeadingSizes.$2xl.name),
  Option<int>(value: 6, label: GSHeadingSizes.$3xl.name),
  Option<int>(value: 7, label: GSHeadingSizes.$4xl.name),
  Option<int>(value: 8, label: GSHeadingSizes.$5xl.name),
];

final class HeadingStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSHeading(
        text: 'This is an example for a Heading',
        size: GSHeadingSizes.values[context.knobs
            .options(label: 'Sizes', initial: 0,options: sizeOptions)],
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
