import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class PressableWithStatesPreview extends StatelessWidget {
  const PressableWithStatesPreview({super.key});

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
              style: GSStyle(
                  bg: $GSColors.blue600,
                  onHover: GSStyle(
                    color: $GSColors.blue900,
                  )),
              hitSlop: 10,
              onPress: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text('Button Pressed!'),
                  duration: Duration(milliseconds: 300),
                ));
              },
              onLongPress: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Long Pressed Triggered!'),
                  duration: Duration(milliseconds: 300),
                ));
              },
              child: const GSHeading(
                text: 'PRESSABLE',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
