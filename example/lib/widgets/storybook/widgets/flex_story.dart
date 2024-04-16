import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class FlexStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSFlex(
        style: GlueStyle(
          direction: Axis.vertical,
          lg: GlueStyle(direction: Axis.horizontal),
        ),
        children: [
          GSBox(
            style: GlueStyle(
              height: 150,
              width: 150,
              bg: Colors.red,
            ),
          ),
          GSBox(
            style: GlueStyle(
              height: 150,
              width: 150,
              bg: Colors.green,
            ),
          ),
          GSBox(
            style: GlueStyle(
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
