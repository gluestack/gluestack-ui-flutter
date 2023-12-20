import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class HeadingPreview extends StatelessWidget {
  const HeadingPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return materialWrapper(
      context,
      Storybook(
        initialStory: 'Heading',
        stories: [
          Story(
            name: 'Heading',
            builder: (context) => GSHeading(
              text: 'I am a Heading',
              style: GSStyle(textStyle: const TextStyle(letterSpacing: 2)),
            ),
          ),
        ],
      ),
    );
  }
}
