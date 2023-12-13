import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CenterPreview extends StatelessWidget {
  const CenterPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: 'Center',
      stories: [
        Story(
          name: 'Center',
          description:
              'The Center component comes in handy when you need to center-align content.',
          builder: (context) => GSCenter(
            style: GSStyle(
              height: 150,
              width: 300,
              bg: $GSColors.primary500,
            ),
            child: const GSCenter(child: Text('This is the Center')),
          ),
        ),
      ],
    );
  }
}
