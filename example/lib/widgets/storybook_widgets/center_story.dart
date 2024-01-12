import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class CenterStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSCenter(
        style: GSStyle(
          height: 150,
          width: 300,
          bg: $GSColors.primary500,
        ),
        child: const GSCenter(child: Text('This is the Center')),
      ),
    );
  }

  @override
  String get routePath => "center-preview";

  @override
  String get storyName => "Center";
}
