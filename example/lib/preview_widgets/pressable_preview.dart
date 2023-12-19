import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class PressablePreview extends StatelessWidget {
  const PressablePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: 'Pressable',
      stories: [
        Story(
          name: 'Pressable',
          description:
              'By providing access to hover, pressed, and focus events, Pressable serves as a more flexible alternative to buttons at a lower level of abstraction. It is a useful primitive for advanced customization needs.',
          builder: (context) => GSPressable(
            hitSlop: 10,
            style: GSStyle(
              bg: Colors.blue,
              onHover: GSStyle(color: Colors.lightBlue),
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
            child: const GSText(
              text: 'Press Me',
              underline: true,
            ),
          ),
        ),
      ],
    );
  }
}
