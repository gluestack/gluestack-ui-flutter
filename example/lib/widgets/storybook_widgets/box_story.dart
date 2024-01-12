import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class BoxStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSBox(
        style: GSStyle(
          padding: EdgeInsets.all($GSSpace.$5),
          bg: $GSColors.primary500,
        ),
        child: const Text('This is the Box'),
      ),
    );
  }

  @override
  String get routePath => "boxPreview";

  @override
  String get storyName => "Box";
}
