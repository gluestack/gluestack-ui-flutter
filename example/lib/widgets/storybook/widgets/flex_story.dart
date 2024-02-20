import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook/widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class FlexStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSFlex(
        style: GSStyle(
          direction: Axis.vertical,
          lg: GSStyle(direction: Axis.horizontal),
        ),
        children: [
          GSBox(
            style: GSStyle(
              height: 150,
              width: 150,
              bg: Colors.red,
            ),
          ),
          GSBox(
            style: GSStyle(
              height: 150,
              width: 150,
              bg: Colors.green,
            ),
          ),
          GSBox(
            style: GSStyle(
              height: 150,
              width: 150,
              bg: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  @override
  String get routePath => "flex-preview";

  @override
  String get storyName => "Flex";
}
