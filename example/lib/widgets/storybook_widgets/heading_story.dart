import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class HeadingStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSHeading(
        text: 'This is an example for a Heading',
        style: GSStyle(textStyle: const TextStyle(letterSpacing: 2)),
      ),
    );
  }

  @override
  String get routePath => "headingPreview";

  @override
  String get storyName => "Heading";
}
