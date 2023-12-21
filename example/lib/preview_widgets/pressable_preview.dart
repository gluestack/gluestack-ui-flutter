import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class PressablePreview extends StatelessWidget {
  const PressablePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Pressable',
        stories: [
          Story(
            name: 'Pressable',
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
          ),
        ],
      ),
    );
  }
}
