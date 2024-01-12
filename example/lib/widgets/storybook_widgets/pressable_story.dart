import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/storybook_widgets/base_story_widget.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final class PressableStory extends StoryWidget {
  @override
  Story createStoryWidget() {
    return Story(
      name: storyName,
      builder: (context) => GSPressable(
        hitSlop: 10,
        style: GSStyle(
          bg: Colors.blue,
          onHover: GSStyle(color: Colors.lightBlue),
          onFocus: GSStyle(borderColor: Colors.red, borderWidth: 10),
        ),
        onPress: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Button Pressed!'),
            duration: Duration(milliseconds: 300),
          ));
        },
        onLongPress: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Long Pressed Triggered!'),
            duration: Duration(milliseconds: 300),
          ));
        },
        child: GSText(
          text: 'Press Me',
          underline: true,
          style: GSStyle(
              color: Colors.blue,
              textStyle: TextStyle(letterSpacing: $GSLetterSpacing.$lg)),
        ),
      ),
    );
  }

  @override
  String get routePath => "pressable-preview";

  @override
  String get storyName => "Pressable";
}
